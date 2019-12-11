-- 系统用户表
create table t_sys_user
(
  user_id bigint primary key,							-- 用户编号:主键 标识列
  user_name varchar(50) null,							-- 用户名: 唯一键 登陆时使用 禁止修改
  user_password varchar(50) null,					-- 密码

  user_tel varchar(11) null,							-- 手机号
  user_card varchar(18) null,							-- 用户身份证：需要认证
	user_email varchar(50) null,						-- 用户邮箱：需要正则认证
	
	user_role_id bigint null,								-- 角色ID:外键 引用sys_role(role_id)
  user_flag bigint null default 0,				-- 用户标识: 1 不可用 0 可用
	user_credit float null									-- 用户信誉分
);
-- 银行卡表
create table t_sys_bank
(
  bank_id bigint primary key,							-- 银行卡编号:主键 标识列
  card_name varchar(50) null,							-- 持卡人姓名 
  card_no varchar(19) null,								-- 银行卡号

  bank_name varchar(50) null,							-- 开户银行
  bank_tel varchar(11) null,							-- 预留手机号
	user_id bigint null											-- 用户编号
);
-- 实名认证审核表
create table t_sys_realauth
(
  real_id bigint primary key,							-- 实名认证编号:主键 标识列
  real_name varchar(50) null,							-- 认证姓名
  user_sex varchar(2) null,								-- 用户性别

  user_birthday timestamp null,						-- 用户出生年月日
  user_card varchar(18) null,							-- 用户身份证：需要认证
	user_addres varchar(50) null,						-- 用户地址：三级联动
	
	user_image varchar(50) null,						-- 用户身份证图片：上传
  user_remark varchar(50) null,						-- 用户认证情况
	authTime timestamp null,								-- 认证时间
	
	applyTime timestamp null,								-- 申请认证时间
  author_id bigint null,									-- 认证人编号
	applier_id bigint null									-- 申请认证人编号
);
-- 邮箱认证表
create table t_sys_emailverify
(
  email_id bigint primary key,						-- 邮箱认证编号:主键 标识列
  email varchar(50) null,									-- 邮箱：正则验证，需要认证
  user_id bigint null,										-- 认证人编号

  authTime timestamp null									-- 认证时间
);
-- 角色表
create table t_sys_role
(
  role_id bigint primary key,							-- 角色编号:主键 标识列
  role_name varchar(50) null,							-- 角色名
  available bigint null default 0,				-- 是否可用   0 可用  1 不可用

  description varchar(50) null						-- 角色描述
);
-- 权限表
create table t_sys_permission
(
  permission_id bigint primary key,				-- 权限编号:主键 标识列
  permission_name varchar(50) null,				-- 权限名
  level bigint null,											-- 权限级别  1~3

  parent_permission_id bigint null,				-- 父编号
  available bigint null default 0,				-- 是否可用   0 可用  1 不可用
	permission varchar(50) null							-- 权限字符串
);
-- 用户角色表
create table t_sys_user_role
(
  urid bigint primary key,								-- 用户角色编号:主键 标识列
  user_id bigint null,										-- 用户编号
  role_id bigint null											-- 角色编号
);
-- 角色权限表
create table t_sys_role_permission
(
  rrid bigint primary key,								-- 角色权限编号:主键 标识列
  role_id bigint null,										-- 角色编号
  permission_id bigint null								-- 权限编号
);
-- 数据字典表
create table t_sys_dict
(
  dict_id bigint primary key,							-- 字典ID: 主键 标识列
  dict_type varchar(50) null,							-- 字典类型
  dict_item varchar(50) null,							-- 字典条目: 一般用来生成下拉框的文本

  dict_value varchar(50) null,						-- 字典值：一般用来生成下拉框的值
  dict_is_editable bigint null default 0	-- 能否编辑: 0 可 1 不可
);
-- 分期类型表
create table t_installment_type
(
  imt_id bigint primary key,							-- 账户编号:主键 标识列
  imt_name varchar(55) null,							-- 分期数
  imt_money float null										-- 不同期数的利息
);
-- 用户账户表
create table t_account
(
  acc_id bigint primary key,							-- 账户编号:主键 标识列
  user_id bigint null,										-- 用户编号：外键
  usable_amount float null,								-- 账户可用额度

  freezed_amount float null,							-- 冻结额度
  unReceive_interest float null,					-- 待收利息
	unReceive_principal float null,					-- 待收本金
	
	unReturnAmount float null,							-- 待还金额
  remainBorrowLimit float null,						-- 剩余可借额度
	borrowLimit float null									-- 已借额度
);
-- 账户流水表
create table t_accoun_flow
(
  flo_id bigint primary key,							-- 账户流水编号: 主键 标识列
  amount bigint null,											-- 账户总金额
  note varchar(500) null,									-- 账户流水记录

  tradeTime timestamp null,								-- 交易时间
  account_id bigint null,									-- 账户编号：外键
	usableAmount float null,								-- 账户可用额度
	
	freezedAmount float null								-- 账户冻结额度
  );
	-- 借贷产品表
