# confd_lib_maapi Man Page

`confd_lib_maapi` - MAAPI (Management Agent API). A library for
connecting to NCS

## Synopsis

    #include <confd_lib.h>
    #include <confd_maapi.h>

    int maapi_start_user_session(
    int sock, const char *username, const char *context, const char **groups, 
    int numgroups, const struct confd_ip *src_addr, enum confd_proto prot);

    int maapi_start_user_session2(
    int sock, const char *username, const char *context, const char **groups, 
    int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot);

    int maapi_start_trans(
    int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite);

    int maapi_start_trans2(
    int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid);

    int maapi_start_trans_flags(
    int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid, 
    int flags);

    int maapi_connect(
    int sock, const struct sockaddr* srv, int srv_sz);

    int maapi_load_schemas(
    int sock);

    int maapi_load_schemas_list(
    int sock, int flags, const uint32_t *nshash, const int *nsflags, int num_ns);

    int maapi_get_schema_file_path(
    int sock, char **buf);

    int maapi_close(
    int sock);

    int maapi_start_user_session_gen(
    int sock, const char *username, const char *context, const char **groups, 
    int numgroups, const char *vendor, const char *product, const char *version, 
    const char *client_id);

    int maapi_start_user_session3(
    int sock, const char *username, const char *context, const char **groups, 
    int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot, 
    const char *vendor, const char *product, const char *version, const char *client_id);

    int maapi_end_user_session(
    int sock);

    int maapi_kill_user_session(
    int sock, int usessid);

    int maapi_get_user_sessions(
    int sock, int res[], int n);

    int maapi_get_user_session(
    int sock, int usessid, struct confd_user_info *us);

    int maapi_get_my_user_session_id(
    int sock);

    int maapi_set_user_session(
    int sock, int usessid);

    int maapi_get_user_session_identification(
    int sock, int usessid, struct confd_user_identification *uident);

    int maapi_get_user_session_opaque(
    int sock, int usessid, char **opaque);

    int maapi_get_authorization_info(
    int sock, int usessid, struct confd_authorization_info **ainfo);

    int maapi_set_next_user_session_id(
    int sock, int usessid);

    int maapi_lock(
    int sock, enum confd_dbname name);

    int maapi_unlock(
    int sock, enum confd_dbname name);

    int maapi_is_lock_set(
    int sock, enum confd_dbname name);

    int maapi_lock_partial(
    int sock, enum confd_dbname name, char *xpaths[], int nxpaths, int *lockid);

    int maapi_unlock_partial(
    int sock, int lockid);

    int maapi_candidate_validate(
    int sock);

    int maapi_delete_config(
    int sock, enum confd_dbname name);

    int maapi_candidate_commit(
    int sock);

    int maapi_candidate_commit_persistent(
    int sock, const char *persist_id);

    int maapi_candidate_commit_info(
    int sock, const char *persist_id, const char *label, const char *comment);

    int maapi_candidate_confirmed_commit(
    int sock, int timeoutsecs);

    int maapi_candidate_confirmed_commit_persistent(
    int sock, int timeoutsecs, const char *persist, const char *persist_id);

    int maapi_candidate_confirmed_commit_info(
    int sock, int timeoutsecs, const char *persist, const char *persist_id, 
    const char *label, const char *comment);

    int maapi_candidate_abort_commit(
    int sock);

    int maapi_candidate_abort_commit_persistent(
    int sock, const char *persist_id);

    int maapi_candidate_reset(
    int sock);

    int maapi_confirmed_commit_in_progress(
    int sock);

    int maapi_copy_running_to_startup(
    int sock);

    int maapi_is_running_modified(
    int sock);

    int maapi_is_candidate_modified(
    int sock);

    int maapi_start_trans_flags2(
    int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid, 
    int flags, const char *vendor, const char *product, const char *version, 
    const char *client_id);

    int maapi_start_trans_in_trans(
    int sock, enum confd_trans_mode readwrite, int usid, int thandle);

    int maapi_finish_trans(
    int sock, int thandle);

    int maapi_validate_trans(
    int sock, int thandle, int unlock, int forcevalidation);

    int maapi_prepare_trans(
    int sock, int thandle);

    int maapi_prepare_trans_flags(
    int sock, int thandle, int flags);

    int maapi_commit_trans(
    int sock, int thandle);

    int maapi_abort_trans(
    int sock, int thandle);

    int maapi_apply_trans(
    int sock, int thandle, int keepopen);

    int maapi_apply_trans_flags(
    int sock, int thandle, int keepopen, int flags);

    int maapi_ncs_apply_trans_params(
    int sock, int thandle, int keepopen, confd_tag_value_t *params, int nparams, 
    confd_tag_value_t **values, int *nvalues);

    int maapi_ncs_get_trans_params(
    int sock, int thandle, confd_tag_value_t **values, int *nvalues);

    int maapi_get_rollback_id(
    int sock, int thandle, int *fixed_id);

    int maapi_set_namespace(
    int sock, int thandle, int hashed_ns);

    int maapi_cd(
    int sock, int thandle, const char *fmt, ...);

    int maapi_pushd(
    int sock, int thandle, const char *fmt, ...);

    int maapi_popd(
    int sock, int thandle);

    int maapi_getcwd(
    int sock, int thandle, size_t strsz, char *curdir);

    int maapi_getcwd2(
    int sock, int thandle, size_t *strsz, char *curdir);

    int maapi_getcwd_kpath(
    int sock, int thandle, confd_hkeypath_t **kp);

    int maapi_exists(
    int sock, int thandle, const char *fmt, ...);

    int maapi_num_instances(
    int sock, int thandle, const char *fmt, ...);

    int maapi_get_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, ...);

    int maapi_get_int8_elem(
    int sock, int thandle, int8_t *rval, const char *fmt, ...);

    int maapi_get_int16_elem(
    int sock, int thandle, int16_t *rval, const char *fmt, ...);

    int maapi_get_int32_elem(
    int sock, int thandle, int32_t *rval, const char *fmt, ...);

    int maapi_get_int64_elem(
    int sock, int thandle, int64_t *rval, const char *fmt, ...);

    int maapi_get_u_int8_elem(
    int sock, int thandle, uint8_t *rval, const char *fmt, ...);

    int maapi_get_u_int16_elem(
    int sock, int thandle, uint16_t *rval, const char *fmt, ...);

    int maapi_get_u_int32_elem(
    int sock, int thandle, uint32_t *rval, const char *fmt, ...);

    int maapi_get_u_int64_elem(
    int sock, int thandle, uint64_t *rval, const char *fmt, ...);

    int maapi_get_ipv4_elem(
    int sock, int thandle, struct in_addr *rval, const char *fmt, ...);

    int maapi_get_ipv6_elem(
    int sock, int thandle, struct in6_addr *rval, const char *fmt, ...);

    int maapi_get_double_elem(
    int sock, int thandle, double *rval, const char *fmt, ...);

    int maapi_get_bool_elem(
    int sock, int thandle, int *rval, const char *fmt, ...);

    int maapi_get_datetime_elem(
    int sock, int thandle, struct confd_datetime *rval, const char *fmt, ...);

    int maapi_get_date_elem(
    int sock, int thandle, struct confd_date *rval, const char *fmt, ...);

    int maapi_get_time_elem(
    int sock, int thandle, struct confd_time *rval, const char *fmt, ...);

    int maapi_get_duration_elem(
    int sock, int thandle, struct confd_duration *rval, const char *fmt, ...);

    int maapi_get_enum_value_elem(
    int sock, int thandle, int32_t *rval, const char *fmt, ...);

    int maapi_get_bit32_elem(
    int sock, int thandle, uint32_t *rval, const char *fmt, ...);

    int maapi_get_bit64_elem(
    int sock, int thandle, uint64_t *rval, const char *fmt, ...);

    int maapi_get_bitbig_elem(
    int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
    ...);

    int maapi_get_objectref_elem(
    int sock, int thandle, confd_hkeypath_t **rval, const char *fmt, ...);

    int maapi_get_oid_elem(
    int sock, int thandle, struct confd_snmp_oid **rval, const char *fmt, 
    ...);

    int maapi_get_buf_elem(
    int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
    ...);

    int maapi_get_str_elem(
    int sock, int thandle, char *buf, int n, const char *fmt, ...);

    int maapi_get_binary_elem(
    int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
    ...);

    int maapi_get_hexstr_elem(
    int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
    ...);

    int maapi_get_qname_elem(
    int sock, int thandle, unsigned char **prefix, int *prefixsz, unsigned char **name, 
    int *namesz, const char *fmt, ...);

    int maapi_get_list_elem(
    int sock, int thandle, confd_value_t **values, int *n, const char *fmt, 
    ...);

    int maapi_get_ipv4prefix_elem(
    int sock, int thandle, struct confd_ipv4_prefix *rval, const char *fmt, 
    ...);

    int maapi_get_ipv6prefix_elem(
    int sock, int thandle, struct confd_ipv6_prefix *rval, const char *fmt, 
    ...);

    int maapi_get_decimal64_elem(
    int sock, int thandle, struct confd_decimal64 *rval, const char *fmt, 
    ...);

    int maapi_get_identityref_elem(
    int sock, int thandle, struct confd_identityref *rval, const char *fmt, 
    ...);

    int maapi_get_ipv4_and_plen_elem(
    int sock, int thandle, struct confd_ipv4_prefix *rval, const char *fmt, 
    ...);

    int maapi_get_ipv6_and_plen_elem(
    int sock, int thandle, struct confd_ipv6_prefix *rval, const char *fmt, 
    ...);

    int maapi_get_dquad_elem(
    int sock, int thandle, struct confd_dotted_quad *rval, const char *fmt, 
    ...);

    int maapi_vget_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);

    int maapi_init_cursor(
    int sock, int thandle, struct maapi_cursor *mc, const char *fmt, ...);

    int maapi_get_next(
    struct maapi_cursor *mc);

    int maapi_find_next(
    struct maapi_cursor *mc, enum confd_find_next_type type, confd_value_t *inkeys, 
    int n_inkeys);

    void maapi_destroy_cursor(
    struct maapi_cursor *mc);

    int maapi_set_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, ...);

    int maapi_set_elem2(
    int sock, int thandle, const char *strval, const char *fmt, ...);

    int maapi_vset_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);

    int maapi_create(
    int sock, int thandle, const char *fmt, ...);

    int maapi_delete(
    int sock, int thandle, const char *fmt, ...);

    int maapi_get_object(
    int sock, int thandle, confd_value_t *values, int n, const char *fmt, 
    ...);

    int maapi_get_objects(
    struct maapi_cursor *mc, confd_value_t *values, int n, int *nobj);

    int maapi_get_values(
    int sock, int thandle, confd_tag_value_t *values, int n, const char *fmt, 
    ...);

    int maapi_set_object(
    int sock, int thandle, const confd_value_t *values, int n, const char *fmt, 
    ...);

    int maapi_set_values(
    int sock, int thandle, const confd_tag_value_t *values, int n, const char *fmt, 
    ...);

    int maapi_get_case(
    int sock, int thandle, const char *choice, confd_value_t *rcase, const char *fmt, 
    ...);

    int maapi_get_attrs(
    int sock, int thandle, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
    int *num_vals, const char *fmt, ...);

    int maapi_set_attr(
    int sock, int thandle, uint32_t attr, confd_value_t *v, const char *fmt, 
    ...);

    int maapi_delete_all(
    int sock, int thandle, enum maapi_delete_how how);

    int maapi_revert(
    int sock, int thandle);

    int maapi_set_flags(
    int sock, int thandle, int flags);

    int maapi_set_delayed_when(
    int sock, int thandle, int on);

    int maapi_set_label(
    int sock, int thandle, const char *label);

    int maapi_set_comment(
    int sock, int thandle, const char *comment);

    int maapi_copy(
    int sock, int from_thandle, int to_thandle);

    int maapi_copy_path(
    int sock, int from_thandle, int to_thandle, const char *fmt, ...);

    int maapi_copy_tree(
    int sock, int thandle, const char *from, const char *tofmt, ...);

    int maapi_insert(
    int sock, int thandle, const char *fmt, ...);

    int maapi_move(
    int sock, int thandle, confd_value_t* tokey, int n, const char *fmt, ...);

    int maapi_move_ordered(
    int sock, int thandle, enum maapi_move_where where, confd_value_t* tokey, 
    int n, const char *fmt, ...);

    int maapi_shared_create(
    int sock, int thandle, int flags, const char *fmt, ...);

    int maapi_shared_set_elem(
    int sock, int thandle, confd_value_t *v, int flags, const char *fmt, ...);

    int maapi_shared_set_elem2(
    int sock, int thandle, const char *strval, int flags, const char *fmt, 
    ...);

    int maapi_shared_set_values(
    int sock, int thandle, const confd_tag_value_t *values, int n, int flags, 
    const char *fmt, ...);

    int maapi_shared_insert(
    int sock, int thandle, int flags, const char *fmt, ...);

    int maapi_shared_copy_tree(
    int sock, int thandle, int flags, const char *from, const char *tofmt, 
    ...);

    int maapi_ncs_apply_template(
    int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
    int num_variables, int flags, const char *rootfmt, ...);

    int maapi_shared_ncs_apply_template(
    int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
    int num_variables, int flags, const char *rootfmt, ...);

    int maapi_ncs_get_templates(
    int sock, char ***templates, int *num_templates);

    int maapi_ncs_write_service_log_entry(
    int sock, const char *msg, confd_value_t *type, confd_value_t *level, 
    const char *fmt, ...);

    int maapi_report_progress(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg);

    int maapi_report_progress2(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
    const char *package);

    unsigned long long maapi_report_progress_start(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
    const char *package);

    int maapi_report_progress_stop(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
    const char *annotation, const char *package, unsigned long long timestamp);

    int maapi_report_service_progress(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
    const char *fmt, ...);

    int maapi_report_service_progress2(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
    const char *package, const char *fmt, ...);

    unsigned long long maapi_report_service_progress_start(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
    const char *package, const char *fmt, ...);

    int maapi_report_service_progress_stop(
    int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
    const char *annotation, const char *package, unsigned long long timestamp, 
    const char *fmt, ...);

    int maapi_start_progress_span(
    int sock, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
    const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
    int num_links, const char *path_fmt, ...);

    int maapi_start_progress_span_th(
    int sock, int thandle, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
    const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
    int num_links, const char *path_fmt, ...);

    int maapi_progress_info(
    int sock, const char *msg, enum confd_progress_verbosity verbosity, const struct ncs_name_value *attrs, 
    int num_attrs, const struct confd_progress_link *links, int num_links, 
    const char *path_fmt, ...);

    int maapi_progress_info_th(
    int sock, int thandle, const char *msg, enum confd_progress_verbosity verbosity, 
    const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
    int num_links, const char *path_fmt, ...);

    int maapi_end_progress_span(
    int sock, const confd_progress_span *span, const char *annotation);

    int maapi_cs_node_children(
    int sock, int thandle, struct confd_cs_node *mount_point, struct confd_cs_node ***children, 
    int *num_children, const char *fmt, ...);

    int maapi_authenticate(
    int sock, const char *user, const char *pass, char *groups[], int n);

    int maapi_authenticate2(
    int sock, const char *user, const char *pass, const struct confd_ip *src_addr, 
    int src_port, const char *context, enum confd_proto prot, char *groups[], 
    int n);

    int maapi_validate_token(
    int sock, const char *token, const struct confd_ip *src_addr, int src_port, 
    const char *context, enum confd_proto prot, char *groups[], int n);

    int maapi_attach(
    int sock, int hashed_ns, struct confd_trans_ctx *ctx);

    int maapi_attach2(
    int sock, int hashed_ns, int usid, int thandle);

    int maapi_attach_init(
    int sock, int *thandle);

    int maapi_detach(
    int sock, struct confd_trans_ctx *ctx);

    int maapi_detach2(
    int sock, int thandle);

    int maapi_diff_iterate(
    int sock, int thandle, enum maapi_iter_ret (*iter
          kp, enum maapi_iter_op op, 
    confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate);

    int maapi_keypath_diff_iterate(
    int sock, int thandle, enum maapi_iter_ret (*iter
          kp, enum maapi_iter_op op, 
    confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate, 
    const char *fmtpath, ...);

    int maapi_diff_iterate_resume(
    int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
          kp, 
    enum maapi_iter_op op, confd_value_t *oldv, confd_value_t *newv, void *state, 
    void *resumestate);

    int maapi_iterate(
    int sock, int thandle, enum maapi_iter_ret (*iter
          kp, confd_value_t *v, 
    confd_attr_value_t *attr_vals, int num_attr_vals, void *state, int flags, 
    void *initstate, const char *fmtpath, ...);

    int maapi_iterate_resume(
    int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
          kp, 
    confd_value_t *v, confd_attr_value_t *attr_vals, int num_attr_vals, void *state, 
    void *resumestate);

    struct confd_cs_node *maapi_cs_node_cd(
    int sock, int thandle, const char *fmt, ...);

    int maapi_get_running_db_status(
    int sock);

    int maapi_set_running_db_status(
    int sock, int status);

    int maapi_request_action(
    int sock, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
    int *nvalues, int hashed_ns, const char *fmt, ...);

    int maapi_request_action_th(
    int sock, int thandle, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
    int *nvalues, const char *fmt, ...);

    int maapi_request_action_str_th(
    int sock, int thandle, char **output, const char *cmd_fmt, const char *path_fmt, 
    ...);

    int maapi_xpath2kpath(
    int sock, const char *xpath, confd_hkeypath_t **hkp);

    int maapi_xpath2kpath_th(
    int sock, int thandle, const char *xpath, confd_hkeypath_t **hkp);

    int maapi_user_message(
    int sock, const char *to, const char *message, const char *sender);

    int maapi_sys_message(
    int sock, const char *to, const char *message);

    int maapi_prio_message(
    int sock, const char *to, const char *message);

    int maapi_cli_diff_cmd(
    int sock, int thandle, int thandle_old, char *res, int size, int flags, 
    const char *fmt, ...);

    int maapi_cli_diff_cmd2(
    int sock, int thandle, int thandle_old, char *res, int *size, int flags, 
    const char *fmt, ...);

    int maapi_cli_accounting(
    int sock, const char *user, const int usid, const char *cmdstr);

    int maapi_cli_path_cmd(
    int sock, int thandle, char *res, int size, int flags, const char *fmt, 
    ...);

    int maapi_cli_cmd_to_path(
    int sock, const char *line, char *ns, int nsize, char *path, int psize);

    int maapi_cli_cmd_to_path2(
    int sock, int thandle, const char *line, char *ns, int nsize, char *path, 
    int psize);

    int maapi_cli_prompt(
    int sock, int usess, const char *prompt, int echo, char *res, int size);

    int maapi_cli_prompt2(
    int sock, int usess, const char *prompt, int echo, int timeout, char *res, 
    int size);

    int maapi_cli_prompt_oneof(
    int sock, int usess, const char *prompt, char **choice, int count, char *res, 
    int size);

    int maapi_cli_prompt_oneof2(
    int sock, int usess, const char *prompt, char **choice, int count, int timeout, 
    char *res, int size);

    int maapi_cli_read_eof(
    int sock, int usess, int echo, char *res, int size);

    int maapi_cli_read_eof2(
    int sock, int usess, int echo, int timeout, char *res, int size);

    int maapi_cli_write(
    int sock, int usess, const char *buf, int size);

    int maapi_cli_cmd(
    int sock, int usess, const char *buf, int size);

    int maapi_cli_cmd2(
    int sock, int usess, const char *buf, int size, int flags);

    int maapi_cli_cmd3(
    int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
    int usize);

    int maapi_cli_cmd4(
    int sock, int usess, const char *buf, int size, int flags, char **unhide, 
    int usize);

    int maapi_cli_cmd_io(
    int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
    int usize);

    int maapi_cli_cmd_io2(
    int sock, int usess, const char *buf, int size, int flags, char **unhide, 
    int usize);

    int maapi_cli_cmd_io_result(
    int sock, int id);

    int maapi_cli_printf(
    int sock, int usess, const char *fmt);

    int maapi_cli_vprintf(
    int sock, int usess, const char *fmt, va_list args);

    int maapi_cli_set(
    int sock, int usess, const char *opt, const char *value);

    int maapi_cli_get(
    int sock, int usess, const char *opt, char *res, int size);

    int maapi_set_readonly_mode(
    int sock, int flag);

    int maapi_disconnect_remote(
    int sock, const char *address);

    int maapi_disconnect_sockets(
    int sock, int *sockets, int nsocks);

    int maapi_save_config(
    int sock, int thandle, int flags, const char *fmtpath, ...);

    int maapi_save_config_result(
    int sock, int id);

    int maapi_load_config(
    int sock, int thandle, int flags, const char *filename);

    int maapi_load_config_cmds(
    int sock, int thandle, int flags, const char *cmds, const char *fmt, ...);

    int maapi_load_config_stream(
    int sock, int thandle, int flags);

    int maapi_load_config_stream_result(
    int sock, int id);

    int maapi_roll_config(
    int sock, int thandle, const char *fmtpath, ...);

    int maapi_roll_config_result(
    int sock, int id);

    int maapi_get_stream_progress(
    int sock, int id);

    int maapi_xpath_eval(
    int sock, int thandle, const char *expr, int (*result
          kp, confd_value_t *v, 
    void *state, void (*trace, void *initstate, const char *fmtpath, ...);

    int maapi_xpath_eval_expr(
    int sock, int thandle, const char *expr, char **res, void (*trace, const char *fmtpath, 
    ...);

    int maapi_query_start(
    int sock, int thandle, const char *expr, const char *context_node, int chunk_size, 
    int initial_offset, enum confd_query_result_type result_as, int nselect, 
    const char *select[], int nsort, const char *sort[]);

    int maapi_query_startv(
    int sock, int thandle, const char *expr, const char *context_node, int chunk_size, 
    int initial_offset, enum confd_query_result_type result_as, int select_nparams, 
    ...);

    int maapi_query_result(
    int sock, int qh, struct confd_query_result **qrs);

    int maapi_query_result_count(
    int sock, int qh);

    int maapi_query_free_result(
    struct confd_query_result *qrs);

    int maapi_query_reset_to(
    int sock, int qh, int offset);

    int maapi_query_reset(
    int sock, int qh);

    int maapi_query_stop(
    int sock, int qh);

    int maapi_do_display(
    int sock, int thandle, const char *fmtpath, ...);

    int maapi_install_crypto_keys(
    int sock);

    int maapi_init_upgrade(
    int sock, int timeoutsecs, int flags);

    int maapi_perform_upgrade(
    int sock, const char **loadpathdirs, int n);

    int maapi_commit_upgrade(
    int sock);

    int maapi_abort_upgrade(
    int sock);

    int maapi_aaa_reload(
    int sock, int synchronous);

    int maapi_aaa_reload_path(
    int sock, int synchronous, const char *fmt, ...);

    int maapi_snmpa_reload(
    int sock, int synchronous);

    int maapi_start_phase(
    int sock, int phase, int synchronous);

    int maapi_wait_start(
    int sock, int phase);

    int maapi_reload_config(
    int sock);

    int maapi_reopen_logs(
    int sock);

    int maapi_stop(
    int sock, int synchronous);

    int maapi_rebind_listener(
    int sock, int listener);

    int maapi_clear_opcache(
    int sock, const char *fmt, ...);

    int maapi_netconf_ssh_call_home(
    int sock, confd_value_t *host, int port);

    int maapi_netconf_ssh_call_home_opaque(
    int sock, confd_value_t *host, const char *opaque, int port);

    int maapi_hide_group(
    int sock, int thandle, const char *group_name);

    int maapi_unhide_group(
    int sock, int thandle, const char *group_name);

## Library

NCS Library, (`libconfd`, `-lconfd`)

## Description

The `libconfd` shared library is used to connect to the NSO transaction
manager. The API described in this man page has several purposes. We can
use MAAPI when we wish to implement our own proprietary management
agent. We also use MAAPI to attach to already existing NSO transactions,
for example when we wish to implement semantic validation of
configuration data in C, and also when we wish to implement CLI wizards
in C.

## Paths

The majority of the functions described here take as their two last
arguments a format string and a variable number of extra arguments as
in: `char *` `fmt`, `...``);`

The paths for MAAPI work like paths for CDB (see
[confd_lib_cdb(3)](confd_lib_cdb.3.md#paths)) with the exception that
the bracket notation '\[n\]' is not allowed for MAAPI paths.

All the functions that take a path on this form also have a `va_list`
variant, of the same form as `maapi_vget_elem()` and
`maapi_vset_elem()`, which are the only ones explicitly documented
below. I.e. they have a prefix "maapi_v" instead of "maapi\_", and take
a single va_list argument instead of a variable number of arguments.

## Functions

All functions return CONFD_OK (0), CONFD_ERR (-1) or CONFD_EOF (-2)
unless otherwise stated. Whenever CONFD_ERR is returned from any API
function in confd_lib_maapi it is possible to obtain additional
information on the error through the symbol `confd_errno`, see the
ERRORS section of [confd_lib_lib(3)](confd_lib_lib.3.md).

In the case of CONFD_EOF it means that the socket to NCS has been
closed.

    int maapi_connect(
    int sock, const struct sockaddr* srv, int srv_sz);

The application has to connect to NCS before it can interact with NCS.

<div class="note">

If this call fails (i.e. does not return CONFD_OK), the socket
descriptor must be closed and a new socket created before the call is
re-attempted.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_load_schemas(
    int sock);

This function dynamically loads schema information from the NSO daemon
into the library, where it is available to all the library components as
described in the [confd_types(3)](confd_types.3.md) and
[confd_lib_lib(3)](confd_lib_lib.3.md) man pages. See also
`confd_load_schemas()` in [confd_lib_lib(3)](confd_lib_lib.3.md).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_load_schemas_list(
    int sock, int flags, const uint32_t *nshash, const int *nsflags, int num_ns);

A variant of `maapi_load_schemas()` that allows for loading a subset of
the schema information from the NSO daemon into the library. This means
that the loading can be significantly faster in the case of a system
with many large data models, with the drawback that the functions that
use the schema information will have limited functionality or not work
at all.

The `flags` parameter can be given as `CONFD_LOAD_SCHEMA_HASH` to
request that the global mapping between strings and hash values for the
data model nodes should be loaded. If `flags` is given as 0, this
mapping is not loaded. The mapping is required for use of the functions
`confd_hash2str()`, `confd_str2hash()`, `confd_cs_node_cd()`, and
`confd_xpath_pp_kpath()`. Additionally, without the mapping,
`confd_pp_value()`, `confd_pp_kpath()`, and `confd_pp_kpath_len()`, as
well as the trace printouts from the library, will print nodes as
"tag\<N\>", where N is the hash value, instead of the node name.

The `nshash` parameter is a `num_ns` elements long array of namespace
hash values, requesting that schema information should be loaded for the
listed namespaces according to the corresponding element of the
`nsflags` array (also `num_ns` elements long). For each namespace,
either or both of these flags may be given:

`CONFD_LOAD_SCHEMA_NODES`  
> This flag requests that the `confd_cs_node` tree (see
> [confd_types(3)](confd_types.3.md)) for the namespace should be
> loaded. This tree is required for the use of the functions
> `confd_find_cs_root()`, `confd_find_cs_node()`,
> `confd_find_cs_node_child()`, `confd_cs_node_cd()`,
> `confd_register_node_type()`, `confd_get_leaf_list_type()`, and
> `confd_xpath_pp_kpath()` for the namespace. Additionally, the above
> functions that print a `confd_hkeypath_t`, as well as the library
> trace printouts, will attempt to use this tree and the type
> information (see below) to find the correct string representation for
> key values - if the tree isn't available, key values will be printed
> as described for `confd_pp_value()`.

`CONFD_LOAD_SCHEMA_TYPES`  
> This flag requests that information about the types defined in the
> namespace should be loaded. The type information is required for use
> of the functions `confd_val2str()`, `confd_str2val()`,
> `confd_find_ns_type()`, `confd_get_leaf_list_type()`,
> `confd_register_ns_type()`, and `confd_register_node_type()` for the
> namespace. Additionally the `confd_hkeypath_t`-printing functions and
> the library trace printouts will also fall back to `confd_pp_value()`
> as described above if the type information isn't available.
>
> Type definitions may refer to types defined in other namespaces. If
> the `CONFD_LOAD_SCHEMA_TYPES` flag has been given for a namespace, and
> the types defined there have such type references to namespaces that
> are not included in the `nshash` array, the referenced type
> information will also be loaded, if necessary recursively, until the
> types have a complete definition.

See also `confd_load_schemas_list()` in
[confd_lib_lib(3)](confd_lib_lib.3.md).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_get_schema_file_path(
    int sock, char **buf);

If shared memory schema support has been enabled via
/ncs-config/enable-shared-memory-schema in `ncs.conf`, this function
will return the pathname of the file used for the shared memory mapping,
which can then be passed to `confd_mmap_schemas()` (see
[confd_lib_lib(3)](confd_lib_lib.3.md)). If the call is successful,
`buf` is set to point to a dynamically allocated string, which must be
freed by the application by means of calling `free(3)`.

If creation of the schema file is in progress when the function is
called, the call will block until the creation has completed. If shared
memory schema support has not been enabled, or if the creation of the
schema file failed, the function returns CONFD_ERR with `confd_errno`
set to CONFD_ERR_NOEXISTS.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_close(
    int sock);

Effectively a call to `maapi_end_user_session()` and also closes the
socket.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION

Even if the call returns an error, the socket will be closed.

## Session Management

    int maapi_start_user_session(
    int sock, const char *username, const char *context, const char **groups, 
    int numgroups, const struct confd_ip *src_addr, enum confd_proto prot);

Once we have created a MAAPI socket, we must also establish a user
session on the socket. It is up to the user of the MAAPI library to
authenticate users. The library user can ask NCS to perform the actual
authentication through a call to `maapi_authenticate()` but
authentication may very well occur through some other external means.

Thus, when we use this function to create a user session, we must
provide all relevant information about the user. If we wish to execute
read/write transactions over the MAAPI interface, we must first have an
established user session.

A user session corresponds to a NETCONF manager who has just established
an authenticated SSH connection, but not yet sent any NETCONF commands
on the SSH connection.

The `struct confd_ip` is defined in `confd_lib.h` and must be properly
populated before the call. For example:

<div class="informalexample">

    struct confd_ip ip;
    ip.af = AF_INET;
    inet_aton("10.0.0.33", &ip.ip.v4);

</div>

The `context` parameter can be any string up to 31 characters in length.
The string provided here is precisely the context string which will be
used to authorize all data access through the AAA system. Each AAA rule
has a context string which must match in order for a AAA rule to match.
(See the AAA chapter in the User Guide.)

Using the string "system" for `context` has special significance:

- The session is exempt from all maxSessions limits in confd.conf.

- There will be no authorization checks done by the AAA system.

- The session is not logged in the audit log.

- The session is not shown in 'show users' in CLI etc.

- The session may be started already in NCS start phase 0. (However
  read-write transactions can not be started until phase 1, i.e.
  transactions started in phase 0 must use parameter `readwrite` ==
  `CONFD_READ`).

Thus this can be useful e.g. when we need to create the user session for
an "internal" transaction done by an application, without relation to a
session from a northbound agent. Of course the implications of the above
need to be carefully considered in each case.

It is not possible to create new user sessions until NSO has reached
start phase 2 (See [confd(1)](ncs.1.md)), with the above exception of
a session with the context set to "system".

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_ALREADY_EXISTS,
CONFD_ERR_BADSTATE

    int maapi_start_user_session2(
    int sock, const char *username, const char *context, const char **groups, 
    int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot);

This function does the same as `maapi_start_user_session()`, but allows
for the TCP/UDP source port to be passed to NCS. Calling
`maapi_start_user_session()` is equivalent to calling
`maapi_start_user_session2()` with `src_port` 0.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_ALREADY_EXISTS,
CONFD_ERR_BADSTATE

    int maapi_start_user_session3(
    int sock, const char *username, const char *context, const char **groups, 
    int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot, 
    const char *vendor, const char *product, const char *version, const char *client_id);

This function does the same as `maapi_start_user_session2()`, but allows
additional information about the session to be passed to NCS. Calling
`maapi_start_user_session2()` is equivalent to calling
`maapi_start_user_session3()` with `vendor`, `product` and `version` set
to NULL, and `client_id` set to \_\_MAAPI_CLIENT_ID\_\_. The
\_\_MAAPI_CLIENT_ID\_\_ macro (defined in confd_maapi.h) will expand to
a string representation of \_\_FILE\_\_:\_\_LINE\_\_.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_ALREADY_EXISTS,
CONFD_ERR_BADSTATE

    int maapi_end_user_session(
    int sock);

Ends our own user session. If the MAAPI socket is closed, the user
session is automatically ended.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION

    int maapi_kill_user_session(
    int sock, int usessid);

Kill the user session identified by `usessid`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_get_user_sessions(
    int sock, int res[], int n);

Get the usessid for all current user sessions. The `res` array is
populated with at most `n` usessids, and the total number of user
sessions is returned (i.e. if the return value is larger than `n`, the
array was too short to hold all usessids).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_get_user_session(
    int sock, int usessid, struct confd_user_info *us);

Populate the `confd_user_info` structure with the data for the user
session identified by `usessid`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_get_my_user_session_id(
    int sock);

A user session is identified through an integer index, a usessid. This
function returns the usessid associated with the MAAPI socket `sock`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_set_user_session(
    int sock, int usessid);

Associate the socket with an already existing user session. This can be
used instead of `maapi_start_user_session()` when we really do not want
to start a new user session, e.g. if we want to call an action on behalf
of a given user session.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_get_user_session_identification(
    int sock, int usessid, struct confd_user_identification *uident);

If the flag `CONFD_USESS_FLAG_HAS_IDENTIFICATION` is set in the `flags`
field of the `confd_user_info` structure, additional identification
information has been provided by the northbound client. This information
can then be retrieved into a `confd_user_identification` structure (see
`confd_lib.h`) by calling this function. The elements of
`confd_user_identification` are either NULL (if the corresponding
information was not provided) or point to a string. The strings must be
freed by the application by means of calling `free(3)`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_get_user_session_opaque(
    int sock, int usessid, char **opaque);

If the flag `CONFD_USESS_FLAG_HAS_OPAQUE` is set in the `flags` field of
the `confd_user_info` structure, "opaque" information has been provided
by the northbound client (see the `-O` option in
[confd_cli(1)](confd_cli.1.md)). The information can then be retrieved
by calling this function. If the call is successful, `opaque` is set to
point to a dynamically allocated string, which must be freed by the
application by means of calling `free(3)`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_get_authorization_info(
    int sock, int usessid, struct confd_authorization_info **ainfo);

This function retrieves authorization info for a user session, i.e. the
groups that the user has been assigned to. The
`struct confd_authorization_info` is defined as:

<div class="informalexample">

``` c
struct confd_authorization_info {
    int ngroups;
    char **groups;
};
```

</div>

If the call is successful, `ainfo` is set to point to a dynamically
allocated structure, which must be freed by the application by means of
calling `confd_free_authorization_info()` (see
[confd_lib_lib(3)](confd_lib_lib.3.md)) .

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_set_next_user_session_id(
    int sock, int usessid);

Set the user session id that will be assigned to the next user session
started. The given value is silently forced to be in the range 100 ..
2^31-1. This function can be used to ensure that session ids for user
sessions started by northbound agents or via MAAPI are unique across a
NCS restart.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

## Locks

    int maapi_lock(
    int sock, enum confd_dbname name);

    int maapi_unlock(
    int sock, enum confd_dbname name);

These functions can be used to manipulate locks on the 3 different
database types. If `maapi_lock()` is called and the database is already
locked, CONFD_ERR is returned, and `confd_errno` will be set to
CONFD_ERR_LOCKED. If `confd_errno` is CONFD_ERR_EXTERNAL it means that a
callback has been invoked in an external database to lock/unlock which
in its turn returned an error. (See
[confd_lib_dp(3)](confd_lib_dp.3.md) for external database callback
API)

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_LOCKED,
CONFD_ERR_EXTERNAL, CONFD_ERR_NOSESSION

    int maapi_is_lock_set(
    int sock, enum confd_dbname name);

Returns a positive integer being the usid of the current lock owner if
the lock is set, and 0 if the lock is not set.

    int maapi_lock_partial(
    int sock, enum confd_dbname name, char *xpaths[], int nxpaths, int *lockid);

    int maapi_unlock_partial(
    int sock, int lockid);

We can also manipulate partial locks on the databases, i.e. locks on a
specified set of leafs and/or subtrees. The specification of what to
lock is given via the `xpaths` array, which is populated with `nxpaths`
pointers to XPath expressions. If the lock succeeds,
`maapi_lock_partial()` returns CONFD_OK, and a lock identifier to use
with `maapi_unlock_partial()` is stored in `*lockid`.

If CONFD_ERR is returned, some values of `confd_errno` are of particular
interest:

CONFD_ERR_LOCKED  
> Some of the requested nodes are already locked.

CONFD_ERR_EXTERNAL  
> A callback has been invoked in an external database to
> lock_partial/unlock_partial which in its turn returned an error (see
> [confd_lib_dp(3)](confd_lib_dp.3.md) for external database callback
> API).

CONFD_ERR_NOEXISTS  
> The list of XPath expressions evaluated to an empty set of nodes -
> i.e. there is nothing to lock.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_LOCKED,
CONFD_ERR_EXTERNAL, CONFD_ERR_NOSESSION, CONFD_ERR_NOEXISTS

## Candidate Manipulation

All the candidate manipulation functions require that the candidate data
store is enabled in `confd.conf` - otherwise they will set `confd_errno`
to CONFD_ERR_NOEXISTS. If the candidate data store is enabled,
`confd_errno` may be set to CONFD_ERR_NOEXISTS for other reasons, as
described below.

All these functions may also set `confd_errno` to CONFD_ERR_EXTERNAL.
This value can only be set when the candidate is owned by the external
database. When NCS owns the candidate, which is the most common
configuration scenario, the candidate manipulation function will never
set `confd_errno` to CONFD_ERR_EXTERNAL.

    int maapi_candidate_validate(
    int sock);

This function validates the candidate. The function should only be used
when the candidate is not owned by NCS, i.e. when the candidate is owned
by an external database.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_EXTERNAL

    int maapi_candidate_commit(
    int sock);

This function copies the candidate to running. It is also used to
confirm a previous call to `maapi_candidate_confirmed_commit()`, i.e. to
prevent the automatic rollback if a confirmed commit is not confirmed.

If `confd_errno` is CONFD_ERR_INUSE it means that some other user
session is doing a confirmed commit or has a lock on the database.
CONFD_ERR_NOEXISTS means that there is an ongoing persistent confirmed
commit (see below) - i.e. there is no confirmed commit that this
function call can apply to.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_INUSE, CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_confirmed_commit(
    int sock, int timeoutsecs);

This function also copies the candidate into running. However if a call
to `maapi_candidate_commit()` is not done within `timeoutsecs` an
automatic rollback will occur. It can also be used to "extend" a
confirmed commit that is already in progress, i.e. set a new timeout or
add changes.

If `confd_errno` is CONFD_ERR_NOEXISTS it means that there is an ongoing
persistent confirmed commit (see below).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_INUSE, CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_abort_commit(
    int sock);

This function cancels an ongoing confirmed commit.

If `confd_errno` is CONFD_ERR_NOEXISTS it means that some other user
session initiated the confirmed commit, or that there is an ongoing
persistent confirmed commit (see below).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_confirmed_commit_persistent(
    int sock, int timeoutsecs, const char *persist, const char *persist_id);

This function can be used to start or extend a persistent confirmed
commit. The `persist` parameter sets the cookie for the persistent
confirmed commit, while the `persist_id` gives the cookie for an already
ongoing persistent confirmed commit. This gives the following
possibilities:

`persist` = "cookie", `persist_id` = NULL  
> Start a persistent confirmed commit with the cookie "cookie", or
> extend an already ongoing non-persistent confirmed commit and turn it
> into a persistent confirmed commit.

`persist` = "newcookie", `persist_id` = "oldcookie"  
> Extend an ongoing persistent confirmed commit that uses the cookie
> "oldcookie" and change the cookie to "newcookie".

`persist` = NULL, `persist_id` = "cookie"  
> Extend an ongoing persistent confirmed commit that uses the cookie
> "oldcookie" and turn it into a non-persistent confirmed commit.

`persist` = NULL, `persist_id` = NULL  
> Does the same as `maapi_candidate_confirmed_commit()`.

Typical usage is to start a persistent confirmed commit with `persist` =
"cookie", `persist_id` = NULL, and to extend it with `persist` =
"cookie", `persist_id` = "cookie".

If `confd_errno` is CONFD_ERR_NOEXISTS it means that there is an ongoing
persistent confirmed commit, but `persist_id` didn't give the right
cookie for it.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_INUSE, CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_confirmed_commit_info(
    int sock, int timeoutsecs, const char *persist, const char *persist_id, 
    const char *label, const char *comment);

This function does the same as
`maapi_candidate_confirmed_commit_persistent()`, but allows for setting
the "Label" and/or "Comment" that is stored in the rollback file when
the candidate is committed to running. To set only the "Label", give
`comment` as NULL, and to set only the "Comment", give `label` as NULL.
If both `label` and `comment` are NULL, the function does exactly the
same as `maapi_candidate_confirmed_commit_persistent()`.

<div class="note">

To ensure that the "Label" and/or "Comment" are stored in the rollback
file in all cases when doing a confirmed commit, they must be given both
with the confirmed commit (using this function) and with the confirming
commit (using `maapi_candidate_commit_info()`).

</div>

If `confd_errno` is CONFD_ERR_NOEXISTS it means that there is an ongoing
persistent confirmed commit, but `persist_id` didn't give the right
cookie for it.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_INUSE, CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_commit_persistent(
    int sock, const char *persist_id);

Confirm an ongoing persistent confirmed commit with the cookie given by
`persist_id`. If `persist_id` is NULL, it does the same as
`maapi_candidate_commit()`.

If `confd_errno` is CONFD_ERR_NOEXISTS it means that there is an ongoing
persistent confirmed commit, but `persist_id` didn't give the right
cookie for it.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_INUSE, CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_commit_info(
    int sock, const char *persist_id, const char *label, const char *comment);

This function does the same as `maapi_candidate_commit_persistent()`,
but allows for setting the "Label" and/or "Comment" that is stored in
the rollback file when the candidate is committed to running. To set
only the "Label", give `comment` as NULL, and to set only the "Comment",
give `label` as NULL. If both `label` and `comment` are NULL, the
function does exactly the same as `maapi_candidate_commit_persistent()`.

<div class="note">

To ensure that the "Label" and/or "Comment" are stored in the rollback
file in all cases when doing a confirmed commit, they must be given both
with the confirmed commit (using
`maapi_candidate_confirmed_commit_info()`) and with the confirming
commit (using this function).

</div>

If `confd_errno` is CONFD_ERR_NOEXISTS it means that there is an ongoing
persistent confirmed commit, but `persist_id` didn't give the right
cookie for it.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_INUSE, CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_abort_commit_persistent(
    int sock, const char *persist_id);

Cancel an ongoing persistent confirmed commit with the cookie given by
`persist_id`. (If `persist_id` is NULL, it does the same as
`maapi_candidate_abort_commit()`.)

If `confd_errno` is CONFD_ERR_NOEXISTS it means that there is an ongoing
persistent confirmed commit, but `persist_id` didn't give the right
cookie for it.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_INUSE, CONFD_ERR_NOSESSION, CONFD_ERR_EXTERNAL

    int maapi_candidate_reset(
    int sock);

This function copies running into candidate.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_INUSE,
CONFD_ERR_EXTERNAL, CONFD_ERR_NOSESSION

    int maapi_confirmed_commit_in_progress(
    int sock);

Checks whether a confirmed commit is ongoing. Returns a positive integer
being the usid of confirmed commit operation in progress or 0 if no
confirmed commit is in progress.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_copy_running_to_startup(
    int sock);

This function copies running to startup.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_INUSE,
CONFD_ERR_EXTERNAL, CONFD_ERR_NOSESSION, CONFD_ERR_NOEXISTS

    int maapi_is_running_modified(
    int sock);

Returns 1 if running has been modified since the last copy to startup, 0
if it has not been modified.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_is_candidate_modified(
    int sock);

Returns 1 if candidate has been modified, i.e if there are any
outstanding non committed changes to the candidate, 0 if no changes are
done

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

## Transaction Control

    int maapi_start_trans(
    int sock, enum confd_dbname name, enum confd_trans_mode readwrite);

The main purpose of MAAPI is to provide read and write access into the
NCS transaction manager. Regardless of whether data is kept in CDB or in
some (or several) external data bases, the same API is used to access
data. ConfD acts as a mediator and multiplexes the different commands to
the code which is responsible for each individual data node.

This function creates a new transaction towards the data store specified
by `name`, which can be one of `CONFD_CANDIDATE`, `CONFD_OPERATIONAL`,
`CONFD_RUNNING`, or `CONFD_STARTUP` (however updating the startup data
store is better done via `maapi_copy_running_to_startup()`). The
`readwrite` parameter can be either `CONFD_READ`, to start a readonly
transaction, or `CONFD_READ_WRITE`, to start a read-write transaction.

A readonly transaction will incur less resource usage, thus if no writes
will be done (e.g. the purpose of the transaction is only to read
operational data), it is best to use `CONFD_READ`. There are also some
cases where starting a read-write transaction is not allowed, e.g. if we
start a transaction towards the running data store and
/confdConfig/datastores/running/access is set to
"writable-through-candidate" in `confd.conf`, or if ConfD is running in
HA secondary mode.

If start of the transaction is successful, the function returns a new
transaction handle, a non-negative integer `thandle` which must be used
as a parameter in all API functions which manipulate the transaction.

We will drive this transaction forward through the different states a
ConfD transaction goes through. See the ascii arts in
[confd_lib_dp(3)](confd_lib_dp.3.md) for a picture of these states. If
an external database is used, and it has registered callback functions
for the different transaction states, those callbacks will be called
when we in MAAPI invoke the different MAAPI transaction manipulation
functions. For example when we call `maapi_start_trans()` the `init()`
callback will be invoked in all external databases. (However ConfD may
delay the actual invocation of `init()` as an optimization, see
[confd_lib_dp(3)](confd_lib_dp.3.md).) If data is kept in CDB, ConfD
will handle everything internally.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_TOOMANYTRANS, CONFD_ERR_BADSTATE, CONFD_ERR_NOT_WRITABLE

    int maapi_start_trans2(
    int sock, enum confd_dbname name, enum confd_trans_mode readwrite, int usid);

If we want to start new transactions inside actions, we can use this
function to execute the new transaction within the existing user
session. It is equivalent to calling `maapi_set_user_session()` and then
`maapi_start_trans()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_TOOMANYTRANS, CONFD_ERR_BADSTATE, CONFD_ERR_NOT_WRITABLE

    int maapi_start_trans_flags(
    int sock, enum confd_dbname name, enum confd_trans_mode readwrite, int usid, 
    int flags);

This function makes it possible to set the flags that can otherwise be
used with `maapi_set_flags()` already when starting a transaction, as
well as setting the `MAAPI_FLAG_HIDE_INACTIVE`,
`MAAPI_FLAG_HIDE_ALL_HIDEGROUPS` and `MAAPI_FLAG_DELAYED_WHEN` flags
that can only be used with `maapi_start_trans_flags()`. See the
description of `maapi_set_flags()` for the available flags. It also
incorporates the functionality of `maapi_start_trans()` and
`maapi_start_trans2()` with respect to user sessions: If `usid` is 0,
the transaction will be started within the user session associated with
the MAAPI socket (like `maapi_start_trans()`), otherwise it will be
started within the user session given by `usid` (like
`maapi_start_trans2()`).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_TOOMANYTRANS, CONFD_ERR_BADSTATE, CONFD_ERR_NOT_WRITABLE

    int maapi_start_trans_flags2(
    int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid, 
    int flags, const char *vendor, const char *product, const char *version, 
    const char *client_id);

This function does the same as `maapi_start_trans_flags()` but allows
additional information about the transaction to be passed to NCS.
Calling `maapi_start_trans_flags()` is equivalent to calling
`maapi_start_trans_flags2()` with `vendor`, `product` and `version` set
to NULL, and `client_id` set to \_\_MAAPI_CLIENT_ID\_\_. The
\_\_MAAPI_CLIENT_ID\_\_ macro (defined in confd_maapi.h) will expand to
a string representation of \_\_FILE\_\_:\_\_LINE\_\_.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_TOOMANYTRANS, CONFD_ERR_BADSTATE, CONFD_ERR_NOT_WRITABLE

    int maapi_start_trans_in_trans(
    int sock, enum confd_trans_mode readwrite, int usid, int thandle);

This function makes it possible to start a transaction with another
transaction as backend, instead of an actual data store. This can be
useful if we want to make a set of related changes, and then either
apply or discard them all based on some criterion, while other changes
remain unaffected. The `thandle` identifies the backend transaction to
use. If `usid` is 0, the transaction will be started within the user
session associated with the MAAPI socket, otherwise it will be started
within the user session given by `usid`. If we call
`maapi_apply_trans()` for this "transaction in a transaction", the
changes (if any) will be applied to the backend transaction. To discard
the changes, call `maapi_finish_trans()` without calling
`maapi_apply_trans()` first.

The changes in this transaction can be validated by calling
`maapi_validate_trans()` with a non-zero value for `forcevalidation`,
but calling `maapi_apply_trans()` will not do any validation - in either
case, the resulting configuration will be validated when the backend
transaction is committed to the running data store. Note though that
unlike the case with a transaction directly towards a data store, no
transaction lock is taken on the underlying data store when doing
validation of this type of transaction - thus it is possible for the
contents of the data store to change (due to commit of another
transaction) during the validation.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_TOOMANYTRANS, CONFD_ERR_BADSTATE

    int maapi_finish_trans(
    int sock, int thandle);

This will finish the transaction. If the transaction is implemented by
an external database, this will invoke the `finish()` callback.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

The error CONFD_ERR_NOEXISTS is set for all API functions which use a
`thandle`, the return value from `maapi_start_trans()`, whenever no
transaction is started.

    int maapi_validate_trans(
    int sock, int thandle, int unlock, int forcevalidation);

This function validates all data written in the transaction. This
includes all data model constraints and all defined semantic validation
in C, i.e. user programs that have registered functions under validation
points.

If this function returns CONFD_ERR, the transaction is open for further
editing. There are two special `confd_errno` values which are of
particular interest here.

CONFD_ERR_EXTERNAL  
> this means that an external validation program in C returns CONFD_ERR
> i.e. that the semantic validation failed. The reason for the failure
> can be found in `confd_lasterr()`

CONFD_ERR_VALIDATION_WARNING  
> This means that an external semantic validation program in C returned
> CONFD_VALIDATION_WARN. The string `confd_lasterr()` is organized as a
> series of NUL terminated strings as in
> `keypath1, reason1, keypath2, reason2 ...` where the sequence is
> terminated with an additional NUL

If `unlock` is 1, the transaction is open for further editing even if
validation succeeds. If `unlock` is 0 and the function returns CONFD_OK,
the next function to be called MUST be `maapi_prepare_trans()` or
`maapi_finish_trans()`.

`unlock` = 1 can be used to implement a 'validate' command which can be
given in the middle of an editing session. The first thing that happens
is that a lock is set. If `unlock` == 1, the lock is released on
success. The lock is always released on failure.

The `forcevalidation` parameter should normally be 0. It has no effect
for a transaction towards the running or startup data stores, validation
is always performed. For a transaction towards the candidate data store,
validation will not be done unless `forcevalidation` is non-zero.
Avoiding this validation is preferable if we are going to commit the
candidate to running (e.g. with `maapi_candidate_commit()`), since
otherwise the validation will be done twice. However if we are
implementing a 'validate' command, we should give a non-zero value for
`forcevalidation`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS, CONFD_ERR_NOTSET, CONFD_ERR_NON_UNIQUE,
CONFD_ERR_BAD_KEYREF, CONFD_ERR_TOO_FEW_ELEMS, CONFD_ERR_TOO_MANY_ELEMS,
CONFD_ERR_UNSET_CHOICE, CONFD_ERR_MUST_FAILED,
CONFD_ERR_MISSING_INSTANCE, CONFD_ERR_INVALID_INSTANCE,
CONFD_ERR_STALE_INSTANCE, CONFD_ERR_INUSE, CONFD_ERR_BADTYPE,
CONFD_ERR_EXTERNAL, CONFD_ERR_BADSTATE

    int maapi_prepare_trans(
    int sock, int thandle);

This function must be called as first part of two-phase commit. After
this function has been called `maapi_commit_trans()` or
`maapi_abort_trans()` must be called.

It will invoke the prepare callback in all participants in the
transaction. If all participants reply with CONFD_OK, the second phase
of the two-phase commit procedure is commenced.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS, CONFD_ERR_EXTERNAL, CONFD_ERR_NOTSET,
CONFD_ERR_BADSTATE, CONFD_ERR_INUSE

    int maapi_commit_trans(
    int sock, int thandle);

    int maapi_abort_trans(
    int sock, int thandle);

Finally at the last stage, either commit or abort must be called. A call
to one of these functions must also eventually be followed by a call to
`maapi_finish_trans()` which will terminate the transaction.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS, CONFD_ERR_EXTERNAL, CONFD_ERR_BADSTATE

    int maapi_apply_trans(
    int sock, int thandle, int keepopen);

Invoking the above transaction functions in exactly the right order can
be a bit complicated. The right order to invoke the functions is
`maapi_validate_trans()`, `maapi_prepare_trans()`,
`maapi_commit_trans()` (or `maapi_abort_trans()`). Usually we do not
require this fine grained control over the two-phase commit protocol. It
is easier to use `maapi_apply_trans()` which validates, prepares and
eventually commits or aborts.

A call to `maapi_apply_trans()` must also eventually be followed by a
call to `maapi_finish_trans()` which will terminate the transaction.

<div class="note">

For a readonly transaction, i.e. one started with `readwrite` ==
`CONFD_READ`, or for a read-write transaction where we haven't actually
done any writes, we do not need to call any of the
validate/prepare/commit/abort or apply functions, since there is nothing
for them to do. Calling `maapi_finish_trans()` to terminate the
transaction is sufficient.

</div>

The parameter `keepopen` can optionally be set to `1`, then the changes
to the transaction are not discarded if validation fails. This feature
is typically used by management applications that wish to present the
validation errors to an operator and allow the operator to fix the
validation errors and then later retry the apply sequence.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS, CONFD_ERR_NOTSET, CONFD_ERR_NON_UNIQUE,
CONFD_ERR_BAD_KEYREF, CONFD_ERR_TOO_FEW_ELEMS, CONFD_ERR_TOO_MANY_ELEMS,
CONFD_ERR_UNSET_CHOICE, CONFD_ERR_MUST_FAILED,
CONFD_ERR_MISSING_INSTANCE, CONFD_ERR_INVALID_INSTANCE,
CONFD_ERR_STALE_INSTANCE, CONFD_ERR_INUSE, CONFD_ERR_BADTYPE,
CONFD_ERR_EXTERNAL, CONFD_ERR_BADSTATE

    int maapi_ncs_apply_trans_params(
    int sock, int thandle, int keepopen, confd_tag_value_t *params, int nparams, 
    confd_tag_value_t **values, int *nvalues);

This is the version of `maapi_apply_trans()` for NCS which allows to
pass commit parameters in form of *Tagged Value Array* according to the
input parameters for `rpc prepare-transaction` as defined in
`tailf-netconf-ncs.yang` module.

The function will populate the `values` array with the result of
applying transaction. The result follows the model for the output
parameters for `rpc prepare-transaction` (if dry-run was requested) or
the output parameters for `rpc commit-transaction` as defined in
`tailf-netconf-ncs.yang` module. If the list of result values is empty,
then `nvalues` will be 0 and `values` will be NULL.

Just like with `maapi_apply_trans()`, the call to
`maapi_ncs_apply_trans_params()` must be followed by the call to
`maapi_finish_trans()`. It is also only applicable to read-write
transactions.

If any attribute values are returned (`*nvalues` \> 0), the caller must
free the allocated memory by calling `confd_free_value()` for each of
the `confd_value_t` elements, and `free(3)` for the `*values` array
itself.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS, CONFD_ERR_NOTSET, CONFD_ERR_NON_UNIQUE,
CONFD_ERR_BAD_KEYREF, CONFD_ERR_TOO_FEW_ELEMS, CONFD_ERR_TOO_MANY_ELEMS,
CONFD_ERR_UNSET_CHOICE, CONFD_ERR_MUST_FAILED,
CONFD_ERR_MISSING_INSTANCE, CONFD_ERR_INVALID_INSTANCE,
CONFD_ERR_STALE_INSTANCE, CONFD_ERR_INUSE, CONFD_ERR_BADTYPE,
CONFD_ERR_EXTERNAL, CONFD_ERR_BADSTATE, CONFD_ERR_PROTOUSAGE,
CONFD_ERR_UNAVAILABLE, NCS_ERR_CONNECTION_REFUSED,
NCS_ERR_SERVICE_CONFLICT, NCS_ERR_CONNECTION_TIMEOUT,
NCS_ERR_CONNECTION_CLOSED, NCS_ERR_DEVICE, NCS_ERR_TEMPLATE

    int maapi_ncs_get_trans_params(
    int sock, int thandle, confd_tag_value_t **values, int *nvalues);

This function will return the current commit parameters for the given
transaction. The function will populate the `values` array with the
commit parameters in the form of *Tagged Value Array* according to the
input parameters for `rpc prepare-transaction` as defined in the
`tailf-netconf-ncs.yang` module.

If any attribute values are returned (`*nvalues` \> 0), the caller must
free the allocated memory by calling `confd_free_value()` for each of
the `confd_value_t` elements, and `free(3)` for the `*values` array
itself.

*Errors*: CONFD_ERR_NO_TRANS, CONFD_ERR_PROTOUSAGE, CONFD_ERR_BADSTATE

    int maapi_hide_group(
    int sock, int thandle, const char *group_name);

    int maapi_unhide_group(
    int sock, int thandle, const char *group_name);

Hide/Unhide all nodes belonging to a hide group in a transaction that
was started with flag `MAAPI_FLAG_HIDE_ALL_HIDEGROUPS`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_PROTOUSAGE,
CONFD_ERR_NOSESSION

    int maapi_get_rollback_id(
    int sock, int thandle, int *fixed_id);

After successfully invoking `maapi_commit_trans()`
`maapi_get_rollback_id()` can be used to retrieve the fixed rollback id
generated for this commit.

If a rollback id was generated a non-negative rollback id is returned.
If rollbacks are disabled or no rollback was created -1 is returned.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION

## Read/Write Functions

    int maapi_set_namespace(
    int sock, int thandle, int hashed_ns);

If we want to read or write data where the toplevel element name is not
unique, we must indicate which namespace we are going to use. It is
possible to change the namespace several times during a transaction.

The `hashed_ns` integer is the integer which is defined for the
namespace in the .h file which is generated by the 'confdc' compiler. It
is also possible to indicate which namespace to use through the
namespace prefix when we read and write data. Thus the path /foo:bar/baz
will get us /bar/baz in the namespace with prefix "foo" regardless of
what the "set" namespace is. And if there is only one toplevel element
called "bar" across all namespaces, we can use /bar/baz without the
prefix and without calling `maapi_set_namespace()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_cd(
    int sock, int thandle, const char *fmt, ...);

This function mimics the behavior of the UNIX "cd" command. It changes
our working position in the data tree. If we are worried about
performance, it is more efficient to invoke `maapi_cd()` to some
position in the tree and there perform a series of operations using
relative paths than it is to perform the equivalent series of operations
using absolute paths. Note that this function can not be used as an
existence test.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS

    int maapi_pushd(
    int sock, int thandle, const char *fmt, ...);

Behaves like `maapi_cd()` with the exception that we can subsequently
call `maapi_popd()` and returns to the previous position in the data
tree.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOSTACK, CONFD_ERR_NOEXISTS

    int maapi_popd(
    int sock, int thandle);

Pops the top position of the directory stack and changes directory.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOSTACK, CONFD_ERR_NOEXISTS

    int maapi_getcwd(
    int sock, int thandle, size_t strsz, char *curdir);

Returns the current position as previously set by `maapi_cd()`,
`maapi_pushd()`, or `maapi_popd()` as a string. Note that what is
returned is a pretty-printed version of the internal representation of
the current position, it will be the shortest unique way to print the
path but it might not exactly match the string given to `maapi_cd()`.
The buffer in \*curdir will be NULL terminated, and no more characters
than strsz-1 will be written to it.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_getcwd2(
    int sock, int thandle, size_t *strsz, char *curdir);

Same as `maapi_getcwd()` but \*strsz will be updated to full length of
the path on success.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_getcwd_kpath(
    int sock, int thandle, confd_hkeypath_t **kp);

Returns the current position like `maapi_getcwd()`, but as a pointer to
a hashed keypath instead of as a string. The hkeypath is dynamically
allocated, and may further contain dynamically allocated elements. The
caller must free the allocated memory, easiest done by calling
`confd_free_hkeypath()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_exists(
    int sock, int thandle, const char *fmt, ...);

Return 1 if the path refers to an existing node in the data tree, 0 if
it does not, and CONFD_ERR if something goes wrong.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED

    int maapi_num_instances(
    int sock, int thandle, const char *fmt, ...);

Returns the number of entries for a list in the data tree.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_UNAVAILABLE, CONFD_ERR_NOEXISTS,
CONFD_ERR_ACCESS_DENIED

    int maapi_get_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, ...);

This function reads a value from the path in `fmt` and writes the result
into the result parameter `confd_value_t`. The path must lead to a leaf
node in the data tree. Note that for the C_BUF, C_BINARY, C_LIST,
C_OBJECTREF, C_OID, C_QNAME, C_HEXSTR, and C_BITBIG `confd_value_t`
types, the buffer(s) pointed to are allocated using malloc(3) - it is up
to the user of this interface to free them using `confd_free_value()`.

The maapi interface also contains a long list of access functions that
accompany the `maapi_get_elem()` function which is a general access
function that returns a `confd_value_t`. The accompanying functions all
have the format `maapi_get_<type>_elem()` where \<type\> is one of the
actual C types a `confd_value_t` can have. For example the function:

<div class="informalexample">

    maapi_get_int64_elem(int sock, int thandle, int64_t *rval,
                                    const char *fmt, ...);

</div>

is used to read a signed 64 bit integer. It fills in the provided
`int64_t` parameter. This corresponds to the YANG datatype int64, see
[confd_types(3)](confd_types.3.md). Similar access functions are
provided for all the different builtin types.

One access function that needs additional explaining is the
`maapi_get_str_elem()`. This function copies at most `n-1` characters
into a user provided buffer, and terminates the string with a NUL
character. If the buffer is not sufficiently large CONFD_ERR is
returned, and `confd_errno` is set to CONFD_ERR_PROTOUSAGE. Note it is
always possible to use maapi_get_elem() to get hold of the
`confd_value_t`, which in the case of a string buffer contains the
length.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED, CONFD_ERR_PROTOUSAGE,
CONFD_ERR_BADTYPE

    int maapi_get_int8_elem(
    int sock, int thandle, int8_t *rval, const char *fmt, ...);

    int maapi_get_int16_elem(
    int sock, int thandle, int16_t *rval, const char *fmt, ...);

    int maapi_get_int32_elem(
    int sock, int thandle, int32_t *rval, const char *fmt, ...);

    int maapi_get_int64_elem(
    int sock, int thandle, int64_t *rval, const char *fmt, ...);

    int maapi_get_u_int8_elem(
    int sock, int thandle, uint8_t *rval, const char *fmt, ...);

    int maapi_get_u_int16_elem(
    int sock, int thandle, uint16_t *rval, const char *fmt, ...);

    int maapi_get_u_int32_elem(
    int sock, int thandle, uint32_t *rval, const char *fmt, ...);

    int maapi_get_u_int64_elem(
    int sock, int thandle, uint64_t *rval, const char *fmt, ...);

    int maapi_get_ipv4_elem(
    int sock, int thandle, struct in_addr *rval, const char *fmt, ...);

    int maapi_get_ipv6_elem(
    int sock, int thandle, struct in6_addr *rval, const char *fmt, ...);

    int maapi_get_double_elem(
    int sock, int thandle, double *rval, const char *fmt, ...);

    int maapi_get_bool_elem(
    int sock, int thandle, int *rval, const char *fmt, ...);

    int maapi_get_datetime_elem(
    int sock, int thandle, struct confd_datetime *rval, const char *fmt, ...);

    int maapi_get_date_elem(
    int sock, int thandle, struct confd_date *rval, const char *fmt, ...);

    int maapi_get_gyearmonth_elem(
    int sock, int thandle, struct confd_gYearMonth *rval, const char *fmt, 
    ...);

    int maapi_get_gyear_elem(
    int sock, int thandle, struct confd_gYear *rval, const char *fmt, ...);

    int maapi_get_time_elem(
    int sock, int thandle, struct confd_time *rval, const char *fmt, ...);

    int maapi_get_gday_elem(
    int sock, int thandle, struct confd_gDay *rval, const char *fmt, ...);

    int maapi_get_gmonthday_elem(
    int sock, int thandle, struct confd_gMonthDay *rval, const char *fmt, 
    ...);

    int maapi_get_month_elem(
    int sock, int thandle, struct confd_gMonth *rval, const char *fmt, ...);

    int maapi_get_duration_elem(
    int sock, int thandle, struct confd_duration *rval, const char *fmt, ...);

    int maapi_get_enum_value_elem(
    int sock, int thandle, int32_t *rval, const char *fmt, ...);

    int maapi_get_bit32_elem(
    int sock, int th, int32_t *rval, const char *fmt, ...);

    int maapi_get_bit64_elem(
    int sock, int th, int64_t *rval, const char *fmt, ...);

    int maapi_get_oid_elem(
    int sock, int th, struct confd_snmp_oid **rval, const char *fmt, ...);

    int maapi_get_buf_elem(
    int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
    ...);

    int maapi_get_str_elem(
    int sock, int th, char *buf, int n, const char *fmt, ...);

    int maapi_get_binary_elem(
    int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
    ...);

    int maapi_get_qname_elem(
    int sock, int thandle, unsigned char **prefix, int *prefixsz, unsigned char **name, 
    int *namesz, const char *fmt, ...);

    int maapi_get_list_elem(
    int sock, int th, confd_value_t **values, int *n, const char *fmt, ...);

    int maapi_get_ipv4prefix_elem(
    int sock, int thandle, struct confd_ipv4_prefix *rval, const char *fmt, 
    ...);

    int maapi_get_ipv6prefix_elem(
    int sock, int thandle, struct confd_ipv6_prefix *rval, const char *fmt, 
    ...);

Similar to the CDB API, MAAPI also includes typesafe variants for all
the builtin types. See [confd_types(3)](confd_types.3.md).

    int maapi_vget_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);

This function does the same as `maapi_get_elem()`, but takes a single
`va_list` argument instead of a variable number of arguments - i.e.
similar to `vprintf()`. Corresponding `va_list` variants exist for all
the functions that take a path as a variable number of arguments.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED, CONFD_ERR_PROTOUSAGE,
CONFD_ERR_BADTYPE

    int maapi_init_cursor(
    int sock, int thandle, struct maapi_cursor *mc, const char *fmt, ...);

Whenever we wish to iterate over the entries in a list in the data tree,
we must first initialize a cursor. The cursor is subsequently used in a
while loop.

For example if we have:

<div class="informalexample">

    container servers {
      list server {
        key name;
        max-elements 64;
        leaf name {
          type string;
        }
        leaf ip {
          type inet:ip-address;
        }
        leaf port {
          type inet:port-number;
          mandatory true;
        }
      }
    }

</div>

We can have the following C code which iterates over all server entries.

<div class="informalexample">

    struct maapi_cursor mc;

    maapi_init_cursor(sock, th, &mc, "/servers/server");
    maapi_get_next(&mc);
    while (mc.n != 0) {
       ... do something
       maapi_get_next(&mc);
    }
    maapi_destroy_cursor(&mc);

</div>

When a `tailf:secondary-index` statement is used in the data model (see
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md)), we can set
the `secondary_index` element of the `struct maapi_cursor` to indicate
the name of a chosen secondary index - this must be done after the call
to `maapi_init_cursor()` (which sets `secondary_index` to NULL) and
before any call to `maapi_get_next()`, `maapi_get_objects()` or
`maapi_find_next()`. In this case, `secondary_index` must point to a
NUL-terminated string that is valid throughout the iteration.

<div class="note">

ConfD will not sort the uncommitted rows. In this particular case,
setting the `secondary_index` element will not work.

</div>

The list can be filtered by setting the `xpath_expr` field of the
`struct maapi_cursor` to an XPath expression - this must be done after
the call to `maapi_init_cursor()` (which sets `xpath_expr` to NULL) and
before any call to `maapi_get_next()` or `maapi_get_objects()`. The
XPath expression is evaluated for each list entry, and if it evaluates
to true, the list entry is returned in `maapi_get_next`. For example, we
can filter the list above on the port number:

<div class="informalexample">

    mc.xpath_expr = "port < 1024";

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED

    int maapi_get_next(
    struct maapi_cursor *mc);

Iterates and gets the keys for the next entry in a list. The key(s) can
be used to retrieve further data. The key(s) are stored as
`confd_value_t` structures in an array inside the `struct maapi_cursor`.
The array of keys will be deallocated by the library.

For example to read the port leaf from an entry in the server list
above, we would do:

<div class="informalexample">

    ....
    maapi_init_cursor(sock, th, &mc, "/servers/server");
    maapi_get_next(&mc);
    while (mc.n != 0) {
       confd_value_t v;
       maapi_get_elem(sock, th, &v, "/servers/server{%x}/port", &mc.keys[0]);
       ....
       maapi_get_next(&mc);
    }

</div>

The '%\*x' modifier (see the PATHS section in
[confd_lib_cdb(3)](confd_lib_cdb.3.md#paths)) is especially useful
when working with a maapi cursor. The example above assumes that we know
that the /servers/server list has exactly one key. But we can
alternatively write
`maapi_get_elem(sock, th, &v, "/servers/server{%*x}/port", mc.n, mc.keys);` -
which works regardless of the number of keys that the list has.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED

    int maapi_find_next(
    struct maapi_cursor *mc, enum confd_find_next_type type, confd_value_t *inkeys, 
    int n_inkeys);

Update the cursor `mc` with the key(s) for the list entry designated by
the `type` and `inkeys` parameters. This function may be used to start a
traversal from an arbitrary entry in a list. Keys for subsequent entries
may be retrieved with the `maapi_get_next()` function.

The `inkeys` array is populated with `n_inkeys` values that designate
the starting point in the list. Normally the array is populated with key
values for the list, but if the `secondary_index` element of the cursor
has been set, the array must instead be populated with values for the
corresponding secondary index-leafs. The `type` can have one of two
values:

`CONFD_FIND_NEXT`  
> The keys for the first list entry *after* the one indicated by the
> `inkeys` array are requested. The `inkeys` array does not have to
> correspond to an actual existing list entry. Furthermore the number of
> values provided in the array (`n_inkeys`) may be fewer than the number
> of keys (or number of index-leafs for a secondary-index) in the data
> model, possibly even zero. This indicates that only the first
> `n_inkeys` values are provided, and the remaining ones should be taken
> to have a value "earlier" than the value for any existing list entry.

`CONFD_FIND_SAME_OR_NEXT`  
> If the values in the `inkeys` array completely identify an actual
> existing list entry, the keys for this entry are requested. Otherwise
> the same logic as described for `CONFD_FIND_NEXT` is used.

The following example will traverse the server list starting with the
first entry (if any) that has a key value that is after "smtp" in the
list order:

<div class="informalexample">

    ....
    confd_value_t inkeys[1];

    maapi_init_cursor(sock, th, &mc, "/servers/server");
    CONFD_SET_STR(&inkeys[0], "smtp");

    maapi_find_next(&mc, CONFD_FIND_NEXT, inkeys, 1);
    while (mc.n != 0) {
       confd_value_t v;
       maapi_get_elem(sock, th, &v, "/servers/server{%x}/port", &mc.keys[0]);
       ....
       maapi_get_next(&mc);
    }

</div>

The field `xpath_expr` in the cursor has no effect on
`maapi_find_next()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED

    void maapi_destroy_cursor(
    struct maapi_cursor *mc);

Deallocates memory which is associated with the cursor.

    int maapi_set_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, ...);

    int maapi_set_elem2(
    int sock, int thandle, const char *strval, const char *fmt, ...);

We have two different functions to set values. One where the value is a
string and one where the value to set is a `confd_value_t`. The string
version is useful when we have implemented a management agent where the
user enters values as strings. The version with `confd_value_t` is
useful when we are setting values which we have just read.

Another note which might effect users is that if the type we are writing
is any of the encrypt or hash types, the `maapi_set_elem2()` will
perform the asymmetric conversion of values whereas the
`maapi_set_elem()` will not. See [confd_types(3)](confd_types.3.md),
the types `tailf:md5-digest-string`,
`tailf:aes-cfb-128-encrypted-string` and
`tailf:aes-256-cfb-128-encrypted-string`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_INUSE

    int maapi_vset_elem(
    int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);

This function does the same as `maapi_set_elem()`, but takes a single
`va_list` argument instead of a variable number of arguments - i.e.
similar to `vprintf()`. Corresponding `va_list` variants exist for all
the functions that take a path as a variable number of arguments.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_INUSE

    int maapi_create(
    int sock, int thandle, const char *fmt, ...);

Create a new list entry, a `presence` container, or a leaf of type
`empty` (unless in a `union`, see the C_EMPTY section in
[confd_types(3)](confd_types.3.md)) in the data tree. For example:
`maapi_create(sock,th,"/servers/server{www}");`

If we are creating a new server entry as above, we must also populate
all other data nodes below, which do not have a default value in the
data model. Thus we must also do e.g.:

`maapi_set_elem2(sock, th, "80", "/servers/server{www}/port");`

before we try to commit the data.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOTCREATABLE,
CONFD_ERR_INUSE, CONFD_ERR_ALREADY_EXISTS

    int maapi_delete(
    int sock, int thandle, const char *fmt, ...);

Delete an existing list entry, a `presence` container, or an optional
leaf and all its children (if any) from the data tree.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOTDELETABLE,
CONFD_ERR_INUSE

    int maapi_get_object(
    int sock, int thandle, confd_value_t *values, int n, const char *fmt, 
    ...);

This function reads at most `n` values from the list entry or container
specified by the path, and places them in the `values` array, which is
provided by the caller. The array is populated according to the
specification of the Value Array format in the [XML
STRUCTURES](confd_types.3.md#xml_structures) section of the
[confd_types(3)](confd_types.3.md) manual page.

On success, the function returns the actual number of elements needed.
I.e. if the return value is bigger than `n`, only the values for the
first `n` elements are in the array, and the remaining values have been
discarded. Note that given the specification of the array contents,
there is always a fixed upper bound on the number of actual elements,
and if there are no `presence` sub-containers, the number is constant.
See the description of `cdb_get_object()` in
[confd_lib_cdb(3)](confd_lib_cdb.3.md) for usage examples - they apply
to `maapi_get_object()` as well.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED

    int maapi_get_objects(
    struct maapi_cursor *mc, confd_value_t *values, int n, int *nobj);

Similar to `maapi_get_object()`, but reads multiple list entries based
on a `struct maapi_cursor`. At most `n` values from each of at most
`*nobj` list entries, starting at the entry after the one given by
`*mc`, are read and placed in the `values` array. The cursor must have
been initialized with `maapi_init_cursor()` at some point before the
call, but in principle it is possible to mix calls to `maapi_get_next()`
and `maapi_get_objects()` using the same cursor.

The array must be at least `n * *nobj` elements long, and the values for
entry `i` start at element `array[i * n]` (i.e. the first entry read
starts at `array[0]`, the second at `array[n]`, and so on). On success,
the highest actual number of values in any of the entries read is
returned. If we attempt to read more entries than actually exist (i.e.
if there are less than `*nobj` entries after the entry indicated by
`*mc`), `*nobj` is updated with the actual number (possibly 0) of
entries read. In this case the `n` element of the cursor is set to 0 as
for `maapi_get_next()`. Example - read the data for all entries in the
"server" list above, in chunks of 10:

<div class="informalexample">

    #define VALUES_PER_ENTRY 3
    #define ENTRIES_PER_REQUEST 10

    struct maapi_cursor mc;
    confd_value_t v[ENTRIES_PER_REQUEST*VALUES_PER_ENTRY];
    int nobj, ret, i;

    maapi_init_cursor(sock, th, &mc, "/servers/server");
    do {
        nobj = ENTRIES_PER_REQUEST;
        ret = maapi_get_objects(&mc, v, VALUES_PER_ENTRY, &nobj);
        if (ret >= 0) {
            for (i = 0; i < nobj; i++) {
                ... process entry starting at v[i*VALUES_PER_ENTRY] ...
            }
        } else {
            ... handle error ...
        }
    } while (ret >= 0 && mc.n != 0);
    maapi_destroy_cursor(&mc);

</div>

See also the description of `cdb_get_object()` in
[confd_lib_cdb(3)](confd_lib_cdb.3.md) for examples on how to use
loaded schema information to avoid "hardwiring" constants like
VALUES_PER_ENTRY above, and the relative position of individual leaf
values in the value array.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_PROTOUSAGE, CONFD_ERR_NOEXISTS,
CONFD_ERR_ACCESS_DENIED

    int maapi_get_values(
    int sock, int thandle, confd_tag_value_t *values, int n, const char *fmt, 
    ...);

Read an arbitrary set of sub-elements of a container or list entry. The
`values` array must be pre-populated with `n` values based on the
specification of the *Tagged Value Array* format in the *XML STRUCTURES*
section of the [confd_types(3)](confd_types.3.md) manual page, where
the `confd_value_t` value element is given as follows:

- C_NOEXISTS means that the value should be read from the transaction
  and stored in the array.

- C_PTR also means that the value should be read from the transaction,
  but instead gives the expected type and a pointer to the type-specific
  variable where the value should be stored. Thus this gives a
  functionality similar to the type safe `maapi_get_xxx_elem()`
  functions.

- C_XMLBEGIN and C_XMLEND are used as per the specification.

- Keys to select list entries can be given with their values.

<div class="note">

When we use C_PTR, we need to take special care to free any allocated
memory. When we use C_NOEXISTS and the value is stored in the array, we
can just use `confd_free_value()` regardless of the type, since the
`confd_value_t` has the type information. But with C_PTR, only the
actual value is stored in the pointed-to variable, just as for
`maapi_get_buf_elem()`, `maapi_get_binary_elem()`, etc, and we need to
free the memory specifically allocated for the types listed in the
description of `maapi_get_elem()` above. The details of how to do this
are not given for the `maapi_get_xxx_elem()` functions here, but it is
the same as for the corresponding `cdb_get_xxx()` functions, see
[confd_lib_cdb(3)](confd_lib_cdb.3.md).

</div>

All elements have the same position in the array after the call, in
order to simplify extraction of the values - this means that optional
elements that were requested but didn't exist will have C_NOEXISTS
rather than being omitted from the array. However requesting a list
entry that doesn't exist is an error. Note that when using C_PTR, the
only indication of a non-existing value is that the destination variable
has not been modified - it's up to the application to set it to some
"impossible" value before the call when optional leafs are read.

<div class="note">

Selection of a list entry by its "instance integer", which can be done
with `cdb_get_values()` by using C_CDBBEGIN, can *not* be done with
`maapi_get_values()`

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_BADTYPE, CONFD_ERR_NOEXISTS,
CONFD_ERR_ACCESS_DENIED

    int maapi_set_object(
    int sock, int thandle, const confd_value_t *values, int n, const char *fmt, 
    ...);

Set all leafs corresponding to the complete contents of a list entry or
container, excluding for sub-lists. The `values` array must be populated
with `n` values according to the specification of the Value Array format
in the [XML STRUCTURES](confd_types.3.md#xml_structures) section of
the [confd_types(3)](confd_types.3.md) manual page. Additionally,
since operational data cannot be written, array elements corresponding
to operational data leafs or containers must have the value C_NOEXISTS.

If the node specified by the path, or any sub-nodes that are specified
as existing, do not exist before this call, they will be created,
otherwise the existing values will be updated. Nodes that can be deleted
and are specified as not existing in the array, i.e. with value
C_NOEXISTS, will be deleted if they existed before the call.

For a list entry, since the key values must be present in the array, it
is not required that the key values are included in the path given by
`fmt`. If the key values *are* included in the path, the key values in
the array are ignored.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_INUSE

    int maapi_set_values(
    int sock, int thandle, const confd_tag_value_t *values, int n, const char *fmt, 
    ...);

Set arbitrary sub-elements of a container or list entry. The `values`
array must be populated with `n` values according to the specification
of the *Tagged Value Array* format in the *XML STRUCTURES* section of
the [confd_types(3)](confd_types.3.md) manual page.

If the container or list entry itself, or any sub-elements that are
specified as existing, do not exist before this call, they will be
created, otherwise the existing values will be updated. Both mandatory
and optional elements may be omitted from the array, and all omitted
elements are left unchanged. To actually delete a non-mandatory leaf or
presence container as described for `maapi_set_object()`, it may (as an
extension of the format) be specified as C_NOEXISTS instead of being
omitted.

For a list entry, the key values can be specified either in the path or
via key elements in the array - if the values are in the path, the key
elements can be omitted from the array. For sub-lists present in the
array, the key elements must of course always also be present though,
immediately following the C_XMLBEGIN element and in the order defined by
the data model. It is also possible to delete a list entry by using a
C_XMLBEGINDEL element, followed by the keys in data model order,
followed by a C_XMLEND element.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_INUSE

    int maapi_get_case(
    int sock, int thandle, const char *choice, confd_value_t *rcase, const char *fmt, 
    ...);

When we use the YANG `choice` statement in the data model, this function
can be used to find the currently selected `case`, avoiding useless
`maapi_get_elem()` etc requests for nodes that belong to other cases.
The `fmt, ...` arguments give the path to the list entry or container
where the choice is defined, and `choice` is the name of the choice. The
case value is returned to the `confd_value_t` that `rcase` points to, as
type C_XMLTAG - i.e. we can use the `CONFD_GET_XMLTAG()` macro to
retrieve the hashed tag value.

If we have "nested" choices, i.e. multiple levels of `choice` statements
without intervening `container` or `list` statements in the data model,
the `choice` argument must give a '/'-separated path with alternating
choice and case names, from the data node given by the `fmt, ...`
arguments to the specific choice that the request pertains to.

For a choice without a `mandatory true` statement where no case is
currently selected, the function will fail with CONFD_ERR_NOEXISTS if
the choice doesn't have a default case. If it has a default case, it
will be returned unless the MAAPI_FLAG_NO_DEFAULTS flag is in effect
(see `maapi_set_flags()` below) - if the flag is set, the value returned
via `rcase` will have type C_DEFAULT.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED

    int maapi_get_attrs(
    int sock, int thandle, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
    int *num_vals, const char *fmt, ...);

Retrieve attributes for a configuration node. These attributes are
currently supported:

<div class="informalexample">

    /* CONFD_ATTR_TAGS: value is C_LIST of C_BUF/C_STR */
    #define CONFD_ATTR_TAGS       0x80000000
    /* CONFD_ATTR_ANNOTATION: value is C_BUF/C_STR */
    #define CONFD_ATTR_ANNOTATION 0x80000001
    /* CONFD_ATTR_INACTIVE: value is C_BOOL 1 (i.e. "true") */
    #define CONFD_ATTR_INACTIVE   0x00000000
    /* CONFD_ATTR_BACKPOINTER: value is C_LIST of C_BUF/C_STR */
    #define CONFD_ATTR_BACKPOINTER 0x80000003
    /* CONFD_ATTR_OUT_OF_BAND: value is C_LIST of C_BUF/C_STR */
    #define CONFD_ATTR_OUT_OF_BAND 0x80000010
    /* CONFD_ATTR_ORIGIN: value is C_IDENTITYREF */
    #define CONFD_ATTR_ORIGIN 0x80000007
    /* CONFD_ATTR_ORIGINAL_VALUE: value is C_BUF/C_STR */
    #define CONFD_ATTR_ORIGINAL_VALUE 0x80000005
    /* CONFD_ATTR_WHEN: value is C_BUF/C_STR */
    #define CONFD_ATTR_WHEN 0x80000004
    /* CONFD_ATTR_REFCOUNT: value is C_UINT32 */
    #define CONFD_ATTR_REFCOUNT 0x80000002

</div>

The `attrs` parameter is an array of attributes of length `num_attrs`,
specifying the wanted attributes - if `num_attrs` is 0, all attributes
are retrieved. If no attributes are found, `*num_vals` is set to 0,
otherwise an array of `confd_attr_value_t` elements is allocated and
populated, its address stored in `*attr_vals`, and `*num_vals` is set to
the number of elements in the array. The `confd_attr_value_t` struct is
defined as:

<div class="informalexample">

``` c
typedef struct confd_attr_value {
    uint32_t attr;
    confd_value_t v;
} confd_attr_value_t;
```

</div>

If any attribute values are returned (`*num_vals` \> 0), the caller must
free the allocated memory by calling `confd_free_value()` for each of
the `confd_value_t` elements, and `free(3)` for the `*attr_vals` array
itself.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_ACCESS_DENIED,
CONFD_ERR_UNAVAILABLE

    int maapi_set_attr(
    int sock, int thandle, uint32_t attr, confd_value_t *v, const char *fmt, 
    ...);

Set an attribute for a configuration node. See `maapi_get_attrs()` above
for the supported attributes. To delete an attribute, call the function
with a value of type C_NOEXISTS.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_BADTYPE, CONFD_ERR_NOEXISTS,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_UNAVAILABLE

    int maapi_delete_all(
    int sock, int thandle, enum maapi_delete_how how);

This function can be used to delete "all" the configuration data within
a transaction. The `how` argument specifies the extent of "all":

`MAAPI_DEL_SAFE`  
> Delete everything except namespaces that were exported to none (with
> `tailf:export none`). Toplevel nodes that cannot be deleted due to AAA
> rules are silently left in place, but descendant nodes will still be
> deleted if the AAA rules allow it.

`MAAPI_DEL_EXPORTED`  
> Delete everything except namespaces that were exported to none (with
> `tailf:export none`). AAA rules are ignored, i.e. nodes are deleted
> even if the AAA rules don't allow it.

`MAAPI_DEL_ALL`  
> Delete everything. AAA rules are ignored.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_revert(
    int sock, int thandle);

This function removes all changes done to the transaction.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_set_flags(
    int sock, int thandle, int flags);

We can modify some aspects of the read/write session by calling this
function - these values can be used for the `flags` argument (ORed
together if more than one) with this function and/or with
`maapi_start_trans_flags()`:

<div class="informalexample">

    #define MAAPI_FLAG_HINT_BULK           (1 << 0)
    #define MAAPI_FLAG_NO_DEFAULTS         (1 << 1)
    #define MAAPI_FLAG_CONFIG_ONLY         (1 << 2)
    /* maapi_start_trans_flags() only */
    #define MAAPI_FLAG_HIDE_INACTIVE       (1 << 3)
    /* maapi_start_trans_flags() only */
    #define MAAPI_FLAG_DELAYED_WHEN        (1 << 6)
    /* maapi_start_trans_flags() only */
    #define MAAPI_FLAG_HIDE_ALL_HIDEGROUPS (1 << 8)
    /* maapi_start_trans_flags() only */
    #define MAAPI_FLAG_SKIP_SUBSCRIBERS    (1 << 9)

</div>

MAAPI_FLAG_HINT_BULK tells the ConfD backplane that we will be reading
substantial amounts of data. This has the effect that the `get_object()`
and `get_next_object()` callbacks (if available) are used towards
external data providers when we call `maapi_get_elem()` etc and
`maapi_get_next()`. The `maapi_get_object()` function always operates as
if this flag was set.

MAAPI_FLAG_NO_DEFAULTS says that we want to be informed when we read
leafs with default values that have not had a value set. This is
indicated by the returned value being of type C_DEFAULT instead of the
actual value. The default value for such leafs can be obtained from the
`confd_cs_node` tree provided by the library (see
[confd_types(3)](confd_types.3.md)).

MAAPI_FLAG_CONFIG_ONLY will make the maapi_get_xxx() functions return
config nodes only - if we attempt to read operational data, it will be
treated as if the nodes did not exist. This is mainly useful in
conjunction with `maapi_get_object()` and list entries or containers
that have both config and operational data (the operational data nodes
in the returned array will have the "value" C_NOEXISTS), but the other
functions also obey the flag.

MAAPI_FLAG_HIDE_INACTIVE can only be used with
`maapi_start_trans_flags()`, and only when starting a readonly
transaction (parameter `readwrite` == `CONFD_READ`). It will hide
configuration data that has the `CONFD_ATTR_INACTIVE` attribute set,
i.e. it will appear as if that data does not exist.

MAAPI_FLAG_DELAYED_WHEN can also only be used with
`maapi_start_trans_flags()`, but regardless of whether the flag is used
or not, the "delayed when" mode can subsequently be changed with
`maapi_set_delayed_when()`. The flag is only meaningful when starting a
read-write transaction (parameter `readwrite` == `CONFD_READ_WRITE`),
and will cause "delayed when" mode to be enabled from the beginning of
the transaction. See the description of `maapi_set_delayed_when()` for
information about the "delayed when" mode.

MAAPI_FLAG_HIDE_ALL_HIDEGROUPS can only be used with
`maapi_start_trans_flags()`. It will hide all nodes with `tailf:hidden`
statement.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_set_delayed_when(
    int sock, int thandle, int on);

This function enables (`on` non-zero) or disables (`on` == 0) the
"delayed when" mode of a transaction. When successful, it returns 1 or 0
as indication of whether "delayed when" was enabled or disabled before
the call. See also the `MAAPI_FLAG_DELAYED_WHEN` flag for
`maapi_start_trans_flags()`.

The YANG `when` statement makes its parent data definition statement
conditional. This can be problematic in cases where we don't have
control over the order of writing different data nodes. E.g. when
loading configuration from a file, the data that will satisfy the `when`
condition may occur after the data that the `when` applies to, making it
impossible to actually write the latter data into the transaction -
since the `when` isn't satisfied, the data nodes effectively do not
exist in the schema.

This is addressed by the "delayed when" mode for a transaction. When
"delayed when" is enabled, it is possible to write to data nodes even
though they are conditional on a `when` that isn't satisfied. It has no
effect on reading though - trying to read data that is conditional on an
unsatisfied `when` will always result in CONFD_ERR_NOEXISTS or
equivalent. When disabling "delayed when", any "delayed" `when`
statements will take effect immediately - i.e. if the `when` isn't
satisfied at that point, the conditional nodes and any data values for
them will be deleted. If we don't explicitly disable "delayed when" by
calling this function, it will be automatically disabled when the
transaction enters the VALIDATE state (e.g. due to call of
`maapi_apply_trans()`).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_NOEXISTS

    int maapi_set_label(
    int sock, int thandle, const char *label);

    int maapi_set_comment(
    int sock, int thandle, const char *comment);

## Ncs Specific Functions

The functions in this sections can only be used with NCS, and
specifically the maapi_shared_xxx() functions must be used for NCS
FASTMAP, i.e. in the service `create()` callback. Those functions
maintain attributes that are necessary when multiple service instances
modify the same data.

    int maapi_shared_create(
    int sock, int thandle, int flags, const char *fmt, ...);

FASTMAP version of `maapi_create()`. The `flags` parameter must be given
as 0.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOTCREATABLE,
CONFD_ERR_INUSE

    int maapi_shared_set_elem(
    int sock, int thandle, confd_value_t *v, int flags, const char *fmt, ...);

    int maapi_shared_set_elem2(
    int sock, int thandle, const char *strval, int flags, const char *fmt, 
    ...);

FASTMAP versions of `maapi_set_elem()` and `maapi_set_elem2()`. The
`flags` parameter is currently unused and should be given as 0.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_INUSE

    int maapi_shared_insert(
    int sock, int thandle, int flags, const char *fmt, ...);

FASTMAP version of `maapi_insert()`. The `flags` parameter must be given
as 0.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_BADTYPE, CONFD_ERR_NOT_WRITABLE,
CONFD_ERR_NOEXISTS, CONFD_ERR_NOTDELETABLE

    int maapi_shared_set_values(
    int sock, int thandle, const confd_tag_value_t *values, int n, int flags, 
    const char *fmt, ...);

FASTMAP version of `maapi_set_values()`. The `flags` parameter must be
given as 0.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_INUSE

    int maapi_shared_copy_tree(
    int sock, int thandle, int flags, const char *from, const char *tofmt, 
    ...);

FASTMAP version of `maapi_copy_tree()`. The `flags` parameter must be
given as 0.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_BADPATH

    int maapi_ncs_apply_template(
    int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
    int num_variables, int flags, const char *rootfmt, ...);

Apply a template that has been loaded into NCS. The `template_name`
parameter gives the name of the template. The `variables` parameter is
an `num_variables` long array of variables and names for substitution
into the template. The `struct ncs_name_value` is defined as:

<div class="informalexample">

``` c
struct ncs_name_value {
    char *name;
    char *value;
};
```

</div>

The `flags` parameter is currently unused and should be given as 0.

<div class="note">

If this function is called under FASTMAP it will have the same behavior
as the corresponding FASTMAP function
`maapi_shared_ncs_apply_template()`.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS, CONFD_ERR_XPATH

    int maapi_shared_ncs_apply_template(
    int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
    int num_variables, int flags, const char *rootfmt, ...);

FASTMAP version of `maapi_ncs_apply_template()`. Normally the `flags`
parameter should be given as 0.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS, CONFD_ERR_XPATH

    int maapi_ncs_get_templates(
    int sock, char ***templates, int *num_templates);

Retrieve a list of the templates currently loaded into NCS. On success,
a pointer to an array of template names is stored in `templates` and the
length of the array is stored in `num_templates`. The library allocates
memory for the result, and the caller is responsible for freeing it.
This can in all cases be done with code like this:

<div class="informalexample">

    char **templates;
    int num_templates, i;

    if (maapi_ncs_get_templates(sock, &templates, &num_templates) == CONFD_OK) {
        ...
        for (i = 0; i < num_templates; i++) {
            free(templates[i]);
        }
        if (num_templates > 0) {
            free(templates);
        }
    }

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_cs_node_children(
    int sock, int thandle, struct confd_cs_node *mount_point, struct confd_cs_node ***children, 
    int *num_children, const char *fmt, ...);

Retrieve a list of the children nodes of the node given by `mount_point`
that are valid for the path given by `fmt`. The `mount_point` node must
be a mount point (i.e. have the flag `CS_NODE_HAS_MOUNT_POINT` set), and
the path must lead to a specific instance of this node (including the
final keys if `mount_point` is a list node). The `thandle` parameter is
optional, i.e. it can be given as `-1` if a transaction is not
available.

On success, a pointer to an array of pointers to `struct confd_cs_node`
is stored in `children` and the length of the array is stored in
`num_children`. The library allocates memory for the array, and the
caller is responsible for freeing it by means of a call to `free(3)`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH

    struct confd_cs_node *maapi_cs_node_cd(
    int sock, int thandle, const char *fmt, ...);

Does the same thing as `confd_cs_node_cd()` (see
[confd_lib_lib(3)](confd_lib_lib.3.md)), but can handle paths that are
ambiguous due to traversing a mount point, by sending a request to the
NSO daemon. To be used when `confd_cs_node_cd()` returns `NULL` with
`confd_errno` set to `CONFD_ERR_NO_MOUNT_ID`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH

## Miscellaneous Functions

    int maapi_delete_config(
    int sock, enum confd_dbname name);

This function empties a data store.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_EXTERNAL

    int maapi_copy(
    int sock, int from_thandle, int to_thandle);

If we open two transactions from the same user session but towards
different data stores, such as one transaction towards startup and one
towards running, we can copy all data from one data store to the other
with this function. This is a replace operation - any configuration that
exists in the transaction given by `to_handle` but not in the one given
by `from_handle` will be deleted from the `to_handle` transaction.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE

    int maapi_copy_path(
    int sock, int from_thandle, int to_thandle, const char *fmt, ...);

Similar to `maapi_copy()`, but does a replacing copy only of the subtree
rooted at the path given by `fmt` and remaining arguments.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE

    int maapi_copy_tree(
    int sock, int thandle, const char *from, const char *tofmt, ...);

This function copies the entire configuration tree rooted at `from` to
`tofmt`. List entries are created accordingly. If the destination
already exists, `from` is copied on top of the destination. This
function is typically used inside actions where we for example could use
`maapi_copy_tree()` to copy a template configuration into a new list
entry. The `from` path must be pre-formatted, e.g. using
`confd_format_keypath()`, whereas the destination path is formatted by
this function.

<div class="note">

The data models for the source and destination trees must match - i.e.
they must either be identical, or the data model for the source tree
must be a proper subset of the data model for the destination tree. This
is always fulfilled when copying from one entry to another in a list, or
if both source and destination tree have been defined via YANG `uses`
statements referencing the same `grouping` definition. If a data model
mismatch is detected, e.g. an existing data node in the source tree does
not exist in the destination data model, or an existing leaf in the
source tree has a value that is incompatible with the type of the leaf
in the destination data model, `maapi_copy_tree()` will return CONFD_ERR
with `confd_errno` set to CONFD_ERR_BADPATH.

To provide further explanation, a tree is a proper subset of another
tree if it has less information than the other. For example, a tree with
the leaves a,b,c is a proper subset of a tree with the leaves a,b,c,d,e.
It is important to note that it is less information and not different
information. Therefore, a tree with different default values than
another tree is not a proper subset, or, a tree with an non-presence
container can not be a proper subset of a tree with a presence
container.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_BADPATH

    int maapi_insert(
    int sock, int thandle, const char *fmt, ...);

This function inserts a new entry in a list that uses the
`tailf:indexed-view` statement. The key must be of type integer. If the
inserted entry already exists, the existing and subsequent entries will
be renumbered as needed, unless renumbering would require an entry to
have a key value that is outside the range of the type for the key. In
that case, the function returns CONFD_ERR with `confd_errno` set to
CONFD_ERR_BADTYPE.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_BADTYPE, CONFD_ERR_NOT_WRITABLE,
CONFD_ERR_NOEXISTS, CONFD_ERR_NOTDELETABLE

    int maapi_move(
    int sock, int thandle, confd_value_t* tokey, int n, const char *fmt, ...);

This function moves an existing list entry, i.e. renames the entry using
the `tokey` parameter, which is an array containing `n` keys.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOEXISTS,
CONFD_ERR_NOTMOVABLE, CONFD_ERR_ALREADY_EXISTS

    int maapi_move_ordered(
    int sock, int thandle, enum maapi_move_where where, confd_value_t* tokey, 
    int n, const char *fmt, ...);

For a list with the YANG `ordered-by user` statement, this function can
be used to change the order of entries, by moving one entry to a new
position. When new entries in such a list are created with
`maapi_create()`, they are always placed last in the list. The path
given by `fmt` and the remaining arguments identifies the entry to move,
and the new position is given by the `where` argument:

MAAPI_MOVE_FIRST  
> Move the entry first in the list. The `tokey` and `n` arguments are
> ignored, and can be given as NULL and 0.

MAAPI_MOVE_LAST  
> Move the entry last in the list. The `tokey` and `n` arguments are
> ignored, and can be given as NULL and 0.

MAAPI_MOVE_BEFORE  
> Move the entry to the position before the entry given by the `tokey`
> argument, which is an array of key values with length `n`.

MAAPI_MOVE_AFTER  
> Move the entry to the position after the entry given by the `tokey`
> argument, which is an array of key values with length `n`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOEXISTS,
CONFD_ERR_NOTMOVABLE

    int maapi_authenticate(
    int sock, const char *user, const char *pass, char *groups[], int n);

If we are implementing a proprietary management agent with MAAPI API,
the function `maapi_start_user_session()` requires the application to
tell ConfD which groups the user are member of. ConfD itself has the
capability to authenticate users. A MAAPI application can use
`maapi_authenticate()` to let ConfD authenticate the user, as per the
AAA configuration in confd.conf

If the authentication is successful, the function returns `1`, and the
`groups[]` array is populated with at most `n-1` NUL-terminated strings
containing the group names, followed by a NULL pointer that indicates
the end of the group list. The strings are dynamically allocated, and it
is up to the caller to free the memory by calling `free(3)` for each
string. If the function is used in a context where the group names are
not needed, pass `1` for the `n` parameter.

If the authentication fails, the function returns `0`, and
`confd_lasterr()` (see [confd_lib_lib(3)](confd_lib_lib.3.md)) will
return a message describing the reason for the failure.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION

    int maapi_authenticate2(
    int sock, const char *user, const char *pass, const struct confd_ip *src_addr, 
    int src_port, const char *context, enum confd_proto prot, char *groups[], 
    int n);

This function does the same thing as `maapi_authenticate()`, but allows
for passing of the additional parameters `src_addr`, `src_port`,
`context`, and `prot`, which otherwise are passed only to
`maapi_start_user_session()`/`maapi_start_user_session2()`. These
parameters are not used when ConfD performs the authentication, but they
will be passed to an external authentication executable (see the if
/confdConfig/aaa/externalAuthentication/includeExtra is set to "true" in
`confd.conf`, see [confd.conf(5)](ncs.conf.5.md). They will also be
made available to the authentication callback that can be registered by
an application (see
[confd_lib_dp(3)](confd_lib_dp.3.md#authentication_callback)).

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_NOSESSION

    int maapi_attach(
    int sock, int hashed_ns, struct confd_trans_ctx *ctx);

While ConfD is executing a transaction, we have a number of situations
where we wish to invoke user C code which can interact in the
transaction. One such situation is when we wish to write semantic
validation code which is invoked in the validation phase of a ConfD
transaction. This code needs to execute within the context of the
executing transaction, it must thus have access to the "shadow" storage
where all not-yet-committed data is kept.

This function attaches to a existing transaction.

Another situation where we wish to attach to the executing transaction
is when we are using the notifications API and subscribe to notification
of type CONFD_NOTIF_COMMIT_DIFF and wish to read the committed diffs
from the transaction.

The `hashed_ns` parameter is basically just there to save a call to
`maapi_set_namespace()`. We can call `maapi_set_namespace()` any number
of times to change from the one we passed to `maapi_attach()`, and we
can also give the namespace in prefix form in the path parameter to the
read/write functions - see the `maapi_set_namespace()` description.

If we do not want to give a specific namespace when invoking
`maapi_attach()`, we can give 0 for the `hashed_ns` parameter (-1 works
too but is deprecated). We can still call the read/write functions as
long as the toplevel element in the path is unique, but otherwise we
must call `maapi_set_namespace()`, or use a prefix in the path.

    int maapi_attach2(
    int sock, int hashed_ns, int usid, int thandle);

When we write proprietary CLI commands in C and we wish those CLI
commands to be able to use MAAPI to read and write data inside the same
transaction the CLI command was invoked in, we do not have an
initialized transaction structure available. Then we must use this
function. CLI commands get the `usid` passed in UNIX environment
variable `CONFD_MAAPI_USID` and the `thandle` passed in environment
variable `CONFD_MAAPI_THANDLE`. We also need to use this function when
implementing such CLI commands via action `command()` callbacks, see the
[confd_lib_dp(3)](confd_lib_dp.3.md) man page. In this case the `usid`
is provided via `uinfo->usid` and the `thandle` via
`uinfo->actx.thandle`. To use the user session id that is the owner of
the transaction, set `usid` to 0. If the namespace does not matter set
`hashed_ns` to 0, see `maapi_attach()`.

    int maapi_attach_init(
    int sock, int *thandle);

This function is used to attach the MAAPI socket to the special
transaction available in phase0 used for CDB initialization and upgrade.
The function is also used if we need to modify CDB data during
in-service data model upgrade. The transaction handle, which is used in
subsequent calls to MAAPI, is filled in by the function upon successful
return. See the CDB chapter in the Development Guide.

    int maapi_detach(
    int sock, struct confd_trans_ctx *ctx);

Detaches an attached MAAPI socket. This function is typically called in
the `stop()` callback in validation code. An attached MAAPI socket will
be automatically detached when the ConfD transaction terminates. This
function performs an explicit detach.

    int maapi_detach2(
    int sock, int thandle);

Detaches an attached MAAPI socket when we do not have an initialized
transaction structure available, see `maapi_attach2()` above. This is
mainly useful in an action `command()` callback.

    int maapi_diff_iterate(
    int sock, int thandle, enum maapi_iter_ret (*iter
          kp, enum maapi_iter_op op, 
    confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate);

This function can be called from an attached MAAPI session. The purpose
of the function is to iterate through the transaction diff. It can
typically be used in conjunction with the notification API when we
subscribe to CONFD_NOTIF_COMMIT_DIFF events. It can also be used inside
validation callbacks.

For all diffs in the transaction the supplied callback function `iter()`
will be called. The `iter()` callback receives the `confd_hkeypath_t kp`
which uniquely identifies which node in the data tree that is affected,
the operation, and an optional value. The `op` parameter gives the
modification as:

MOP_CREATED  
> The list entry, `presence` container, or leaf of type `empty` (unless
> in a `union`, see the C_EMPTY section in
> [confd_types(3)](confd_types.3.md)) given by `kp` has been created.

MOP_DELETED  
> The list entry, `presence` container, or optional leaf given by `kp`
> has been deleted.

MOP_MODIFIED  
> A descendant of the list entry given by `kp` has been modified.

MOP_VALUE_SET  
> The value of the leaf given by `kp` has been set to `newv`. If the
> MAAPI_FLAG_NO_DEFAULTS flag has been set and the default value for the
> leaf has come into effect, `newv` will be of type C_DEFAULT instead of
> giving the default value.

MOP_MOVED_AFTER  
> The list entry given by `kp`, in an `ordered-by user` list, has been
> moved. If `newv` is NULL, the entry has been moved first in the list,
> otherwise it has been moved after the entry given by `newv`. In this
> case `newv` is a pointer to an array of key values identifying an
> entry in the list. The array is terminated with an element that has
> type C_NOEXISTS.
>
> If a list entry has been created and moved at the same time, the
> callback is first called with MOP_CREATED and then with
> MOP_MOVED_AFTER.
>
> If a list entry has been modified and moved at the same time, the
> callback is first called with MOP_MODIFIED and then with
> MOP_MOVED_AFTER.

MOP_ATTR_SET  
> An attribute for the node given by `kp` has been modified (see the
> description of `maapi_get_attrs()` for the supported attributes). The
> `iter()` callback will only get this invocation when attributes are
> enabled in `confd.conf` (/confdConfig/enableAttributes, see
> [confd.conf(5)](ncs.conf.5.md)) *and* the flag `ITER_WANT_ATTR` has
> been passed to `maapi_diff_iterate()`. The `newv` parameter is a
> pointer to a 2-element array, where the first element is the attribute
> represented as a `confd_value_t` of type `C_UINT32` and the second
> element is the value the attribute was set to. If the attribute has
> been deleted, the second element is of type `C_NOEXISTS`.

The `oldv` parameter passed to `iter()` is always NULL.

If `iter()` returns ITER_STOP, no more iteration is done, and CONFD_OK
is returned. If `iter()` returns ITER_RECURSE iteration continues with
all children to the node. If `iter()` returns ITER_CONTINUE iteration
ignores the children to the node (if any), and continues with the node's
sibling. If, for some reason, the `iter()` function wants to return
control to the caller of `maapi_diff_iterate()` *before* all the changes
have been iterated over it can return ITER_SUSPEND. The caller then has
to call `maapi_diff_iterate_resume()` to continue/finish the iteration.

The `flags` parameter is a bitmask with the following bits:

ITER_WANT_ATTR  
> Enable `MOP_ATTR_SET` invocations of the `iter()` function.

ITER_WANT_P_CONTAINER  
> Invoke `iter()` for modified presence-containers.

The `state` parameter can be used for any user supplied state (i.e.
whatever is supplied as `init_state` is passed as `state` to `iter()` in
each invocation).

The `iter()` invocations are not subjected to AAA checks, i.e.
regardless of which path we have and which context was used to create
the MAAPI socket, all changes are provided.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_BADSTATE.

CONFD_ERR_BADSTATE is returned when we try to iterate on a transaction
which is in the wrong state and not attached.

    int maapi_keypath_diff_iterate(
    int sock, int thandle, enum maapi_iter_ret (*iter
          kp, enum maapi_iter_op op, 
    confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate, 
    const char *fmtpath, ...);

This function behaves precisely like the `maapi_diff_iterate()` function
except that it takes an additional format path argument. This path
prunes the diff and only changes below the provided path are considered.

    int maapi_diff_iterate_resume(
    int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
          kp, 
    enum maapi_iter_op op, confd_value_t *oldv, confd_value_t *newv, void *state, 
    void *resumestate);

The application *must* call this function to finish up the iteration
whenever an iterator function for `maapi_diff_iterate()` or
`maapi_keypath_diff_iterate()` has returned ITER_SUSPEND. If the
application does not wish to continue iteration, it must at least call
`maapi_diff_iterate_resume(s, ITER_STOP, NULL, NULL);` to clean up the
state. The `reply` parameter is what the iterator function would have
returned (i.e. normally ITER_RECURSE or ITER_CONTINUE) if it hadn't
returned ITER_SUSPEND. Note that it is up to the iterator function to
somehow communicate that it has returned ITER_SUSPEND to the caller of
`maapi_diff_iterate()` or `maapi_keypath_diff_iterate()`, this can for
example be a field in a struct for which a pointer can be passed back
and forth via the `state`/`resumestate` parameters.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_BADSTATE.

    int maapi_iterate(
    int sock, int thandle, enum maapi_iter_ret (*iter
          kp, confd_value_t *v, 
    confd_attr_value_t *attr_vals, int num_attr_vals, void *state, int flags, 
    void *initstate, const char *fmtpath, ...);

This function can be used to iterate over all the data in a transaction
and the underlying data store, as opposed to iterating over only the
changes like `maapi_diff_iterate()` and `maapi_keypath_diff_iterate()`
do. The `fmtpath` parameter can be used to prune the iteration to cover
only the subtree below the given path, similar to
`maapi_keypath_diff_iterate()` - if `fmtpath` is given as `"/"`, there
will not be any such pruning. Additionally, if the flag
`MAAPI_FLAG_CONFIG_ONLY` is in effect (see `maapi_set_flags()`), all
operational data subtrees will be excluded from the iteration.

The supplied callback function `iter()` will be called for each node in
the data tree included in the iteration. It receives the `kp` parameter
which uniquely identifies the node, and if the node is a leaf with a
type, also the value of the leaf as the `v` parameter - otherwise `v` is
NULL.

The `flags` parameter is a bitmask with the following bits:

ITER_WANT_ATTR  
> If this flag is given and the node has any attributes set, the
> `attr_vals` parameter will point to a `num_attr_vals` long array of
> attributes and values (see `maapi_get_attrs()`), otherwise `attr_vals`
> is NULL.

The return value from `iter()` has the same effect as for
`maapi_diff_iterate()`, except that if ITER_SUSPEND is returned, the
caller then has to call `maapi_iterate_resume()` to continue/finish the
iteration.

    int maapi_iterate_resume(
    int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
          kp, 
    confd_value_t *v, confd_attr_value_t *attr_vals, int num_attr_vals, void *state, 
    void *resumestate);

The application *must* call this function to finish up the iteration
whenever an iterator function for `maapi_iterate()` has returned
ITER_SUSPEND. If the application does not wish to continue iteration, it
must at least call `maapi_iterate_resume(s, ITER_STOP, NULL, NULL);` to
clean up the state. The `reply` parameter is what the iterator function
would have returned (i.e. normally ITER_RECURSE or ITER_CONTINUE) if it
hadn't returned ITER_SUSPEND. Note that it is up to the iterator
function to somehow communicate that it has returned ITER_SUSPEND to the
caller of `maapi_iterate()`, this can for example be a field in a struct
for which a pointer can be passed back and forth via the
`state`/`resumestate` parameters.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_BADSTATE.

    int maapi_get_running_db_status(
    int sock);

If a transaction fails in the commit() phase, the configuration database
is in in a possibly inconsistent state. This function queries ConfD on
the consistency state. Returns 1 if the configuration is consistent and
0 otherwise.

    int maapi_set_running_db_status(
    int sock, int status);

This function explicitly sets ConfDs notion of the consistency state.

    int maapi_request_action(
    int sock, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
    int *nvalues, int hashed_ns, const char *fmt, ...);

Invoke an action defined in the data model. The `params` and `values`
arrays are the parameters for and results from the action, respectively,
and use the Tagged Value Array format described in the [XML
STRUCTURES](confd_types.3.md#xml_structures) section of the
[confd_types(3)](confd_types.3.md) manual page. The library allocates
memory for the result values, and the caller is responsible for freeing
it. This can in all cases be done with code like this:

<div class="informalexample">

    confd_tag_value_t *values;
    int nvalues = 0, i;

    if (maapi_request_action(sock, params, nparams,
                             &values, &nvalues, myprefix__ns,
                             "/path/to/action") == CONFD_OK) {
        ...
        for (i = 0; i < nvalues; i++)
            confd_free_value(CONFD_GET_TAG_VALUE(&values[i]));
        if (nvalues > 0)
            free(values);
    }

</div>

However if the value array is known not to include types that require
memory allocation (see `maapi_get_elem()` above), only the array itself
needs to be freed.

The socket must have an established user session. The path given by
`fmt` and the varargs list is the full path to the action, i.e. the
final element must be the name of the action in the data model. Since
actions are not associated with ConfD transactions, the namespace must
be provided and the path must be absolute - but see
`maapi_request_action_th()` below.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_EXTERNAL

    int maapi_request_action_th(
    int sock, int thandle, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
    int *nvalues, const char *fmt, ...);

Does the same thing as `maapi_request_action()`, but uses the current
namespace, the path position, and the user session from the transaction
indicated by `thandle`, and makes the transaction handle available to
the action() callback, see [confd_lib_dp(3)](confd_lib_dp.3.md) (this
is the only relation to the transaction, and the transaction is not
affected in any way by the call itself). This function may be convenient
in some cases where actions are invoked in conjunction with a
transaction, and it must be used if the action needs to access the
transaction store.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_EXTERNAL

    int maapi_request_action_str_th(
    int sock, int thandle, char **output, const char *cmd_fmt, const char *path_fmt, 
    ...);

Does the same thing as `maapi_request_action_th()`, but takes the
parameters as a string and returns the result as a string. The library
allocates memory for the result string, and the caller is responsible
for freeing it. This can in all cases be done with code like this:

<div class="informalexample">

    char *output = NULL;

    if (maapi_request_action_str_th(sock, th, &output,
        "test reverse listint [ 1 2 3 4 ]", "/path/to/action") == CONFD_OK) {
        ...
        free(output);
    }

</div>

The varargs in the end of the function must contain all values listed in
both format strings (that is `cmd_fmt` and `path_fmt`) in the same order
as they occur in the strings. Here follows an equivalent example which
uses the format strings:

<div class="informalexample">

    char *output = NULL;

    if (maapi_request_action_str_th(sock, th, &output,
        "test %s [ 1 2 3 %d ]", "%s/action",
        "reverse listint", 4, "/path/to") == CONFD_OK) {
        ...
        free(output);
    }

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_ACCESS_DENIED, CONFD_ERR_EXTERNAL

    int maapi_start_progress_span(
    int sock, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
    const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
    int num_links, const char *path_fmt, ...);

Starts a progress span. Progress spans are trace messages written to the
progress trace and the developer log. A progress span consists of a
start and a stop event which can be used to calculate the duration
between the two. Those events can be identified with unique span-ids.
Inside the span it is possible to start new spans, which will then
become child spans, the parent-span-id is set to the previous spans'
span-id. A child span can be used to calculate the duration of a sub
task, and is started from consecutive `maapi_start_progress_span()`
calls, and is ended with `maapi_end_progress_span()`.

The concepts of traces, trace-id and spans are highly influenced by
https://opentelemetry.io/docs/concepts/signals/traces/#spans

If the filters in a configured progress trace matches and the `verbose`
is the same as /progress/trace/verbosity or higher then a message `msg`
will be written to the trace. Other fields than the message can be set
by the following: `attributes` a key-value list of user defined
attributes. `links` is a list of already existing trace_id's and/or
span_id's. `path` is a keypath, e.g. of an action/leaf/service/etc.

If successful `result` when non-NULL are set to span_id and the trace_id
of the span.

<div class="informalexample">

    confd_progress_span sp1, sp11, sp12;
    struct ncs_name_value attrs[] = {
        {"mem", "9001 GB"},
        {"city", "Gnarp"},
        {"sys", "Windows Me"}
    };
    struct confd_progress_link links[] = {
        {"893786b8-9120-49d5-95a4-f687e77cf013", "903a0b0a4ac9da83"},
        {"99d9b7d3-33dc-4cd7-938f-0c7b0ad94b8e", "655ca8f697871597"}
    };
    char *ann = NULL;

    memset(&sp1, 0, sizeof(sp1));
    memset(&sp11, 0, sizeof(sp11));
    memset(&sp12, 0, sizeof(sp12));

    // root span
    maapi_start_progress_span(ms, &sp1,
        "Refresh DNS",
        CONFD_VERBOSITY_NORMAL, attrs, 3, links, 2,
        "/dns/server{2620:119:35::35}/refresh");
    printf("got span-id=%s trace-id=%s\n", sp1.span_id, sp1.trace_id);

    // child span 1
    maapi_start_progress_span(ms, &sp11,
        "Defragmenting hard drive",
        CONFD_VERBOSITY_DEBUG, NULL, 0, NULL, 0, "/");
    defrag_hdd();
    maapi_end_progress_span(ms, &sp11, NULL);

    // child span 2
    maapi_start_progress_span(ms, &sp12, "Flush DNS cache",
        CONFD_VERBOSITY_DEBUG, NULL, 0, NULL, 0, "/");
    if (flush_cache() == 0) {
        ann = "successful";
    } else {
        ann = "failed";
    }
    maapi_end_progress_span(ms, &sp12, ann);

    // info event
    maapi_progress_info(ms, "5 servers updated",
        CONFD_VERBOSITY_DEBUG, NULL, 0, NULL, 0, "/");

    maapi_end_progress_span(ms, &sp1, NULL);

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_EXTERNAL

    int maapi_start_progress_span_th(
    int sock, int thandle, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
    const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
    int num_links, const char *path_fmt, ...);

Does the same thing as `maapi_start_progress_span()`, but uses the
current namespace, and the user session from the transaction indicated
by `thandle`

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_EXTERNAL

    int maapi_progress_info(
    int sock, const char *msg, enum confd_progress_verbosity verbosity, const struct ncs_name_value *attrs, 
    int num_attrs, const struct confd_progress_link *links, int num_links, 
    const char *path_fmt, ...);

While spans represents a pair of data points: start and stop; info
events are instead singular events, one point in time. Call
`maapi_progress_info()` to write a progress span info event to the
progress trace. The info event will have the same span-id as the start
and stop events of the currently ongoing progress span in the active
user session or transaction. See `maapi_start_progress_span()` for more
information.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_EXTERNAL

    int maapi_progress_info_th(
    int sock, int thandle, const char *msg, enum confd_progress_verbosity verbosity, 
    const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
    int num_links, const char *path_fmt, ...);

Does the same thing as `maapi_progress_info()`, but uses the current
namespace and the user session from the transaction indicated by
`thandle`

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSESSION,
CONFD_ERR_BADPATH, CONFD_ERR_NOEXISTS, CONFD_ERR_BADTYPE,
CONFD_ERR_EXTERNAL

    int maapi_end_progress_span(
    int sock, const confd_progress_span *span, const char *annotation);

Ends progress spans started from `maapi_start_progress_span()` or
`maapi_start_progress_span_th()`, a call to this function writes the
stop event to the progress trace. Ending a parent span implicitly ends
the child spans as well.

`annotation` when non-NULL writes a message on the stop event to the
progress trace.

If successful, the function returns the timestamp of the stop event.

*Errors*: CONFD_ERR_OS, CONFD_ERR_NOSESSION

    int maapi_xpath2kpath(
    int sock, const char *xpath, confd_hkeypath_t **hkp);

Convert a XPath path to a hashed keypath. The XPath expression must be
an "instance identifier", i.e. all elements and keys must be fully
specified. Namespace prefixes are optional, unless required to resolve
ambiguities (e.g. when multiple namespaces have the same root element).

The conversion will fail with CONFD_ERR_NO_MOUNT_ID if the provided
XPath traverses a mount point.

The returned keypath is dynamically allocated, and may further contain
dynamically allocated elements. The caller must free the allocated
memory, easiest done by calling `confd_free_hkeypath()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NO_MOUNT_ID

    int maapi_xpath2kpath_th(
    int sock, int thandle, const char *xpath, confd_hkeypath_t **hkp);

Does the same thing as `maapi_xpath2kpath`, but is capable of traversing
mount points using the transaction indicated by `thandle` to read mount
point information.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH

    int maapi_user_message(
    int sock, const char *to, const char *message, const char *sender);

Send a message to a specific user, a specific user session or all users
depending on the `to` parameter. If set to a user name, then `message`
will be delivered to all CLI and Web UI sessions by that user. If set to
an integer string, eg "10", then `message` will be delivered to that
specific user session, CLI or Web UI. If set to "all" then all users
will get the `message`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_sys_message(
    int sock, const char *to, const char *message);

Send a message to a specific user, a specific user session or all users
depending on the `to` parameter. If set to a user name, then `message`
will be delivered to all CLI and Web UI sessions by that user. If set to
an integer string, eg "10", then `message` will be delivered to that
specific user session, CLI or Web UI. If set to "all" then all users
will get the `message`. No formatting of the message is performed as
opposed to the user message where a timestamp and sender information is
added to the message.

System messages will be buffered until the ongoing command is finished
or is terminated by the user. In case of receiving too many system
messages during an ongoing command, the corresponding CLI process may
choke and slow down throughput which, in turn, causes memory to grow
over time. In order to prevent this from happening, buffered messages
are limited to 1000 and any incoming messages will be discarded once
this limit is exceeded.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_prio_message(
    int sock, const char *to, const char *message);

Send a high priority message to a specific user, a specific user session
or all users depending on the `to` parameter. If set to a user name,
then `message` will be delivered to all CLI and Web UI sessions by that
user. If set to an integer string, eg "10", then `message` will be
delivered to that specific user session, CLI or Web UI. If set to "all"
then all users will get the `message`. No formatting of the message is
performed as opposed to the user message where a timestamp and sender
information is added to the message.

The message will not be delayed until the user terminates any ongoing
command but will be output directly to the terminal without delay.
Messages sent using the maapi_sys_message and maapi_user_message, on the
other hand, are not displayed in the middle of some other output but
delayed until the any ongoing commands have terminated.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_prompt(
    int sock, int usess, const char *prompt, int echo, char *res, int size);

Prompt user for a string. The `echo` parameter is used to control if the
input should be echoed or not. If set to CONFD_ECHO all input will be
visible and if set to CONFD_NOECHO only stars will be shown instead of
the actual characters entered by the user. The resulting string will be
stored in `res` and it will be NUL terminated.

This function is intended to be called from inside an action callback
when invoked from the CLI.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_prompt2(
    int sock, int usess, const char *prompt, int echo, int timeout, char *res, 
    int size);

This function does the same as `maapi_cli_prompt()`, but also takes a
non-negative `timeout` parameter, which controls how long (in seconds)
to wait for input before aborting.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_EOF,
CONFD_ERR_NOEXISTS

    int maapi_cli_prompt_oneof(
    int sock, int usess, const char *prompt, char **choice, int count, char *res, 
    int size);

Prompt user for one of the strings given in the `choice` parameter. For
example:

<div class="informalexample">

    int res;
    char buf[BUFSIZ];
    char *choice[] = {"yes","no"};

    ...

    res = maapi_cli_prompt_oneof(sock, uinfo->usid,
                                 "Do you want to proceed (yes/no): ",
                                 choice, 2, buf, BUFSIZ);

</div>

The user can enter a unique prefix of the choice but the value returned
in buf will always be one of the strings provided in the `choice`
parameter or an empty string if the user hits the enter key without
entering any value. The result string stored in buf is NUL terminated.
If the user enters a value not in `choice` he will automatically be
re-prompted. For example:

<div class="informalexample">

    Do you want to proceed (yes/no): maybe
    The value must be one of: yes,no.
    Do you want to proceed (yes/no):

</div>

This function is intended to be called from inside an action callback
when invoked from the CLI.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_prompt_oneof2(
    int sock, int usess, const char *prompt, char **choice, int count, int timeout, 
    char *res, int size);

This function does the same as `maapi_cli_promt_oneof()`, but also takes
a `timeout` parameter. If no activity is seen for `timeout` seconds an
error is returned.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_read_eof(
    int sock, int usess, int echo, char *res, int size);

Read a multi line string from the CLI. The user has to end the input
using ctrl-D. The entered characters will be stored NUL terminated in
res. The `echo` parameters controls if the entered characters should be
echoed or not. If set to CONFD_ECHO they will be visible and if set to
CONFD_NOECHO stars will be echoed instead.

This function is intended to be called from inside an action callback
when invoked from the CLI.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_read_eof2(
    int sock, int usess, int echo, int timeout, char *res, int size);

This function does the same as `maapi_cli_read_eof()`, but also takes a
`timeout` parameter, which indicates how long the user may be idle (in
seconds) before the reading is aborted.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_write(
    int sock, int usess, const char *buf, int size);

Write to the CLI.

This function is intended to be called from inside an action callback
when invoked from the CLI.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_printf(
    int sock, int usess, const char *fmt);

Write to the CLI using printf formatting. This function is intended to
be called from inside an action callback when invoked from the CLI.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_vprintf(
    int sock, int usess, const char *fmt, va_list args);

Does the same as `maapi_cli_printf()`, but takes a single `va_list`
argument instead of a variable number of arguments, like `vprintf()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_accounting(
    int sock, const char *user, const int usid, const char *cmdstr);

Generate an audit log entry in the CLI audit log.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_diff_cmd(
    int sock, int thandle, int thandle_old, char *res, int size, int flags, 
    const char *fmt, ...);

Get the diff between two sessions as C-/I-style CLI commands.

If no changes exist between the two sessions for the given path
CONFD_ERR_BADPATH will be returned.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_diff_cmd2(
    int sock, int thandle, int thandle_old, char *res, int *size, int flags, 
    const char *fmt, ...);

Same as `maapi_cli_diff_cmd()` but \*size will be updated to full length
of the result on success.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_path_cmd(
    int sock, int thandle, char *res, int size, int flags, const char *fmt, 
    ...);

This function tries to determine which C-/I-style CLI command can be
associated with a given path in the data model in context of a given
transaction. This is determined by running the formatting code used by
the 'show running-config' command for the subtree given by the path, and
the looking for text lines associated with the given path.
Consequentcly, if the path does not exist in the transaction no output
will be generated, or if tailf:cli- annotations have been used to
suppress the 'show running-config' text for a path then no such command
can be derived.

The `flags` can be given as `MAAPI_FLAG_EMIT_PARENTS` to enable the
commands to reach the submode for the path to be emitted.

The `flags` can be given as `MAAPI_FLAG_DELETE` to emit the command to
delete the given path.

The `flags` can be given as `MAAPI_FLAG_NON_RECURSIVE` to prevent that
all children to a container or list item are displayed.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd_to_path(
    int sock, const char *line, char *ns, int nsize, char *path, int psize);

Given a data model path formatted as a C- and I-style command, try to
determine the corresponding namespace and path. If the string cannot be
interpreted as a path an error message is given indicating that the
string is either an operational mode command, a configuration mode
command, or just badly formatted. The string is interpreted in the
context of the current running configuration, ie all xpath expressions
in the data model are evaluated in the context of the running config.
Note that the same input may result in a correct answer when invoked
with one state of the running config, and an error if the running config
has another state due to different list elements being present, or xpath
(when and display-when) expressions are being evaluated differently.

This function requires that the socket has an established user session.

The `line` is the NUL terminated string of command tokens to be
interpreted.

The `ns` and `path` parameters are used for storing the resulting
namespace and path.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd_to_path2(
    int sock, int thandle, const char *line, char *ns, int nsize, char *path, 
    int psize);

Given a data model path formatted as a C- and I-style command, try to
determine the corresponding namespace and path. If the string cannot be
interpreted as a path an error message is given indicating that the
string is either an operational mode command, a configuration mode
command, or just badly formatted. The string is interpreted in the
context of the provided transaction handler, ie all xpath expressions in
the data model are evaluated in the context of the transaction. Note
that the same input may result in a correct answer when invoked with one
state of one config, and an error when given another config due to
different list elements being present, or xpath (when and display-when)
expressions are being evaluated differently.

This function requires that the socket has an established user session.

The `th` is a transaction handler.

The `line` is the NUL terminated string of command tokens to be
interpreted.

The `ns` and `path` parameters are used for storing the resulting
namespace and path.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd(
    int sock, int usess, const char *buf, int size);

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback
when invoked from the CLI.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd2(
    int sock, int usess, const char *buf, int size, int flags);

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback
when invoked from the CLI. The flags field is used to disable certain
checks during the execution. The value is a bitmask.

MAAPI_CMD_NO_FULLPATH  
> Do not perform the fullpath check on show commands.

MAAPI_CMD_NO_HIDDEN  
> Allows execution of hidden CLI commands.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd3(
    int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
    int usize);

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback
when invoked from the CLI. The flags field is used to disable certain
checks during the execution. The value is a bitmask.

MAAPI_CMD_NO_FULLPATH  
> Do not perform the fullpath check on show commands.

MAAPI_CMD_NO_HIDDEN  
> Allows execution of hidden CLI commands.

The unhide parameter is used for passing a hide group which is unhidden
during the execution of the command.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd4(
    int sock, int usess, const char *buf, int size, int flags, char **unhide, 
    int usize);

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback
when invoked from the CLI. The flags field is used to disable certain
checks during the execution. The value is a bitmask.

MAAPI_CMD_NO_FULLPATH  
> Do not perform the fullpath check on show commands.

MAAPI_CMD_NO_HIDDEN  
> Allows execution of hidden CLI commands.

The unhide parameter is used for passing hide groups which are unhidden
during the execution of the command.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd_io(
    int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
    int usize);

Execute CLI command in ongoing CLI session and output result on socket.

This function is intended to be called from inside an action callback
when invoked from the CLI. The flags field is used to disable certain
checks during the execution. The value is a bitmask.

MAAPI_CMD_NO_FULLPATH  
> Do not perform the fullpath check on show commands.

MAAPI_CMD_NO_HIDDEN  
> Allows execution of hidden CLI commands.

The unhide parameter is used for passing a hide group which is unhidden
during the execution of the command.

The function returns `CONFD_ERR` on error or a positive integer id that
can subsequently be used together with `confd_stream_connect()`. ConfD
will write all data in a stream on that socket and when done, ConfD will
close its end of the socket.

Once the stream socket is connected we can read the output from the cli
command data on the socket. We need to continue reading until we receive
EOF on the socket. To check if the command was successful we use the
function. `maapi_cli_cmd_io_result()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd_io2(
    int sock, int usess, const char *buf, int size, int flags, char **unhide, 
    int usize);

Execute CLI command in ongoing CLI session and output result on socket.

This function is intended to be called from inside an action callback
when invoked from the CLI. The flags field is used to disable certain
checks during the execution. The value is a bitmask.

MAAPI_CMD_NO_FULLPATH  
> Do not perform the fullpath check on show commands.

MAAPI_CMD_NO_HIDDEN  
> Allows execution of hidden CLI commands.

The unhide parameter is used for passing hide groups which are unhidden
during the execution of the command.

The function returns `CONFD_ERR` on error or a positive integer id that
can subsequently be used together with `confd_stream_connect()`. ConfD
will write all data in a stream on that socket and when done, ConfD will
close its end of the socket.

Once the stream socket is connected we can read the output from the cli
command data on the socket. We need to continue reading until we receive
EOF on the socket. To check if the command was successful we use the
function. `maapi_cli_cmd_io_result()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_cmd_io_result(
    int sock, int id);

We use this function to read the status of executing a cli command and
streaming the result over a socket. The `sock` parameter must be the
same maapi socket we used for `maapi_cli_cmd_io()` and the `id`
parameter is the `id` returned by `maapi_cli_cmd_io()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_ACCESS_DENIED,
CONFD_ERR_EXTERNAL

    int maapi_cli_get(
    int sock, int usess, const char *opt, char *res, int size);

Read CLI session parameter or attribute.

This function is intended to be called from inside an action callback
when invoked from the CLI.

Possible params are complete-on-space, idle-timeout,
ignore-leading-space, paginate, "output file", "screen length", "screen
width", terminal, history, autowizard, "show defaults", and if enabled,
display-level. In addition to this the attributes called annotation,
tags and inactive can be read.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_cli_set(
    int sock, int usess, const char *opt, const char *value);

Set CLI session parameter.

This function is intended to be called from inside an action callback
when invoked from the CLI.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_set_readonly_mode(
    int sock, int flag);

There are certain situations where we want to explicitly control if a
ConfD instance should be able to handle write operations from the
northbound agents. In certain high-availability scenarios we may want to
ensure that a node is a true readonly node, i.e. it should not be
possible to initiate new write transactions on that node.

It can also be interesting in upgrade scenarios where we are interested
in making sure that no configuration changes can occur during some
interval.

This function toggles the readonly mode of a ConfD instance. If the
`flag` parameter is non-zero, ConfD will be set in readonly mode, if it
is zero, ConfD will be taken out of readonly mode. It is also worth to
note that when a ConfD HA node is a secondary as instructed by the
application, no write transactions can occur regardless of the value of
the flag set by this function.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_disconnect_remote(
    int sock, const char *address);

Disconnect all remote connections between `CONFD_IPC_PORT` and
`address`.

Since ConfD clients, e.g. CDB readers/subscribers, are connected using
TCP it is also possible to do this remotely over a network. However
since TCP doesn't offer a fast and reliable way of detecting that the
other end has disappeared ConfD can get stuck waiting for a reply from
such a disconnected client.

In some environments there will be an alternative supervision method
that can detect when a remote host is unavailable, and in that situation
this function can be used to instruct ConfD to drop all remote
connections to a particular host. The address parameter is an IP address
as a string, and the socket is a maapi socket obtained using
`maapi_connect()`. On success, the function returns the number of
connections that were closed.

<div class="note">

ConfD will close all its sockets with remote address `address`, *except*
HA connections. For HA use `confd_ha_secondary_dead()` or an HA state
transition.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADTYPE,
CONFD_ERR_UNAVAILABLE

    int maapi_disconnect_sockets(
    int sock, int *sockets, int nsocks);

This function is an alternative to `maapi_disconnect_remote()` that can
be useful in particular when using the "External IPC" functionality. In
this case ConfD does not have any knowledge of the remote address of the
IPC connections, and thus `maapi_disconnect_remote()` is not applicable.
The `maapi_disconnect_sockets()` instead takes an array of `nsocks`
socket file descriptor numbers for the `sockets` parameter.

ConfD will close all connected sockets whose local file descriptor
number is included the `sockets` array. The file descriptor numbers can
be obtained e.g. via the `lsof(8)` command, or some similar tool in case
`lsof` does not support the IPC mechanism that is being used.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADTYPE

    int maapi_save_config(
    int sock, int thandle, int flags, const char *fmtpath, ...);

This function can be used to save the entire config (or a subset
thereof) in different formats. The `flags` parameter controls the saving
as follows. The value is a bitmask.

`MAAPI_CONFIG_XML`  
> The configuration format is XML.

`MAAPI_CONFIG_XML_PRETTY`  
> The configuration format is pretty printed XML.

`MAAPI_CONFIG_JSON`  
> The configuration is in JSON format.

`MAAPI_CONFIG_J`  
> The configuration is in curly bracket Juniper CLI format.

`MAAPI_CONFIG_C`  
> The configuration is in Cisco XR style format.

`MAAPI_CONFIG_TURBO_C`  
> The configuration is in Cisco XR style format. And a faster parser
> than the normal CLI will be used.

`MAAPI_CONFIG_C_IOS`  
> The configuration is in Cisco IOS style format.

`MAAPI_CONFIG_XPATH`  
> The `fmtpath` and remaining arguments give an XPath filter instead of
> a keypath. Can only be used with `MAAPI_CONFIG_XML` and
> `MAAPI_CONFIG_XML_PRETTY`.

`MAAPI_CONFIG_WITH_DEFAULTS`  
> Default values are part of the configuration dump.

`MAAPI_CONFIG_SHOW_DEFAULTS`  
> Default values are also shown next to the real configuration value.
> Applies only to the CLI formats.

`MAAPI_CONFIG_WITH_OPER`  
> Include operational data in the dump.

`MAAPI_CONFIG_HIDE_ALL`  
> Hide all hidden nodes (see below).

`MAAPI_CONFIG_UNHIDE_ALL`  
> Unhide all hidden nodes (see below).

`MAAPI_CONFIG_WITH_SERVICE_META`  
> Include NCS service-meta-data attributes (refcounter, backpointer, and
> original-value) in the dump.

`MAAPI_CONFIG_NO_PARENTS`  
> When a path is provided its parent nodes are by default included. With
> this option the output will begin immediately at path - skipping any
> parents.

`MAAPI_CONFIG_OPER_ONLY`  
> Include *only* operational data, and ancestors to operational data
> nodes, in the dump.

`MAAPI_CONFIG_NO_BACKQUOTE`  
> This option can only be used together with MAAPI_CONFIG_C and
> MAAPI_CONFIG_C_IOS. When set backslash will not be quoted in strings.

`MAAPI_CONFIG_CDB_ONLY`  
> Include only data stored in CDB in the dump. By default only
> configuration data is included, but the flag can be combined with
> either `MAAPI_CONFIG_WITH_OPER` or `MAAPI_CONFIG_OPER_ONLY` to save
> both configuration and operational data, or only operational data,
> respectively.

`MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY`  
> Include only data that the user has read_write access to in the dump.
> If using `maapi_save_config()` without this flag, the dump will
> include data that the user has read access to.

The provided path indicates which part(s) of the configuration to save.
By default it is interpreted as a keypath as for other MAAPI functions,
and thus identifies the root of a subtree to save. However it is
possible to indicate wildcarding of list keys by completely omitting key
elements - i.e. this requests save of a subtree for each entry of the
corresponding list. For `MAAPI_CONFIG_XML` and `MAAPI_CONFIG_XML_PRETTY`
it is alternatively possible to give an XPath filter, by including the
flag `MAAPI_CONFIG_XPATH`.

If for example `fmtpath` is "/aaa:aaa/authentication/users" we dump a
subtree of the AAA data, while if it is
"/aaa:aaa/authentication/users/user/homedir", we dump only the homedir
leaf for each user in the AAA data. If `fmtpath` is NULL, the entire
configuration is dumped, except that namespaces with restricted export
(from `tailf:export`) are treated as follows:

- When the `MAAPI_CONFIG_XML` or `MAAPI_CONFIG_XML_PRETTY` formats are
  used, the context of the user session that started the transaction is
  used to select namespaces with restricted export. If the "system"
  context is used, all namespaces are selected, regardless of export
  restriction.

- When one of the CLI formats is used, the context used to select
  namespaces with restricted export is always "cli".

By default, the treatment of nodes with a `tailf:hidden` statement
depends on the state of the transaction. For a transaction started via
MAAPI, no nodes are hidden, while for a transaction started by another
northbound agent (e.g. CLI) and attached to, the nodes that are hidden
are the same as in that agent session. The default can be overridden by
using one of the flags:

- `MAAPI_FLAG_HIDE_ALL_HIDEGROUPS` use with `maapi_start_trans_flags()`.

- `MAAPI_CONFIG_HIDE_ALL` use with `maapi_save_config()` and
  `maapi_load_config()`.

- `MAAPI_CONFIG_UNHIDE_ALL` use with `maapi_save_config()` and
  `maapi_load_config()`.

The function returns `CONFD_ERR` on error or a positive integer id that
can subsequently be used together with `confd_stream_connect()`. Thus
this function doesn't save the configuration to a file, but rather it
returns an integer than is used together with a ConfD stream socket.
ConfD will write all data in a stream on that socket and when done,
ConfD will close its end of the socket. Thus the following code snippet
indicates the usage pattern of this function.

<div class="informalexample">

    int id;
    int streamsock;
    struct sockaddr_in addr;

    id = maapi_save_config(sock, th, flags, path);
    if (id < 0) {
        ... handle error ...
    }

    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_family = AF_INET;
    addr.sin_port = htons(CONFD_PORT);

    streamsock = socket(PF_INET, SOCK_STREAM, 0);
    confd_stream_connect(streamsock, (struct sockaddr*)&addr,
                          sizeof(struct sockaddr_in), id, 0);

</div>

Once the stream socket is connected we can read the configuration data
on the socket. We need to continue reading until we receive EOF on the
socket. To check if the configuration retrieval was successful we use
the function `maapi_save_config_result()`.

The stream socket must be connected within 10 seconds after the id is
received.

<div class="note">

The `maapi_save_config()` function can not be used with an attached
transaction in a data callback (see
[confd_lib_dp(3)](confd_lib_dp.3.md)), since it requires active
participation by the transaction manager, which is blocked waiting for
the callback to return. However it is possible to use it with a
transaction started via `maapi_start_trans_in_trans()` with the attached
transaction as backend.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BAD_TYPE

    int maapi_save_config_result(
    int sock, int id);

We use this function to verify that we received the entire configuration
over the stream socket. The `sock` parameter must be the same maapi
socket we used for `maapi_save_config()` and the `id` parameter is the
`id` returned by `maapi_save_config()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_ACCESS_DENIED,
CONFD_ERR_EXTERNAL

    int maapi_load_config(
    int sock, int thandle, int flags, const char *filename);

This function loads a configuration from `filename` into ConfD. The `th`
parameter is a transaction handle. This can be either for a transaction
created by the application, in which case the application must also
apply the transaction, or for an attached transaction (which must not be
applied by the application). The format of the file can be either XML,
curly bracket Juniper CLI format, Cisco XR style format, or Cisco IOS
style format. The caller of the function has to indicate which it is by
using one of the `MAAPI_CONFIG_XML`, `MAAPI_CONFIG_J`, `MAAPI_CONFIG_C`,
`MAAPI_CONFIG_TURBO_C`, or `MAAPI_CONFIG_C_IOS` flags, with the same
meanings as for `maapi_save_config()`. If the name of the file ends in
.gz (or .Z) then the file is assumed to be gzipped, and will be
uncompressed as it is loaded.

<div class="note">

If you use a relative pathname for `filename`, it is taken as relative
to the working directory of the ConfD daemon, i.e. the directory where
the daemon was started.

</div>

By default the complete configuration (as allowed by the user of the
current transaction) is deleted before the file is loaded. To merge the
contents of the file use the `MAAPI_CONFIG_MERGE` flag. To replace only
the part of the configuration that is present in the file, use the
`MAAPI_CONFIG_REPLACE` flag.

If the transaction `th` is started against the data store
`CONFD_OPERATIONAL` config false data is loaded. The existing config
false data is not deleted before the file is loaded. Rather it is the
responsibility of the client.

The only supported format for loading 'config false' data is
`MAAPI_CONFIG_XML`.

Additional flags for `MAAPI_CONFIG_XML`:

`MAAPI_CONFIG_WITH_OPER`  
> Any operational data in the file should be ignored (instead of
> producing an error).

`MAAPI_CONFIG_XML_LOAD_LAX`  
> Lax loading. Ignore unknown namespaces, elements, and attributes.

`MAAPI_CONFIG_OPER_ONLY`  
> Load *only* operational data, and ancestors to operational data nodes.

Additional flag for `MAAPI_CONFIG_C` and `MAAPI_CONFIG_C_IOS`:

`MAAPI_CONFIG_AUTOCOMMIT`  
> A commit should be performed after each line. In this case the
> transaction identified by `th` is not used for the loading.

`MAAPI_CONFIG_NO_BACKQUOTE`  
> No special treatment is given go back quotes, ie \\ when parsing the
> commands. This means that certain string values cannot be entered, eg
> \n, \t, but also that no quoting is needed for backslash.

Additional flags for all CLI formats, i.e. `MAAPI_CONFIG_J`,
`MAAPI_CONFIG_C`, and `MAAPI_CONFIG_C_IOS`:

`MAAPI_CONFIG_CONTINUE_ON_ERROR`  
> Do not abort the load when an error is encountered.

`MAAPI_CONFIG_SUPPRESS_ERRORS`  
> Do not display the long error message but instead a oneline error with
> the line number.

The other `flags` parameters are the same as for `maapi_save_config()`,
however the flags `MAAPI_CONFIG_WITH_SERVICE_META`,
`MAAPI_CONFIG_NO_PARENTS`, and `MAAPI_CONFIG_CDB_ONLY` are ignored.

<div class="note">

The `maapi_load_config()` function can not be used with an attached
transaction in a data callback (see
[confd_lib_dp(3)](confd_lib_dp.3.md)), since it requires active
participation by the transaction manager, which is blocked waiting for
the callback to return. However it is possible to use it with a
transaction started via `maapi_start_trans_in_trans()` with the attached
transaction as backend, writing the changes to the attached transaction
by invoking `maapi_apply_trans()` for the "trans-in-trans".

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADTYPE,
CONFD_ERR_BADPATH, CONFD_ERR_BAD_CONFIG, CONFD_ERR_ACCESS_DENIED,
CONFD_ERR_PROTOUSAGE, CONFD_ERR_EXTERNAL, CONFD_ERR_NOEXISTS

    int maapi_load_config_cmds(
    int sock, int thandle, int flags, const char *cmds, const char *fmt, ...);

This function loads a configuration like `maapi_load_config()`, but
reads the configuration from the string `cmds` instead of from a file.
The `th` and `flags` parameters are the same as for
`maapi_load_config()`.

An optional `chroot` path can be given.

<div class="note">

The same restriction as for `maapi_load_config()` regarding an attached
transaction in a data callback applies also to
`maapi_load_config_cmds()`

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADTYPE,
CONFD_ERR_BADPATH, CONFD_ERR_BAD_CONFIG, CONFD_ERR_ACCESS_DENIED,
CONFD_ERR_PROTOUSAGE, CONFD_ERR_EXTERNAL, CONFD_ERR_NOEXISTS

    int maapi_load_config_stream(
    int sock, int thandle, int flags);

This function loads a configuration like `maapi_load_config()`, but
reads the configuration from a ConfD stream socket instead of from a
file. The `th` and `flags` parameters are the same as for
`maapi_load_config()`.

The function returns `CONFD_ERR` on error or a positive integer id that
can subsequently be used together with `confd_stream_connect()`. ConfD
will read all data from the stream socket until it receives EOF. Thus
the following code snippet indicates the usage pattern of this function.

<div class="informalexample">

    int id;
    int streamsock;
    struct sockaddr_in addr;

    id = maapi_load_config_stream(sock, th, flags);
    if (id < 0) {
        ... handle error ...
    }

    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_family = AF_INET;
    addr.sin_port = htons(CONFD_PORT);

    streamsock = socket(PF_INET, SOCK_STREAM, 0);
    confd_stream_connect(streamsock, (struct sockaddr*)&addr,
                          sizeof(struct sockaddr_in), id, 0);

</div>

Once the stream socket is connected we can write the configuration data
on the socket. When we have written the complete configuration, we must
close the socket, to make ConfD receive EOF. To check if the
configuration load was successful we use the function
`maapi_load_config_stream_result()`.

The stream socket must be connected within 10 seconds after the id is
received.

<div class="note">

The same restriction as for `maapi_load_config()` regarding an attached
transaction in a data callback applies also to
`maapi_load_config_stream()`

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADTYPE,
CONFD_ERR_PROTOUSAGE, CONFD_ERR_EXTERNAL

    int maapi_load_config_stream_result(
    int sock, int id);

We use this function to verify that the configuration we wrote on the
stream socket was successfully loaded. The `sock` parameter must be the
same maapi socket we used for `maapi_load_config_stream()` and the `id`
parameter is the `id` returned by `maapi_load_config_stream()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADTYPE,
CONFD_ERR_BADPATH, CONFD_ERR_BAD_CONFIG, CONFD_ERR_ACCESS_DENIED,
CONFD_ERR_EXTERNAL

    int maapi_roll_config(
    int sock, int thandle, const char *fmtpath, ...);

This function can be used to save the equivalent of a rollback file for
a given configuration before it is committed (or a subtree thereof) in
curly bracket format.

The provided path indicates where we want the configuration to be
rooted. It must be a prefix prepended keypath. If `fmtpath` is NULL, a
rollback config for the entire configuration is dumped. If for example
`fmtpath` is "/aaa:aaa/authentication/users" we create a rollback config
for a part of the AAA data. It is not possible to extract non-config
data using this function.

The function returns `CONFD_ERR` on error or a positive integer id that
can subsequently be used together with `confd_stream_connect()`. Thus
this function doesn't save the rollback configuration to a file, but
rather it returns an integer that is used together with a ConfD stream
socket. ConfD will write all data in a stream on that socket and when
done, ConfD will close its end of the socket. Thus the following code
snippet indicates the usage pattern of this function.

<div class="informalexample">

    int id;
    int streamsock;
    struct sockaddr_in addr;

    id = maapi_roll_config(sock, tid, path);
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_family = AF_INET;
    addr.sin_port = htons(CONFD_PORT);

    streamsock = socket(PF_INET, SOCK_STREAM, 0);
    confd_stream_connect(streamsock, (struct sockaddr*)&addr,
                          sizeof (struct sockaddr_in), id,0);

</div>

Once the stream socket is connected we can read the configuration data
on the socket. We need to continue reading until we receive EOF on the
socket. To check if the configuration retrieval was successful we use
the function `maapi_roll_config_result()`.

The stream socket must be connected within 10 seconds after the id is
received.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BAD_TYPE

    int maapi_roll_config_result(
    int sock, int id);

We use this function to assert that we received the entire rollback
configuration over a stream socket. The `sock` parameter must be the
same maapi socket we used for `maapi_roll_config()` and the `id`
parameter is the `id` returned by `maapi_roll_config()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_ACCESS_DENIED,
CONFD_ERR_EXTERNAL

    int maapi_get_stream_progress(
    int sock, int id);

In some cases (e.g. an action or custom command that can be interrupted
by the user) it may be useful to be able to terminate ConfD's reading of
data from a stream socket (by closing the socket) without waiting for a
potentially large amount of data written to the socket to be consumed by
ConfD. This function allows us to limit the amount of data "in flight"
between the application and ConfD, by reporting the amount of data read
by ConfD so far.

The `sock` parameter must be the maapi socket used for a function call
that required a stream socket for writing to ConfD (currently the only
such function is `maapi_load_config_stream()`), and the `id` parameter
is the `id` returned by that function. `maapi_get_stream_progress()`
returns the number of bytes that ConfD has read from the stream socket.
If `id` does not identify a stream socket that is currently being read
by ConfD, the function returns CONFD_ERR with `confd_errno` set to
CONFD_ERR_NOEXISTS. This can be due to e.g. that the socket has been
closed, or that an error has occurred - but also that ConfD has
determined that all the data has been read (e.g. the end of an XML
document has been read). To avoid the latter case, the function should
only be called when we have more data to write, and before the writing
of that data. The following code shows a possible way to use this
function.

<div class="informalexample">

    #define MAX_IN_FLIGHT 4096

    char buf[BUFSIZ];
    int sock, streamsock, id;
    int n, n_written = 0, n_read = 0;
    int result;
    ...

    while (!do_abort() && (n = get_data(buf, sizeof(buf))) > 0) {
        while (n_written - n_read > MAX_IN_FLIGHT) {
            if ((n_read = maapi_get_stream_progress(sock, id)) < 0) {
                ... handle error ...
            }
        }
        if (write(streamsock, buf, n) != n) {
            ... handle error ...
        }
        n_written += n;
    }
    close(streamsock);
    result = maapi_load_config_stream_result(sock, id);

</div>

<div class="note">

A call to `maapi_get_stream_progress()` does not return until the number
of bytes read has increased from the previous call (or if there is an
error). This means that the above code does not imply busy-looping, but
also that if the code was to call `maapi_get_stream_progress()` when
`n_read` == `n_written`, the result would be a deadlock.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int maapi_xpath_eval(
    int sock, int thandle, const char *expr, int (*result
          kp, confd_value_t *v, 
    void *state, void (*trace, void *initstate, const char *fmtpath, ...);

This function evaluates the XPath Path expression as supplied in `expr`.
For each node in the resulting node set the function `result` is called
with the keypath to the resulting node as the first argument, and, if
the node is a leaf and has a value, the value of that node as the second
argument. The expression will be evaluated using the root node as the
context node, unless a path to an existing node is given as the last
argument. For each invocation the `result()` function should return
`ITER_CONTINUE` to tell the XPath evaluator to continue with the next
resulting node. To stop the evaluation the `result()` can return
`ITER_STOP` instead.

The `trace` is a pointer to a function that takes a single string as
argument. If supplied it will be invoked when the xpath implementation
has trace output for the current expression. (For an easy start, for
example the `puts(3)` will print the trace output to stdout). If no
trace is wanted `NULL` can be given.

The `initstate` parameter can be used for any user supplied opaque data
(i.e. whatever is supplied as `initstate` is passed as `state` to the
`result()` function for each invocation).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_XPATH

    int maapi_xpath_eval_expr(
    int sock, int thandle, const char *expr, char **res, void (*trace, const char *fmtpath, 
    ...);

Evaluate the XPath expression given in `expr` and return the result as a
string, pointed to by `res`. If the call succeeds, `res` will point to a
malloc:ed string that the caller needs to free. If the call fails `res`
will be set to `NULL`.

It is possible to supply a path which will be treated as the initial
context node when evaluating `expr` (i.e. if the path is relative, this
is treated as the starting point, and this is also the node that
`current()` will return when used in the XPath expression). If NULL is
given, the current maapi position is used.

The `trace` is a pointer to a function that takes a single string as
argument. If supplied it will be invoked when the xpath implementation
has trace output for the current expression. (For an easy start, for
example the `puts(3)` will print the trace output to stdout). If no
trace is wanted `NULL` can be given.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_XPATH

    int maapi_query_start(
    int sock, int thandle, const char *expr, const char *context_node, int chunk_size, 
    int initial_offset, enum confd_query_result_type result_as, int nselect, 
    const char *select[], int nsort, const char *sort[]);

Start a new query attached to the transaction given in `th`. If
successful a query handle is returned (the query handle is then used in
subsequent calls to `maapi_query_result()` etc). Brief summary of all
parameters:

`sock`  
> A previously opened maapi socket.

`th`  
> A transaction handle to a previously started transaction.

`expr`  
> The primary XPath expression.

`context_node`  
> The context node (an ikeypath) for the primary expression. `NULL` is
> legal, and means that the context node will be `/`.

`chunk_size`  
> How many results to return at a time. If set to 0 a default number
> will be used.

`initial_offset`  
> Which result in line to begin with (1 means to start from the
> begining).

`result_as`  
> The format the results will be returned in.

`nselect`  
> The number of expressions in the `select` parameter.

`select`  
> An array of XPath "select" expressions, of length `nselect`.

`nsort`  
> The number of expressions in the `sort` parameter.

`sort`  
> An array of XPath expressions which will be used for sorting, of
> length `nselect`.

A query is a way of evaluating an XPath expression and returning the
results in chunks. The usage pattern is as follows: a primary expression
in provided in the `expr` argument, which must evaluate to a node-set,
the "results". For each node in the results node-set every "select"
expression is evaluated with the result node as its context node. For
example, given the YANG snippet:

<div class="informalexample">

      list interface {
        key name;
        unique number;
        leaf name {
          type string;
        }
        leaf number {
          type uint32;
          mandatory true;
        }
        leaf enabled {
          type boolean;
          default true;
        }
      ...
      }

</div>

and given that we want to find the name and number of all enabled
interfaces - the `expr` could be `"/interface[enabled='true']"`, and the
select expressions would be `{ "name", "number" }`. Note that the select
expressions can have any valid XPath expression, so if you wanted to
find out an interfaces name, and whether its number is even or not, the
expressions would be: `{ "name", "(number mod 2) == 0" }`.

The results are then fetched using the `maapi_query_result()` function,
which returns the results on the format specified by the `result_as`
parameter. There are four different types of result, as defined by the
type `enum confd_query_result_type`:

<div class="informalexample">

``` c
enum confd_query_result_type {
    CONFD_QUERY_STRING = 0,
    CONFD_QUERY_HKEYPATH = 1,
    CONFD_QUERY_HKEYPATH_VALUE = 2,
    CONFD_QUERY_TAG_VALUE = 3
};
```

</div>

I.e. the results can be returned as strings, hkeypaths, hkeypaths and
values, or tags and values. The string is just the resulting string of
evaluating the select XPath expression. For hkeypaths, tags, and values
it is the path/tag/value of the *node that the select XPath expression
evaluates to*. This means that care must be taken so that the
combination of select expression and return types actually yield
sensible results (for example "1 + 2" is a valid select XPath
expression, and would result in the string "3" when setting the result
type to `CONFD_QUERY_STRING` - but it is not a node, and thus have no
hkeypath, tag, or value). A complete example:

<div class="informalexample">

      qh = maapi_query_start(s, th, "/interface[enabled='true']", NULL,
                             1000, 1, CONFD_QUERY_TAG_VALUE,
                             2, (char *[]){ "name", "number" }, 0, NULL);
      n = 0;
      do {
        maapi_query_result(s, qh, &qr);
        n = qr->nresults;
        for (i=0; i<n; i++) {
          printf("result %d:\n", i + qr->offset);
          for (j=0; j<qr->nelements; j++) {
            // We know the type is tag-value
            char *tag = confd_hash2str(qr->results[i].tv[j].tag.tag);
            confd_pp_value(tmpbuf, BUFSIZ, &qr->results[i].tv[j].v);
            printf("  %s: %s\n", tag, tmpbuf);
          }
        }
        maapi_query_free_result(qr);
      } while (n > 0);
      maapi_query_stop(s, qh);
         

</div>

It is possible to sort the results using the built-in XPath function
`sort-by()` (see the
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md) man page)

It is also possible to sort the result using any expressions passed in
the `sort` array. These array will be used to construct a temporary
index which will live as long as the query is active. For example to
start a query sorting first on the enabled leaf, and then on number one
would call:

<div class="informalexample">

    qh = maapi_query_start(s, th, "/interface[enabled='true']", NULL,
                           1000, 1, CONFD_QUERY_TAG_VALUE,
                           3, (char *[]){ "name", "number", "enabled" },
                           2, (char *[]){ "enabled", "number" });
    ...
         

</div>

Note that the index the query constructs is kept in memory, which will
be released when the query is stopped.

    int maapi_query_result(
    int sock, int qh, struct confd_query_result **qrs);

Fetch the next available chunk of results associated with query handle
`qh`. The results are returned in a `struct confd_query_result`, which
is allocated by the library. The structure is defined as:

<div class="informalexample">

``` c
struct confd_query_result {
    enum confd_query_result_type type;
    int offset;
    int nresults;
    int nelements;
    union {
        char **str;
        confd_hkeypath_t *hkp;
        struct {
            confd_hkeypath_t hkp;
            confd_value_t    val;
        } *kv;
        confd_tag_value_t *tv;
    } *results;
    void *__internal;           /* confd_lib internal housekeeping */
};
```

</div>

The `type` will always be the same as was requested in the call to
`maapi_query_start()`, it is there to indicate which of the pointers in
the union to use. The `offset` is the number of the first result in this
chunk (i.e. for the first chunk it will be 1). How many results that are
in this chunk is indicated in `nresults`, when there are no more
available results it will be set to 0. Each result consists of
`nelements` elements (this number is the same as the number of select
parameters given in the call to `maapi_query_start()`.

All data pointed to in the result struct (as well as the struct itself)
is allocated by the library - and when finished processing the result
the user must call `maapi_query_free_result()` to free this data.

    int maapi_query_free_result(
    struct confd_query_result *qrs);

The `struct confd_query_result` returned by `maapi_query_result()` is
dynamically allocated (and it also contains pointers to other
dynamically allocated data) and so it needs to be freed when the result
has been processed. Use this function to free the
`struct confd_query_result` (and its accompanying data) returned by
`maapi_query_result()`.

    int maapi_query_reset(
    int sock, int qh);

Reset / rewind a running query so that it starts from the beginning
again. Next call to `maapi_query_result()` will then return the first
chunk of results. The function can be called at any time (i.e. both
after all results have been returned to essentially run the same query
again, as well as after fetching just one or a couple of results).

    int maapi_query_reset_to(
    int sock, int qh, int offset);

Like `maapi_query_reset()`, except after the query has been reset it is
restarted with the initial offset set to `offset`. Next call to
`maapi_query_result()` will then return the first chunk of results at
that offset. The function can be called at any time (i.e. both after all
results have been returned to essentially run the same query again, as
well as after fetching just one or a couple of results).

    int maapi_query_stop(
    int sock, int qh);

Stops the running query identified by `qh`, and makes ConfD free up any
internal resources associated with the query. If a query isn't
explicitly closed using this call it will be cleaned up when the
transaction the query is linked to ends.

    int maapi_install_crypto_keys(
    int sock);

It is possible to define AES keys inside confd.conf. These keys are used
by ConfD to encrypt data which is entered into the system. The supported
types are `tailf:aes-cfb-128-encrypted-string` and
`tailf:aes-256-cfb-128-encrypted-string`. See
[confd_types(3)](confd_types.3.md).

This function will copy those keys from ConfD (which reads confd.conf)
into memory in the library. To decrypt data of these types, use the
function `confd_decrypt()`, see
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int maapi_do_display(
    int sock, int thandle, const char *fmtpath, ...);

If the data model uses the YANG `when` or `tailf:display-when`
statement, this function can be used to determine if the item given by
`fmtpath, ...` should be displayed or not.

    int maapi_init_upgrade(
    int sock, int timeoutsecs, int flags);

This is the first of three functions that must be called in sequence to
perform an in-service data model upgrade, i.e. replace fxs files etc
without restarting the ConfD daemon.

This function initializes the upgrade procedure. The `timeoutsecs`
parameter specifies a maximum time to wait for users to voluntarily exit
from "configure mode" sessions in CLI and Web UI. If transactions are
still active when the timeout expires, the function will by default fail
with CONFD_ERR_TIMEOUT. If the flag MAAPI_UPGRADE_KILL_ON_TIMEOUT was
given via the `flags` parameter, such transactions will instead be
forcibly terminated, allowing the initialization to complete
successfully.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_LOCKED,
CONFD_ERR_BADSTATE, CONFD_ERR_HA_WITH_UPGRADE, CONFD_ERR_TIMEOUT,
CONFD_ERR_ABORTED

    int maapi_perform_upgrade(
    int sock, const char **loadpathdirs, int n);

When `maapi_init_upgrade()` has completed successfully, this function
must be called to instruct ConfD to load the new data model files. The
`loadpathdirs` parameter is an array of `n` strings that specify the
directories to load from, corresponding to the /confdConfig/loadPath/dir
elements in `confd.conf` (see [confd.conf(5)](ncs.conf.5.md)).

These directories will also be searched for CDB "init files" (see the
CDB chapter in the Development Guide). I.e. if the upgrade needs such
files, we can place them in one of the new load path directories - or we
can include directories that are used *only* for CDB "init files" in the
`loadpathdirs` array, corresponding to the /confdConfig/cdb/initPath/dir
elements that can be specified in `confd.conf`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADSTATE,
CONFD_ERR_BAD_CONFIG

    int maapi_commit_upgrade(
    int sock);

When also `maapi_perform_upgrade()` has completed successfully, this
function must be called to make the upgrade permanent. This includes
committing the CDB upgrade transaction when CDB is used, and we can thus
get all the different validation errors that can otherwise result from
`maapi_apply_trans()`.

When `maapi_commit_upgrade()` has completed successfully, the program
driving the upgrade must also make sure that the
/confdConfig/loadPath/dir elements in `confd.conf` reference the new
directories. If CDB "init files" are used in the upgrade as described
for `maapi_commit_upgrade()` above, the program should also make sure
that the /confdConfig/cdb/initPath/dir elements reference the
directories where those files are located.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADSTATE,
CONFD_ERR_NOTSET, CONFD_ERR_NON_UNIQUE, CONFD_ERR_BAD_KEYREF,
CONFD_ERR_TOO_FEW_ELEMS, CONFD_ERR_TOO_MANY_ELEMS,
CONFD_ERR_UNSET_CHOICE, CONFD_ERR_MUST_FAILED,
CONFD_ERR_MISSING_INSTANCE, CONFD_ERR_INVALID_INSTANCE,
CONFD_ERR_STALE_INSTANCE, CONFD_ERR_BADTYPE, CONFD_ERR_EXTERNAL

    int maapi_abort_upgrade(
    int sock);

Calling this function at any point before the call of
`maapi_commit_upgrade()` will abort the upgrade.

<div class="note">

`maapi_abort_upgrade()` should *not* be called if any of the three
previous functions fail - in that case, ConfD will do an internal abort
of the upgrade.

</div>

## Confd Daemon Control

    int maapi_aaa_reload(
    int sock, int synchronous);

When the ConfD AAA tree is populated by an external data provider (see
the AAA chapter in the Admin Guide), this function can be used by the
data provider to notify ConfD when there is a change to the AAA data.
I.e. it is an alternative to executing the command
`confd --clear-aaa-cache`.

If the `synchronous` parameter is 0, the function will only initiate the
loading of the AAA data, just like `confd --clear-aaa-cache` does, and
return CONFD_OK as long as the communication with ConfD succeeded.
Otherwise it will wait for the loading to complete, and return CONFD_OK
only if the loading was successful.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_EXTERNAL

    int maapi_aaa_reload_path(
    int sock, int synchronous, const char *fmt, ...);

A variant of `maapi_aaa_reload()` that causes only the AAA subtree given
by the path in `fmt` to be loaded. This may be useful to load changes to
the AAA data when loading the complete AAA tree from an external data
provider takes a long time. Obviously care must be taken to make sure
that all changes actually get loaded, and a complete load using e.g.
`maapi_aaa_reload()` should be done at least when ConfD is started. The
path may specify a container or list entry, but not a specific leaf.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_EXTERNAL

    int maapi_snmpa_reload(
    int sock, int synchronous);

When the ConfD SNMP Agent config is implemented by an external data
provider, this function must be used by the data provider to notify
ConfD when there is a change to the data.

If the `synchronous` parameter is 0, the function will only initiate the
loading of the data, and return CONFD_OK as long as the communication
with ConfD succeeded. Otherwise it will wait for the loading to
complete, and return CONFD_OK only if the loading was successful.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_EXTERNAL

    int maapi_start_phase(
    int sock, int phase, int synchronous);

Once the ConfD daemon has been started in phase0 it is possible to use
this function to tell the daemon to proceed to startphase 1 or 2 (as
indicated in the `phase` parameter). If `synchronous` is non-zero the
call does not return until the daemon has completed the transition to
the requested start phase.

Note that start-phase1 can fail, (see documentation of `--start-phase1`
in [confd(1)](ncs.1.md)) in particular if CDB fails. In that case
`maapi_start_phase()` will return CONFD_ERR, with confderrno set to
CONFD_ERR_START_FAILED. However if ConfD stops before it has a chance to
send back the error CONFD_EOF might be returned.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_START_FAILED

    int maapi_wait_start(
    int sock, int phase);

To synchronize startup with ConfD this function can be used to wait for
ConfD to reach a particular start phase (0, 1, or 2). Note that to
implement an equivalent of [`confd --wait-started`](ncs.1.md) or
[`confd --wait-phase0`](ncs.1.md) case must also be taken to retry
`maapi_connect()`, which will fail until ConfD has started enough to
accept connections to its IPC port.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_PROTOUSAGE

    int maapi_stop(
    int sock, int synchronous);

Request the ConfD daemon to stop, if `synchronous` is non-zero the call
will wait until ConfD has come to a complete halt. Note that since the
daemon exits, the socket won't be re-usable after this call. Equivalent
to [ `confd --stop`](ncs.1.md).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_reload_config(
    int sock);

Request that the ConfD daemon reloads its configuration files. The
daemon will also close and re-open its log files. Equivalent to
[`confd --reload`](ncs.1.md).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_reopen_logs(
    int sock);

Request that the ConfD daemon closes and re-opens its log files, useful
for logrotate(8).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int maapi_rebind_listener(
    int sock, int listener);

Request that the subsystem(s) specified by `listener` rebinds its
listener socket(s). Currently open sockets (if any) will be closed, and
new sockets created and bound via `bind(2)` and `listen(2)`. This is
useful e.g. if /confdConfig/ignoreBindErrors/enabled is set to "true" in
`confd.conf`, and some bindings have failed due to a problem that
subsequently has been fixed. Calling this function then avoids the
disable/enable config change that would otherwise be required to cause a
rebind.

The following values can be used for the `listener` parameter, ORed
together if more than one:

<div class="informalexample">

    #define CONFD_LISTENER_IPC             (1 << 0)
    #define CONFD_LISTENER_NETCONF         (1 << 1)
    #define CONFD_LISTENER_SNMP            (1 << 2)
    #define CONFD_LISTENER_CLI             (1 << 3)
    #define CONFD_LISTENER_WEBUI           (1 << 4)
    #define NCS_LISTENER_NETCONF_CALL_HOME (1 << 5)

</div>

<div class="note">

It is not possible to rebind sockets for northbound listeners during the
transition from start phase 1 to start phase 2. If this is attempted,
the call will fail (and do nothing) with `confd_errno` set to
CONFD_ERR_BADSTATE.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADSTATE

    int maapi_clear_opcache(
    int sock, const char *fmt, ...);

Request clearing of the operational data cache. A path can be given via
the `fmt` and subsequent parameters, to clear only the cached data for
the subtree designated by that path. To clear the whole cache, pass NULL
or "/" for `fmt`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH

    int maapi_netconf_ssh_call_home(
    int sock, confd_value_t *host, int port);

Request that ConfD daemon initiates a NETCONF SSH Call Home connection
(see RFC 8071) to the NETCONF client running on `host` and listening on
`port`.

The parameter `host` is either an IP address (C_IPV4 or C_IPV6) or a
host name (C_BUF or C_STR).

    int maapi_netconf_ssh_call_home_opaque(
    int sock, confd_value_t *host, const char *opaque, int port);

Request that ConfD daemon initiates a NETCONF SSH Call Home connection
(see RFC 8071) to the NETCONF client running on `host` passing an opaque
value `opaque` the client listening on `port`.

The parameter `host` is either an IP address (C_IPV4 or C_IPV6) or a
host name (C_BUF or C_STR).

## See Also

`confd_lib(3)` - Confd lib

`confd_types(3)` - ConfD C data types

The ConfD User Guide
