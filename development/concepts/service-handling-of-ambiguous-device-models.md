---
description: Perform handling of ambiguous device models.
---

# Service Handling of Ambiguous Device Models

When new NED versions with diverging XML namespaces are introduced, adaptations might be needed in the services for these new NEDs. But not necessarily; it depends on where in the specific NED models the ambiguities reside. Existing services might not refer to these parts of the model and in that case, they do not need any adaptations.

Finding out if and where services need adaptations can be non-trivial. An important exception is template services which check and point out ambiguities at load time (NSO startup). In Java or Python code this is harder and essentially falls back to code reviews and testing.

The changes in service code to handle ambiguities are straightforward but different for templates and code.

## Template Services <a href="#d5e8316" id="d5e8316"></a>

In templates, there are new processing instructions `if-ned-id` and `elif-ned-id`. When the template specifies a node in an XML namespace where an ambiguity exists, the `if-ned-id` process instruction is used to resolve that ambiguity.

The processing instruction `else` can be used in conjunction with `if-ned-id` and `elif-ned-id` to capture all other NED IDs.

For the nodes in the XML namespace where no ambiguities occur, this process instruction is not necessary.

```
<config-template xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device foreach="{apache-device}">
      <name>{current()}</name>
      <config>
        <?if-ned-id apache-nc-1.0:apache-nc-1.0?>
          <vhosts xmlns="urn:apache">
            <vhost>
              <hostname>{/vhost}</hostname>
              <doc-root>/srv/www/{/vhost}</doc-root>
            </vhost>
          </vhosts>
        <?elif-ned-id apache-nc-1.1:apache-nc-1.1?>
          <public xmlns="urn:apache">
            <vhosts>
              <vhost>
                <hostname>{/vhost}</hostname>
                <aliases>{/vhost}.public</aliases>
                <doc-root>/srv/www/{/vhost}</doc-root>
              </vhost>
            </vhosts>
          </public>
        <?end?>
      </config>
    </device>
  </devices>
</config-template>
```

## Java Services <a href="#d5e8330" id="d5e8330"></a>

In Java, the service code must handle the ambiguities by code where the devices' `ned-id` is tested before setting the nodes and values for the diverging paths.

The `ServiceContext` class has a new convenience method, `getNEDIdByDeviceName` which helps retrieve the `ned-id` from the device name string.

```
    @ServiceCallback(servicePoint="websiteservice",
                     callType=ServiceCBType.CREATE)
    public Properties create(ServiceContext context,
                             NavuNode service,
                             NavuNode root,
                             Properties opaque)
                             throws DpCallbackException {

...

                NavuLeaf elemName = elem.leaf(Ncs._name_);
                NavuContainer md = root.container(Ncs._devices_).
                    list(Ncs._device_).elem(elemName.toKey());

                String ipv4Str = baseIp + ((subnet<<3) + server);
                String ipv6Str = "::ff:ff:" + ipv4Str;
                String ipStr = ipv4Str;
                String nedIdStr =
                    context.getNEDIdByDeviceName(elemName.valueAsString());
                if ("webserver-nc-1.0:webserver-nc-1.0".equals(nedIdStr)) {
                    ipStr = ipv4Str;
                } else if ("webserver2-nc-1.0:webserver2-nc-1.0"
                           .equals(nedIdStr)) {
                    ipStr = ipv6Str;
                }

                md.container(Ncs._config_).
                    container(webserver.prefix, webserver._wsConfig_).
                    list(webserver._listener_).
                    sharedCreate(new String[] {ipStr, ""+8008});

                ms.list(lb._backend_).sharedCreate(
                    new String[]{baseIp + ((subnet<<3) + server++),
                                 ""+8008});
...

            return opaque;
        } catch (Exception e) {
            throw new DpCallbackException("Service create failed", e);
        }

    }
```

## Python Services <a href="#d5e8338" id="d5e8338"></a>

In the Python API, there is also a need to handle ambiguities by checking the `ned-id` before setting the diverging paths. Use `get_ned_id()` from `ncs.application` to resolve NED IDs.

```
import ncs

def _get_device(service, name):
    dev_path = '/ncs:devices/ncs:device{%s}' % (name, )
    return ncs.maagic.cd(service, dev_path)

class ServiceCallbacks(Service):
    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        self.log.info('Service create(service=', service._path, ')')

        for name in service.apache_device:
            self.create_apache_device(service, name)

        template = ncs.template.Template(service)
        self.log.info(
            'applying web-server-template for device {}'.format(name))
        template.apply('web-server-template')
        self.log.info(
            'applying load-balancer-template for device {}'.format(name))
        template.apply('load-balancer-template')

    def create_apache_device(self, service, name):
        dev = _get_device(service, name)
        if 'apache-nc-1.0:apache-nc-1.0' == ncs.application.get_ned_id(dev):
            self.create_apache1_device(dev)
        elif 'apache-nc-1.1:apache-nc-1.1' == ncs.application.get_ned_id(dev):
            self.create_apache2_device(dev)
        else:
            raise Exception('unknown ned-id {}'.format(get_ned_id(dev)))

    def create_apache1_device(self, dev):
        self.log.info(
            'creating config for apache1 device {}'.format(dev.name))
        dev.config.ap__listen_ports.listen_port.create(("*", 8080))
        dev.config.ap__clash = dev.name

    def create_apache2_device(self, dev):
        self.log.info(
            'creating config for apache2 device {}'.format(dev.name))
        dev.config.ap__system.listen_ports.listen_port.create(("*", 8080))
        dev.config.ap__clash = dev.name
```