create table t_product
(
  pro_id bigint primary key,							-- 产品编号: 主键 标识列
  pro_name varchar(55) null,							-- 产品名称
  time_limit bigint null,									-- 产品期限

  limit_range varchar(55) null,						-- 额度范围
  description varchar(100) null						-- 产品描述
);
-- 借款表
create table t_loan
(
  loan_id bigint primary key,							-- 借款编号:主键 标识列
  actual_rate float null,									-- 借款实际利率
  available_amount float null,						-- 借款有效额度

  loanrequest_id bigint null,							-- 借款申请编号：外键
  loan_user_id bigint null,								-- 借款用户编号：外键
	loan_time timestamp null,								-- 借款时间
	
	loanrequest_title varchar(100) null,		-- 借款申请标题
  loanrequest_state bigint null,					-- 借款申请状态
	loan_bank varchar(55) null,							-- 借款银行
	
	account_name varchar(55) null,					-- 借款账户名
  account_number varchar(55) null					-- 借款账户（卡号）
);
-- 借款申请表
create table t_loanrequest
(
  req_id bigint primary key,							-- 借款申请编号:主键 标识列
  return_type bigint null,								-- 还款类型
  loanrequest_type bigint null,						-- 借款申请类型

  loanrequest_state bigint null,					-- 借款申请状态
  loanrequest_amount float null,					-- 借款申请额度
	current_rate float null,								-- 借款利率
	
	monthes2Return bigint null,							-- 借款分期数
  loan_count float null,									-- 借款金额
	title varchar(100) null,								-- 借款理由
	
	description varchar(100) null,					-- 借款描述
  disable_date timestamp null,						-- 申请失效时间
	user_id bigint null,										-- 申请用户编号
	
	disable_days bigint null,								-- 多少天后失效
  min_loan_amount float null,							-- 最低借款金额
	apple_time timestamp null,							-- 借款申请时间
	
	audit_time timestamp null,							-- 审批时间
  auditor_id bigint null									-- 审批人编号
);
-- 公司账户信息表
create table t_companybankinfo
(
  cbid bigint primary key,								-- 公司账户编号:主键 标识列
  bankname varchar(55) null,							-- 公司账户银行名
  accountname float null,									-- 公司账户名

  banknumber varchar(55) null,						-- 公司银行卡号
  bankforkname bigint null								-- 账户负责人名
);
-- 借款申请审批历史表
create table t_bidrequestaudithistory
(
  bah_id bigint primary key,							-- 借款申请审批历史编号:主键 标识列
  bah_state bigint null,									-- 借款审批状态
  bah_remark varchar(55) null,						-- 借款审批备注

  audit_time timestamp null,							-- 借款审批时间
  apply_time timestamp null,							-- 借款申请时间
	auditor_id bigint null,									-- 借款审批人编号
	
	applier_id bigint null,									-- 借款申请人编号
  loanrequest_id bigint null,							-- 借款申请编号
	audit_type bigint null									-- 审批类型
);
-- 还款记录表
create table t_returnmoney
(
  ret_id bigint primary key,							-- 还款编号
  return_state bigint null,									-- 还款状态
  return_remark varchar(100) null,						-- 还款备注

  audit_time timestamp null,							-- 还款申请时间
  apply_time timestamp null,							-- 借款申请时间
	auditor_id bigint null,									-- 审批人编号
	
	applier_id bigint null,									-- 申请人编号
  amount float null,											-- 还款金额
	fee float null,													-- 手续费
	
	bank_name varchar(50) null,							-- 还款银行名称
  account_name varchar(50) null,					-- 账户名
	account_number varchar(19) null					-- 卡号
);