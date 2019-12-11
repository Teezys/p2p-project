/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.36 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `t_sys_tree_node` (
	`tree_node_id` int (11),
	`tree_node_name` varchar (450),
	`tree_node_type` int (11),
	`position` bigint (20),
	`parent_node_id` int (11),
	`url` varchar (9216),
	`icon` varchar (495)
); 
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('1','基础数据','1','1',NULL,NULL,'icon iconfont icon-shuju');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('2','认证管理','1','2',NULL,NULL,'icon iconfont icon-kehu');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('3','审批管理','1','3',NULL,NULL,'icon iconfont icon-yingxiao');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('4','放款管理','1','4',NULL,NULL,'icon iconfont icon-fuwu');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('5','贷后管理','1','5',NULL,NULL,'icon iconfont icon-quanxian');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('6','合同管理','1','6',NULL,NULL,'icon iconfont icon-baobiaobiaoweiguanli');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('7','数据字典','2','7','1','/AppMain/Dictionary','icon iconfont icon-shuju1');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('8','实名认证','2','8','2','/AppMain/Autonym','icon iconfont icon-kehu1');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('9','邮箱认证','2','9','2','/AppMain/Email','icon iconfont icon-kehu2');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('10','银行卡认证','2','10','2','/AppMain/Bank','icon iconfont icon-yingxiao1');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('11','审批任务','2','11','3','/AppMain/Accraditation','icon iconfont icon-yingxiaohuodong');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('12','放款复核','2','12','4','/AppMain/Loan','icon iconfont icon-fuwu1');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('13','正常扣款','2','13','5','/AppMain/Withhold','icon iconfont icon-baobiao');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('14','逾期管理','2','14','5','/AppMain/Overdue','icon iconfont icon-baobiao1');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('15','用户管理','2','15','5','/AppMain/User','icon iconfont icon-yonghu');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('16','产品管理','2','16','1','/AppMain/Product','icon iconfont icon-shuju2');
insert into `t_sys_tree_node` (`tree_node_id`, `tree_node_name`, `tree_node_type`, `position`, `parent_node_id`, `url`, `icon`) values('17','合同管理','2','17','6','/AppMain/Contract','icon iconfont icon-04');
