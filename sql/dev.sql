/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36)
 Source Host           : 127.0.0.1:3306
 Source Schema         : wenjie

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36)
 File Encoding         : 65001

 Date: 26/03/2023 23:21:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_table
-- ----------------------------
DROP TABLE IF EXISTS `base_table`;
CREATE TABLE `base_table`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(4) NOT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1 停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `extend_s1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串1',
  `extend_s2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串2',
  `extend_s3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串3',
  `extend_s4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串4',
  `extend_i1` int(11) NULL DEFAULT NULL COMMENT '备用整型1',
  `extend_i2` int(11) NULL DEFAULT NULL COMMENT '备用整型2',
  `extend_i3` int(11) NULL DEFAULT NULL COMMENT '备用整型3',
  `extend_i4` int(11) NULL DEFAULT NULL COMMENT '备用整型4',
  `extend_d1` datetime NULL DEFAULT NULL COMMENT '备用日期1',
  `extend_d2` datetime NULL DEFAULT NULL COMMENT '备用日期2',
  `extend_d3` datetime NULL DEFAULT NULL COMMENT '备用日期3',
  `extend_d4` datetime NULL DEFAULT NULL COMMENT '备用日期3',
  `extend_f1` double(11, 2) NULL DEFAULT NULL COMMENT '备用浮点1',
  `extend_f2` double(11, 2) NULL DEFAULT NULL COMMENT '备用浮点2',
  `extend_f3` double(11, 2) NULL DEFAULT NULL COMMENT '备用浮点3',
  `extend_f4` double(11, 2) NULL DEFAULT NULL COMMENT '备用浮点4',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_table
-- ----------------------------

-- ----------------------------
-- Table structure for base_tree_table
-- ----------------------------
DROP TABLE IF EXISTS `base_tree_table`;
CREATE TABLE `base_tree_table`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父id',
  `parent_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id集合',
  `tree_sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `tree_sorts` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序集合',
  `tree_level` int(11) NULL DEFAULT NULL COMMENT '层级',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否子节点（0是 1否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '树基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_tree_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_config_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_config_template`;
CREATE TABLE `gen_config_template`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `function_author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `function_author_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `workspace_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作空间路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块包路径',
  `web_workspace_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端工作空间路径',
  `template_default` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否默认',
  `sort` int(4) NOT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1 停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_config_template
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `workspace_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作空间',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包路径',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `function_author_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `web_workspace_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端工作空间路径',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `options` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `is_unique` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否唯一性',
  `is_log` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否记录日志',
  `is_column_sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否排序',
  `is_new_row` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新行',
  `col_span` int(10) NULL DEFAULT 2 COMMENT '列数',
  `align_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对齐方式',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `col_check` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段校验',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for hospital_doctor
-- ----------------------------
DROP TABLE IF EXISTS `hospital_doctor`;
CREATE TABLE `hospital_doctor`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '医生编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医生姓名',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '性别：1，男；2，女',
  `job_title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医生职称',
  `specialty` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医生专长',
  `special_id` bigint(20) NOT NULL COMMENT '所属专科',
  `outpatient_id` bigint(20) NOT NULL COMMENT '所属门诊',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hospital_doctor_hospital_outpatient_id_fk`(`outpatient_id`) USING BTREE,
  INDEX `hospital_doctor_hospital_special_id_fk`(`special_id`) USING BTREE,
  CONSTRAINT `hospital_doctor_hospital_outpatient_id_fk` FOREIGN KEY (`outpatient_id`) REFERENCES `hospital_outpatient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hospital_doctor_hospital_special_id_fk` FOREIGN KEY (`special_id`) REFERENCES `hospital_special` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医生信息表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hospital_doctor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attach
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach`;
CREATE TABLE `sys_attach`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attach_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `file_business_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据对应ID',
  `file_business_table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务表',
  `file_body` longblob NULL COMMENT '附件内容',
  `attach_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件类型',
  `attach_size` decimal(20, 0) NULL DEFAULT NULL COMMENT '附件大小',
  `file_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传附件路径',
  `file_business_table_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件所关联字段名称',
  `attach_category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件类别',
  `save_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存方式',
  `element_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面区块ID',
  `sort` int(4) NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1 停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `extend_s1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串1',
  `extend_s2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串2',
  `extend_s3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串3',
  `extend_s4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字符串4',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx1`(`file_business_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_attach
-- ----------------------------

-- ----------------------------
-- Table structure for sys_common_use_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_use_menu`;
CREATE TABLE `sys_common_use_menu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路劲',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `menu_obj` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应菜单JSON',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1删除 2停用）',
  `sort` int(4) NOT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx1`(`user_id`, `del_flag`, `path`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '常用菜单配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_common_use_menu
-- ----------------------------
INSERT INTO `sys_common_use_menu` VALUES ('18dcfb72c207429d886abbda75f25b88', '1', '/monitor/druid', 'dashboard', '数据监控', '{\"path\":\"/monitor/druid\",\"iconStr\":\"dashboard\",\"title\":\"数据监控\",\"remark\":\"数据监控菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 210, '1', '100', '2021-07-06 16:43:41', '1', '2021-07-06 16:43:41', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('391b5ea23f144970b5d786eac7f46aca', '1', '/sysSetting/config', 'code', '参数设置', '{\"path\":\"/sysSetting/config\",\"iconStr\":\"code\",\"title\":\"参数设置\",\"remark\":\"参数设置菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 280, '1', '100', '2021-07-06 16:54:20', '1', '2021-07-06 16:54:20', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('4f8ef1709b2a4f52ade1d798a5e934f6', '1', '/monitor/online', 'dot-chart', '在线用户', '{\"path\":\"/monitor/online\",\"iconStr\":\"dot-chart\",\"title\":\"在线用户\",\"remark\":\"在线用户菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 190, '1', '100', '2021-07-06 16:43:40', '1', '2021-07-06 16:43:40', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('704c8f7a018149498e5a742182708aec', '1', '/auth/role', 'contacts', '角色管理', '{\"path\":\"/auth/role\",\"iconStr\":\"contacts\",\"title\":\"角色管理\",\"remark\":\"维护平台各角色数据以及权限分配\",\"id\":\"\",\"isCommonUse\":false}', '0', 250, '1', '100', '2021-07-06 16:52:22', '1', '2021-07-06 16:52:22', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('76e270b147504620979af3483c1fd7bd', '1', '/auth/sysAuth', 'api', '集中授权', '{\"path\":\"/auth/sysAuth\",\"iconStr\":\"api\",\"title\":\"集中授权\",\"remark\":null,\"id\":\"\",\"isCommonUse\":false}', '0', 260, '1', '100', '2021-07-06 16:54:18', '1', '2021-07-06 16:54:18', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('998f5c24b4e643cca698cd0726163fe8', '1', '/org/post', 'idcard', '岗位管理', '{\"path\":\"/org/post\",\"iconStr\":\"idcard\",\"title\":\"岗位管理\",\"remark\":\"岗位管理菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 240, '1', '100', '2021-07-06 16:52:22', '1', '2021-07-06 16:52:22', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('b367cde7ce2d4954822b314990906360', '1', '/sysApp/iconSelect', 'shopping', '图标选择', '{\"path\":\"/sysApp/iconSelect\",\"iconStr\":\"shopping\",\"title\":\"图标选择\",\"remark\":\"\",\"id\":\"\",\"isCommonUse\":false}', '0', 300, '1', '100', '2021-07-06 16:54:22', '1', '2021-07-06 16:54:22', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('b463caf0037d424893d80d2616ed071d', '1', '/monitor/job', 'bar-chart', '定时任务', '{\"path\":\"/monitor/job\",\"iconStr\":\"bar-chart\",\"title\":\"定时任务\",\"remark\":\"定时任务菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 200, '1', '100', '2021-07-06 16:43:40', '1', '2021-07-06 16:43:40', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('d609d6c03a5544bc85aa84c1a524b7c5', '1', '/sysApp/notice', 'notification', '通知公告', '{\"path\":\"/sysApp/notice\",\"iconStr\":\"notification\",\"title\":\"通知公告\",\"remark\":\"通知公告菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 290, '1', '100', '2021-07-06 16:54:21', '1', '2021-07-06 16:54:21', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('da60c299e4da42f7b229329016d7eda2', '1', '/monitor/cache', 'box-plot', '缓存监控', '{\"path\":\"/monitor/cache\",\"iconStr\":\"box-plot\",\"title\":\"缓存监控\",\"remark\":\"缓存监控菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 230, '1', '100', '2021-07-06 16:43:44', '1', '2021-07-06 16:43:44', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('f3d9d32d1ffa44dab32d97010eb58f6b', '1', '/sysSetting/menu', 'bars', '菜单管理', '{\"path\":\"/sysSetting/menu\",\"iconStr\":\"bars\",\"title\":\"菜单管理\",\"remark\":\"平台所有菜单维护\",\"id\":\"\",\"isCommonUse\":false}', '0', 180, '1', '100', '2021-07-06 16:31:00', '1', '2021-07-06 16:31:00', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('f9f5ec6f9d4c4e5dab43ac26934ac76d', '1', '/sysSetting/dict', 'read', '字典管理', '{\"path\":\"/sysSetting/dict\",\"iconStr\":\"read\",\"title\":\"字典管理\",\"remark\":\"字典管理菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 270, '1', '100', '2021-07-06 16:54:19', '1', '2021-07-06 16:54:19', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_common_use_menu` VALUES ('fe93fdb435c44211b72baabd44f4b4d6', '1', '/monitor/server', 'pie-chart', '服务监控', '{\"path\":\"/monitor/server\",\"iconStr\":\"pie-chart\",\"title\":\"服务监控\",\"remark\":\"服务监控菜单\",\"id\":\"\",\"isCommonUse\":false}', '0', 220, '1', '100', '2021-07-06 16:43:42', '1', '2021-07-06 16:43:42', '127.0.0.1', NULL, 1, '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-01-30 13:27:43', '1', '2021-07-06 15:13:33', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', '1', 4, '0', '127.0.0.1', '1');
INSERT INTO `sys_config` VALUES ('用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-01-30 13:27:43', '', NULL, '初始化密码 123456', '2', 1, '0', NULL, '1');
INSERT INTO `sys_config` VALUES ('系统下载方式', 'sys.upload.save.type', 'Disk', 'Y', 'admin', '2021-03-12 17:43:10', '1', '2021-09-05 12:10:32', 'Disk', '2345678935345', 6, '0', '127.0.0.1', '1');
INSERT INTO `sys_config` VALUES ('主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-01-30 13:27:43', '1', '2021-08-06 11:39:33', '深色主题theme-dark，浅色主题theme-light   ', '3', 5, '0', '127.0.0.1', '1');
INSERT INTO `sys_config` VALUES ('用户是否可注册开关', 'sys.account.registerUser', 'true', 'Y', '1', '2021-09-29 23:51:21', '1', '2021-09-29 23:51:21', '是否开启验证码功能（true开启，false关闭）', 'b3158f15cbed4a3d93e43f19d5fb5893', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_config` VALUES ('验证码开关', 'sys.captcha.onOff', 'true', 'Y', '1', '2021-09-29 23:51:21', '1', '2021-09-29 23:51:21', '是否开启验证码功能（true开启，false关闭）', 'b3158f15cbed4a3d93e43f29d5fb5893', 1, '0', '127.0.0.1', '100');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `dept_full_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全称',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `dept_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮政编码',
  `dept_pinyin` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门拼音',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父id',
  `parent_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id集合',
  `tree_sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `tree_sorts` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序集合',
  `tree_level` int(11) NULL DEFAULT NULL COMMENT '层级',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否子节点（0是 1否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('03a29992f30f4fb69960081f0a37c53d', '109', '牙体牙髓科', '牙体牙髓科', NULL, NULL, NULL, 'company', NULL, NULL, 'yabenyasuike,yatiyasuike,ybysk,ytysk', '100', '100/03a29992f30f4fb69960081f0a37c53d', 140, '000010/000140', 2, 'y', '0', '1', '100', '2023-02-27 23:31:06', '1', '2023-02-27 23:31:06', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('100', '100', '雅仁口腔医院', '雅仁口腔医院', '管理员', '', '', 'org', NULL, NULL, 'yarenkouqiangyiyuan,yrkqyy', '0', '100', 10, '000010', 1, 'n', '0', 'admin', NULL, '2021-01-30 13:28:35', '1', '2023-02-27 23:17:59', '127.0.0.1', NULL, 10, '0');
INSERT INTO `sys_dept` VALUES ('102', '102', '口腔内科', '口腔内科', '管理员', '', '', 'company', NULL, NULL, 'yazhoubingke,yzbk', '100', '100/102', 10, '000010/000010', 2, 'y', '0', 'admin', NULL, '2021-01-30 13:28:35', '1', '2023-02-27 23:23:58', '127.0.0.1', '111', 35, '0');
INSERT INTO `sys_dept` VALUES ('103', '103', '口腔颌面外科', '口腔颌面外科', '管理员', NULL, NULL, 'company', NULL, NULL, NULL, '100', '100/103', 20, NULL, NULL, NULL, '0', '', NULL, NULL, '', NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_dept` VALUES ('104', '104', '口腔修复科', '口腔修复科', '管理员', NULL, NULL, 'company', NULL, NULL, NULL, '100', '100/104', 0, NULL, NULL, NULL, '0', '', NULL, NULL, '', NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_dept` VALUES ('329c243d6fba4394b06ab7bce657eb0d', '110', '口腔综合科', '口腔综合科', NULL, NULL, NULL, 'company', NULL, NULL, 'kouqiangzonggeke,kouqiangzengheke,kouqiangzenggeke,kouqiangzongheke,kqzgk,kqzhk', '100', '100/329c243d6fba4394b06ab7bce657eb0d', 140, '000010/000140', 2, 'y', '0', '1', '100', '2023-02-27 23:32:18', '1', '2023-02-27 23:32:18', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('493804a2932c4beaafbe578d12a87f36', '103', '口腔颌面外科', '口腔颌面外科', NULL, NULL, NULL, 'company', NULL, NULL, 'kouqianggemianwaike,kouqianghemianwaike,kqgmwk,kqhmwk', '100', '100/493804a2932c4beaafbe578d12a87f36', 140, '000010/000140', 2, 'n', '0', '1', '100', '2023-02-27 23:26:26', '1', '2023-02-27 23:33:54', '127.0.0.1', NULL, 2, '0');
INSERT INTO `sys_dept` VALUES ('6cfc59cee61343e3bf74ce774d12de4d', '1', '美学修复特色门诊', '美学修复特色门诊', NULL, NULL, NULL, 'dept', NULL, NULL, 'meixuexiufutesemenzhen,meixuexiufuteshaimenzhen,mxxftsmz', 'eea45c727c01448095cc34c44dde57ea', '100/eea45c727c01448095cc34c44dde57ea/6cfc59cee61343e3bf74ce774d12de4d', 10, '000010/000140/000010', 3, 'y', '0', '1', '100', '2023-02-27 23:28:09', '1', '2023-02-27 23:29:50', '127.0.0.1', NULL, 2, '0');
INSERT INTO `sys_dept` VALUES ('73135a9b50764785a776493178c841c7', '105', '口腔正畸科', NULL, NULL, NULL, NULL, 'company', NULL, NULL, 'kouqiangzhengjike,kqzjk', '100', '100/73135a9b50764785a776493178c841c7', 140, '000010/000140', 2, 'y', '0', '1', '100', '2023-02-27 23:23:43', '1', '2023-02-27 23:23:43', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('89fe90faf46d4bd9816ee5360e5e26f9', '2', '口腔颌面门诊', '口腔颌面门诊', NULL, NULL, NULL, 'company', NULL, NULL, 'kouqianggemianmenzhen,kouqianghemianmenzhen,kqgmmz,kqhmmz', '493804a2932c4beaafbe578d12a87f36', '100/493804a2932c4beaafbe578d12a87f36/89fe90faf46d4bd9816ee5360e5e26f9', 140, '000010/000140/000140', 3, 'y', '0', '1', '100', '2023-02-27 23:34:21', '1', '2023-02-27 23:34:21', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('8ecfdaa2f0ab4e9fa020c7fd4fe6799d', '1', '智齿门诊', '智齿门诊', NULL, NULL, NULL, 'dept', NULL, NULL, 'zhichimenzhen,zcmz', '493804a2932c4beaafbe578d12a87f36', '100/493804a2932c4beaafbe578d12a87f36/8ecfdaa2f0ab4e9fa020c7fd4fe6799d', 10, '000010/000140/000010', 3, 'y', '0', '1', '100', '2023-02-27 23:33:54', '1', '2023-02-27 23:33:54', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('915389574f804604a7305561601ae52b', '107', '儿童口腔科', '儿童口腔科', NULL, NULL, NULL, 'company', NULL, NULL, 'rtongkouqiangke,ertongkouqiangke,etkqk,rtkqk', '100', '100/915389574f804604a7305561601ae52b', 140, '000010/000140', 2, 'n', '0', '1', '100', '2023-02-27 23:29:25', '1', '2023-02-27 23:29:45', '127.0.0.1', NULL, 2, '0');
INSERT INTO `sys_dept` VALUES ('9cd4a133f3be4cd48faafc7e4b2a0713', '101', '口腔外科', '口腔外科', NULL, NULL, NULL, 'company', NULL, NULL, 'kouqiangwaike,kqwk', '100', '100/9cd4a133f3be4cd48faafc7e4b2a0713', 140, '000010/000140', 2, 'y', '0', '1', '100', '2023-02-27 23:28:55', '1', '2023-02-27 23:28:55', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('9d57f520b0e1415e9d447580e3f6fa7e', '108', '口腔种植科', '口腔种植科', NULL, NULL, NULL, 'company', NULL, NULL, 'kouqiangzhongzhike,kouqiangchongzhike,kqzzk,kqczk', '100', '100/9d57f520b0e1415e9d447580e3f6fa7e', 140, '000010/000140', 2, 'n', '0', '1', '100', '2023-02-27 23:30:29', '1', '2023-02-27 23:34:45', '127.0.0.1', NULL, 2, '0');
INSERT INTO `sys_dept` VALUES ('b7589320e1034493967c4ee33dc70f5d', '1', '种植修复门诊', '种植修复门诊', NULL, NULL, NULL, 'company', NULL, NULL, 'zhongzhixiufumenzhen,chongzhixiufumenzhen,zzxfmz,czxfmz', '9d57f520b0e1415e9d447580e3f6fa7e', '100/9d57f520b0e1415e9d447580e3f6fa7e/b7589320e1034493967c4ee33dc70f5d', 10, '000010/000140/000010', 3, 'y', '0', '1', '100', '2023-02-27 23:34:45', '1', '2023-02-27 23:34:45', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('bfb001eba3994ad19c29d8d6299ec719', '106', '牙周病科', '牙周病科', NULL, NULL, NULL, 'company', NULL, NULL, 'yazhoubingke,yzbk', '100', '100/bfb001eba3994ad19c29d8d6299ec719', 140, '000010/000140', 2, 'y', '0', '1', '100', '2023-02-27 23:27:14', '1', '2023-02-27 23:27:14', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('bfc33ca883714473b819908421fb3201', '111', '口腔粘膜病科', NULL, NULL, NULL, NULL, 'company', NULL, NULL, 'kouqiangnianmobingke,kouqiangzhanmobingke,kqzmbk,kqnmbk', '100', '100/bfc33ca883714473b819908421fb3201', 140, '000010/000140', 2, 'y', '0', '1', '100', '2023-02-27 23:32:49', '1', '2023-02-27 23:32:49', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('dee07afb39c3423fb729faa2e1f69137', '1', '儿童口腔舒适化门诊', '儿童口腔舒适化门诊', NULL, NULL, NULL, 'dept', NULL, NULL, 'rtongkouqiangshushihuamenzhen,ertongkouqiangshukuohuamenzhen,ertongkouqiangshushihuamenzhen,rtongkouqiangshukuohuamenzhen,etkqsshmz,rtkqsshmz,etkqskhmz,rtkqskhmz', '915389574f804604a7305561601ae52b', '100/915389574f804604a7305561601ae52b/dee07afb39c3423fb729faa2e1f69137', 10, '000010/000140/000010', 3, 'y', '0', '1', '100', '2023-02-27 23:29:45', '1', '2023-02-27 23:29:45', '127.0.0.1', NULL, 1, '0');
INSERT INTO `sys_dept` VALUES ('eea45c727c01448095cc34c44dde57ea', '104', '口腔修复科', '口腔修复科', NULL, NULL, NULL, 'company', NULL, NULL, 'kouqiangxiufuke,kqxfk', '100', '100/eea45c727c01448095cc34c44dde57ea', 140, '000010/000140', 2, 'n', '0', '1', '100', '2023-02-27 23:26:50', '1', '2023-02-27 23:28:09', '127.0.0.1', NULL, 2, '0');
INSERT INTO `sys_dept` VALUES ('f96f514133a241fd8bffd9dd899de8ea', 'manager', '市场部', '市场部', NULL, NULL, NULL, 'dept', NULL, NULL, 'shichangbu,scb', '102', '100/102/f96f514133a241fd8bffd9dd899de8ea', 10, '000010/000010/000010', 3, 'y', '0', '1', '40f40750917349249f3a7d4593e3e886', '2021-07-26 18:20:38', '1', '2021-09-04 21:54:25', '127.0.0.1', NULL, 3, '1');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NULL DEFAULT NULL COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dict_data_idx`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 10, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-01-30 13:27:43', '1', '2021-03-24 11:38:41', '性别男', '1', 1, '0', '127.0.0.1', NULL);
INSERT INTO `sys_dict_data` VALUES (10, 10, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '默认分组', '10', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (11, 20, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '系统分组', '11', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (12, 10, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '系统默认是', '12', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (13, 20, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '系统默认否', '13', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (14, 10, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '通知', '14', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (15, 20, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '公告', '15', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (16, 10, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '正常状态', '16', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (17, 20, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '关闭状态', '17', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (18, 10, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '新增操作', '18', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (19, 20, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '修改操作', '19', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (2, 20, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '性别女', '2', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (20, 30, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '删除操作', '20', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (27, 100, '查询', '10', 'sys_oper_type', NULL, NULL, NULL, '0', '1', '2021-10-04 22:37:38', '1', '2021-10-04 22:49:32', '查询', '205c0b4c-e4d2-44b1-b70b-0d231b07012d', 3, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (21, 40, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '授权操作', '21', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (22, 50, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '导出操作', '22', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (23, 60, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '导入操作', '23', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (24, 70, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '强退操作', '24', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (25, 80, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '生成操作', '25', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (26, 90, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '清空操作', '26', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (27, 10, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '正常状态', '27', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (28, 20, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '停用状态', '28', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (3, 30, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '性别未知', '3', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (NULL, 10, '系统', 'S', 'sys_portal_range', NULL, NULL, NULL, '1', '1', '2021-05-11 10:15:31', '1', '2021-06-21 15:49:10', NULL, '311f9aef2e354baf962a39b52602b7ad', 21, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 10, '有效', '0', 'sys_is_valid', NULL, NULL, NULL, '0', '1', '2021-05-27 10:10:48', '1', '2021-05-27 10:10:48', NULL, '36315b7a36a94a56ae1822b49da8da50', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 10, '后台用户', '1', 'sys_user_type', NULL, NULL, NULL, '0', '1', '2021-03-01 11:41:30', '1', '2021-03-01 11:41:35', NULL, '38ca19b3b24242b48c6d8302bb6f1a67', 2, '0', '127.0.0.1', '103');
INSERT INTO `sys_dict_data` VALUES (NULL, 10, '部分成功', 'sucess_fail', 'sys_upload_file_status', NULL, NULL, NULL, '0', '1', '2021-07-29 17:54:49', '1', '2021-07-29 17:54:49', NULL, '3e6d5a3380834e92af742b0ef3a3dbb1', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (4, 10, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '显示菜单', '4', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (5, 20, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '隐藏菜单', '5', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (NULL, 20, '失败', 'fail', 'sys_upload_file_status', NULL, NULL, NULL, '0', '1', '2021-07-29 17:54:28', '1', '2021-07-29 17:54:28', NULL, '5f04bcbfde0049ddb2a17441976a64b2', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (6, 10, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '正常状态', '6', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (NULL, 200, '开启', '20', 'is_active', NULL, NULL, NULL, '0', '1', '2021-08-12 16:16:16', '1', '2021-08-12 16:16:16', NULL, '60e4ea6677b54a2ea98310538f597b12', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 30, '处理中', 'processing', 'sys_upload_file_status', NULL, NULL, NULL, '0', '1', '2021-07-29 21:41:04', '1', '2021-07-29 21:41:04', NULL, '68e4aeacb4534486b253c7e1d91b4f0c', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (7, 20, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '停用状态', '7', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (NULL, 10, '等待下载', 'waiting', 'sys_download_file_status', NULL, NULL, NULL, '0', '1', '2021-07-18 18:59:48', '1', '2021-07-18 18:59:48', NULL, '728d9405e43b4ac6953ef0f37fe59d5f', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (8, 10, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '正常状态', '8', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (NULL, 20, '角色', 'R', 'sys_portal_range', NULL, NULL, NULL, '0', '1', '2021-05-11 10:15:48', '1', '2021-05-11 10:15:48', NULL, '86adc81770e34600ab906d68b927c110', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 20, '导出失败', 'fail', 'sys_download_file_status', NULL, NULL, NULL, '0', '1', '2021-07-18 15:05:22', '1', '2021-07-18 15:05:22', NULL, '888a580d4c914e9a9a59021b149301c4', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (9, 20, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '停用状态', '9', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (NULL, 20, '前台用户', '2', 'sys_user_type', NULL, NULL, NULL, '0', '1', '2021-03-01 11:41:46', '1', '2021-03-01 11:41:46', NULL, '9f6424fbc8154850ba41076616855d63', 1, '0', '127.0.0.1', '103');
INSERT INTO `sys_dict_data` VALUES (NULL, 10, '机构', 'org', 'sys_dept_type', NULL, NULL, NULL, '0', '1', '2021-02-24 18:35:41', '1', '2021-02-25 15:22:42', NULL, 'a2c5e3f94ce44007adb448de721bbc49', 5, '0', '127.0.0.1', '103');
INSERT INTO `sys_dict_data` VALUES (NULL, 30, '文件已过期', 'expired', 'sys_download_file_status', NULL, NULL, NULL, '0', '1', '2021-07-18 15:05:46', '1', '2021-07-18 15:05:46', NULL, 'a8a02ea692f246c4be64b0f341291c5b', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (28, 110, '校验', '11', 'sys_oper_type', NULL, NULL, NULL, '0', '1', '2021-10-04 22:40:50', '1', '2021-10-04 22:50:02', '校验', 'ab9bbed6-9395-420f-9fa2-c9be42550017', 2, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 20, '公司', 'company', 'sys_dept_type', NULL, NULL, NULL, '0', '1', '2021-02-24 11:45:32', '1', '2021-02-24 14:06:42', NULL, 'c226f8276bbd41ce9bb53bff9f38e6db', 3, '0', '127.0.0.1', '103');
INSERT INTO `sys_dict_data` VALUES (NULL, 20, '无效', '1', 'sys_is_valid', NULL, NULL, NULL, '0', '1', '2021-05-27 10:10:58', '1', '2021-05-27 10:10:58', NULL, 'c4f7b956f6074cde80ea2d0520aaae15', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 30, '部门', 'dept', 'sys_dept_type', NULL, NULL, NULL, '0', '1', '2021-03-02 10:14:09', '1', '2021-03-02 10:14:09', NULL, 'cc8564ca5919410e8ee71145ef652ccd', 1, '0', '127.0.0.1', '103');
INSERT INTO `sys_dict_data` VALUES (NULL, 40, '导出成功', 'success', 'sys_download_file_status', NULL, NULL, NULL, '0', '1', '2021-07-18 15:05:11', '1', '2021-07-18 15:05:11', NULL, 'd057ba5be59947bda3275e604ad758d0', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 100, '关闭', '10', 'is_active', NULL, NULL, NULL, '0', '1', '2021-08-12 16:16:05', '1', '2021-08-12 16:16:05', NULL, 'd6a6dd3180e2497eb34b29c5b29ead15', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 30, '用户', 'U', 'sys_portal_range', NULL, NULL, NULL, '0', '1', '2021-05-11 10:16:00', '1', '2021-05-11 10:16:00', NULL, 'dae2f9bc8046495182fa320b9efd05b2', 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_data` VALUES (NULL, 40, '成功', 'success', 'sys_upload_file_status', NULL, NULL, NULL, '0', '1', '2021-07-29 17:54:13', '1', '2021-07-29 17:54:13', NULL, 'f5b21638f0af411fa642f78811b9650d', 1, '0', '127.0.0.1', '100');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2021-01-30 13:27:43', '1', '2021-03-24 11:38:47', '用户性别列表', 1, '0', '127.0.0.1', NULL);
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '登录状态列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('17a5aedeee3f4ed0a3a7d0d84e5b37d2', '门户应用范围', 'sys_portal_range', '0', '1', '2021-05-11 10:15:05', '1', '2021-05-11 10:15:05', NULL, 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '菜单状态列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '系统开关列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '任务状态列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '任务分组列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '系统是否列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('6a944ab30cdb4bcda6380db18515e111', '导出文件状态', 'sys_download_file_status', '0', '1', '2021-07-18 15:03:42', '1', '2021-07-18 15:03:42', NULL, 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '通知类型列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('79aaacc0f8424b75b4b2dd1809b698c6', '是否有效', 'sys_is_valid', '0', '1', '2021-05-27 10:10:26', '1', '2021-05-27 10:10:26', NULL, 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '通知状态列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2021-01-30 13:27:43', '', NULL, '操作类型列表', 1, '0', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('a2dce0cac0ce4d539ca0c9f4ee2893b1', '是否启动', 'is_active', '0', '1', '2021-08-12 16:15:39', '1', '2021-08-12 16:15:39', NULL, 1, '0', '127.0.0.1', '100');
INSERT INTO `sys_dict_type` VALUES ('aa0c5c14dca441e49c5d98c620429cda', '用户类型', 'sys_user_type', '0', '1', '2021-03-01 11:41:07', '1', '2021-03-01 11:41:07', NULL, 1, '0', '127.0.0.1', '103');
INSERT INTO `sys_dict_type` VALUES ('c3c50d4b965640b19a5e73597922ba20', '部门类型', 'sys_dept_type', '0', '1', '2021-02-25 17:11:16', '1', '2021-02-25 17:11:16', '1', 1, '0', '127.0.0.1', '103');
INSERT INTO `sys_dict_type` VALUES ('f90f3ffd1e474160a6cbeaf88cef2647', '导入文件状态', 'sys_upload_file_status', '0', '1', '2021-07-29 17:50:27', '1', '2021-07-29 17:53:35', NULL, 2, '0', '127.0.0.1', '100');

-- ----------------------------
-- Table structure for sys_download_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_download_files`;
CREATE TABLE `sys_download_files`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `file_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `file_create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `download_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载用户',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `dto_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '对象值',
  `dto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '对象',
  `service_bean` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属Bean对象',
  `status` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1 停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `batch_count` int(11) NULL DEFAULT NULL COMMENT '总处理数',
  `success_count` int(11) NULL DEFAULT NULL COMMENT '已处理变更',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导出记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_download_files
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-01-30 13:27:43', '', '2021-06-09 09:58:47', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-01-30 13:27:43', '', '2021-06-09 10:01:44', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-01-30 13:27:43', '', '2021-06-09 11:15:02', '');
INSERT INTO `sys_job` VALUES (4, '系统定时清理日志', 'DEFAULT', 'systemRemoveLogTask.removeLog(\'10\')', '0 0 1 * * ? *', '1', '1', '0', 'admin', '2021-07-06 09:56:16', 'admin', '2021-07-06 10:48:29', '每天凌晨一点清除日志，保留10天');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (14, '系统定时清理日志', 'DEFAULT', 'systemRemoveLogTask.removeLog(\'10\')', '系统定时清理日志 总共耗时：540毫秒', '0', '', '2023-03-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (15, '系统定时清理日志', 'DEFAULT', 'systemRemoveLogTask.removeLog(\'10\')', '系统定时清理日志 总共耗时：247毫秒', '0', '', '2023-03-20 17:00:00');
INSERT INTO `sys_job_log` VALUES (16, '系统定时清理日志', 'DEFAULT', 'systemRemoveLogTask.removeLog(\'10\')', '系统定时清理日志 总共耗时：1937毫秒', '0', '', '2023-03-25 06:07:38');
INSERT INTO `sys_job_log` VALUES (17, '系统定时清理日志', 'DEFAULT', 'systemRemoveLogTask.removeLog(\'10\')', '系统定时清理日志 总共耗时：129毫秒', '0', '', '2023-03-25 17:00:00');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 12:40:10', '246c16323a7242f9b2d3bf3bf06d13be', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 08:40:11', '288ad53c913740a29869adae315ca24f', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 14:48:07', '2acef1109bed4b42807ca0ead57c30af', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-26 12:18:47', '6284b270ecd84745b7048805c3275ec4', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 05:53:00', '85432f4c7d644c4f883db656e6fa3bc5', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 12:18:56', '8ba1360f152343049cd7e615bbb62160', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 16:06:27', '96523e69ffc940058c6736a752df1bec', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 02:18:21', 'a7c4692675d2448692c142a4258898bc', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-26 02:18:18', 'b1efc443293447e4a47fba9053885f1c', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-19 10:09:31', 'e314c356f3de415691b7055ed704fd9b', NULL, '0');
INSERT INTO `sys_login_log` VALUES ('admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 12:40:17', 'e8c40b9a816e49fba5e66ed62204f837', NULL, '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `menu_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父菜单ID',
  `sort` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `parent_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id集合',
  `tree_sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `tree_sorts` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序集合',
  `tree_level` int(11) NULL DEFAULT NULL COMMENT '层级',
  `tree_leaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否子节点（0是 1否）',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('040aab3d4f0d458f9a6057ae0d9d0f25', 'division_list', '科室列表', 'c836f130e3214dde8007b1ed1fcf7086', 0, 'division/list', NULL, 1, 0, 'M', '0', '0', NULL, 'team', '1', '2023-02-27 22:51:12', '1', '2023-02-27 22:51:12', NULL, 'c836f130e3214dde8007b1ed1fcf7086/040aab3d4f0d458f9a6057ae0d9d0f25', 30, '000014/000030', 2, 'y', '100', '127.0.0.1', 1, '1');
INSERT INTO `sys_menu` VALUES ('0a122b6b4ba046ea803d28e4ba04424c', 'sysPortletRemove', '门户小页管理删除', '2cd6e3f489bc44cd978b5f7d7772fa00', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortlet:remove', '#', '1', '2021-05-10 17:09:43', '1', '2021-05-10 17:09:43', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/2cd6e3f489bc44cd978b5f7d7772fa00/0a122b6b4ba046ea803d28e4ba04424c', 40, '000080/000050/000030/40', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('0cde805b2f754de09dd8318c151113db', 'register', '预约挂号', 'c7ce350ebebc4e23af0b23afe487b42d', 0, 'reserve/register', NULL, 1, 0, 'M', '0', '0', '', 'users', '1', '2023-03-26 23:10:42', '1', '2023-03-26 23:12:39', NULL, 'c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db', 10, '000011/000010', 2, 'y', '100', '127.0.0.1', 5, '0');
INSERT INTO `sys_menu` VALUES ('0f69d2222aee4cd58975cc444c319171', 'sysPortletQuery', '门户小页管理查询', '2cd6e3f489bc44cd978b5f7d7772fa00', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortlet:query', '#', '1', '2021-05-10 17:09:43', '1', '2021-05-10 17:09:43', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/2cd6e3f489bc44cd978b5f7d7772fa00/0f69d2222aee4cd58975cc444c319171', 10, '000080/000050/000030/10', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('1', 'system_manage', '系统管理', '0', 11, 'system', '', 1, 0, 'M', '0', '0', '', 'setting', 'admin', '2021-01-30 13:27:43', '1', '2023-02-23 21:16:15', '系统管理目录', '1', 80, '000080', 1, 'n', '', '127.0.0.1', 29, '0');
INSERT INTO `sys_menu` VALUES ('100', 'doctor', '医生管理', 'fb5cb6a02c33440991542c915ff62f34', 1, 'doctor', 'system/user/SysUserIndex', 1, 0, 'C', '0', '0', 'system:user:list\'', 'team', 'admin', '2021-01-30 13:27:43', '1', '2023-03-26 23:05:09', '主要维护平台相关用户信息', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100', 10, '000080/000010/000010', 3, 'n', '', '127.0.0.1', 22, '0');
INSERT INTO `sys_menu` VALUES ('1001', 'userQuery', '用户查询', '100', 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:43:32', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100/1001', 10, '000080/000010/000010/000010', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1002', 'userAdd', '用户新增', '100', 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:43:42', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100/1002', 20, '000080/000010/000010/000020', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1003', 'userEdit', '用户修改', '100', 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:43:56', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100/1003', 30, '000080/000010/000010/000030', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1004', 'userRemove', '用户删除', '100', 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:44:06', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100/1004', 40, '000080/000010/000010/000040', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1005', 'userExport', '用户导出', '100', 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:44:20', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100/1005', 50, '000080/000010/000010/000050', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1006', 'userImport', '用户导入', '100', 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:45:01', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100/1006', 0, '000080/000010/000010/000000', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1007', 'userReetPwd', '重置密码', '100', 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:44:37', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/100/1007', 0, '000080/000010/000010/000000', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1008', 'roleQuery', '角色查询', '101', 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:48:38', '', '1/ed0919f0a42e4a07993622037df86a33/101/1008', 10, '000080/000020/000010/000010', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1009', 'roleAdd', '角色新增', '101', 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:48:55', '', '1/ed0919f0a42e4a07993622037df86a33/101/1009', 20, '000080/000020/000010/000020', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('101', 'role-manager', '角色管理', 'ed0919f0a42e4a07993622037df86a33', 2, 'role', 'system/role/QueryList', 1, 0, 'C', '0', '0', '', 'contacts', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:49:36', '维护平台各角色数据以及权限分配.', '1/ed0919f0a42e4a07993622037df86a33/101', 10, '000080/000020/000010', 3, 'n', '', '127.0.0.1', 17, '0');
INSERT INTO `sys_menu` VALUES ('1010', 'roleEdit', '角色修改', '101', 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:49:03', '', '1/ed0919f0a42e4a07993622037df86a33/101/1010', 30, '000080/000020/000010/000030', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1011', 'roleRemove', '角色删除', '101', 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:49:11', '', '1/ed0919f0a42e4a07993622037df86a33/101/1011', 40, '000080/000020/000010/000040', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1012', 'roleExport', '角色导出', '101', 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:49:18', '', '1/ed0919f0a42e4a07993622037df86a33/101/1012', 50, '000080/000020/000010/000050', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1013', 'menuQuery', '菜单查询', '102', 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:49:37', '', '1/2ea5441cad6d47679b9029b6ac2d291f/102/1013', 10, '000080/000030/000010/000010', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1014', 'menuAdd', '菜单新增', '102', 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:49:45', '', '1/2ea5441cad6d47679b9029b6ac2d291f/102/1014', 20, '000080/000030/000010/000020', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1015', 'menuEdit', '菜单修改', '102', 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:50:00', '', '1/2ea5441cad6d47679b9029b6ac2d291f/102/1015', 30, '000080/000030/000010/000030', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1016', 'menuRemove', '菜单删除', '102', 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 14:50:08', '', '1/2ea5441cad6d47679b9029b6ac2d291f/102/1016', 40, '000080/000030/000010/000040', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1017', 'deptQuery', '部门查询', '103', 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:43:41', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/103/1017', 30, '000080/000010/000020/000030', 4, 'y', '', '127.0.0.1', 10, '0');
INSERT INTO `sys_menu` VALUES ('1018', 'deptAdd', '部门新增', '103', 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:43:51', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/103/1018', 40, '000080/000010/000020/000040', 4, 'y', '', '127.0.0.1', 10, '0');
INSERT INTO `sys_menu` VALUES ('1019', 'deptEdit', '部门修改', '103', 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:43:20', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/103/1019', 10, '000080/000010/000020/000010', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('102', 'menu-manager', '菜单管理', '2ea5441cad6d47679b9029b6ac2d291f', 3, 'menu', 'system/menu/MenuIndex', 1, 0, 'C', '0', '0', 'system:menu:list', 'bars', 'admin', '2021-01-30 13:27:43', '1', '2021-06-08 10:08:35', '平台所有菜单维护', '1/2ea5441cad6d47679b9029b6ac2d291f/102', 10, '000080/000030/000010', 3, 'n', '', '127.0.0.1', 14, '0');
INSERT INTO `sys_menu` VALUES ('1020', 'deptRemove', '部门删除', '103', 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:43:31', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/103/1020', 20, '000080/000010/000020/000020', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1021', 'postQuery', '岗位查询', '104', 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:44:29', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/104/1021', 10, '000080/000010/000030/000010', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1022', 'postAdd', '岗位新增', '104', 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:44:40', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/104/1022', 20, '000080/000010/000030/000020', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1023', 'postEdit', '岗位修改', '104', 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:45:00', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/104/1023', 30, '000080/000010/000030/000030', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1024', 'postRemove', '岗位删除', '104', 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:45:36', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/104/1024', 40, '000080/000010/000030/000040', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1025', 'postExport', '岗位导出', '104', 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:45:48', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/104/1025', 50, '000080/000010/000030/000050', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1026', 'dictQuery', '字典查询', '105', 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:11:42', '', '1/2ea5441cad6d47679b9029b6ac2d291f/105/1026', 10, '000080/000030/000020/000010', 4, 'y', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('1027', 'dictAdd', '字典新增', '105', 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:08', '', '1/2ea5441cad6d47679b9029b6ac2d291f/105/1027', 20, '000080/000030/000020/000020', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1028', 'dictEdit', '字典修改', '105', 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:16', '', '1/2ea5441cad6d47679b9029b6ac2d291f/105/1028', 30, '000080/000030/000020/000030', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1029', 'dictRemove', '字典删除', '105', 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:22', '', '1/2ea5441cad6d47679b9029b6ac2d291f/105/1029', 40, '000080/000030/000020/000040', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('103', 'dept-manager', '科室管理', 'fb5cb6a02c33440991542c915ff62f34', 4, 'dept', 'system/dept/SysDeptIndex', 1, 0, 'C', '0', '0', 'system:dept:list', 'cluster', 'admin', '2021-01-30 13:27:43', '1', '2023-03-26 23:01:24', '部门管理菜单', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/103', 20, '000080/000010/000020', 3, 'n', '', '127.0.0.1', 15, '0');
INSERT INTO `sys_menu` VALUES ('1030', 'dictExport', '字典导出', '105', 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:28', '', '1/2ea5441cad6d47679b9029b6ac2d291f/105/1030', 50, '000080/000030/000020/000050', 4, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('1031', 'configQuery', '参数查询', '106', 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:37', '', '1/2ea5441cad6d47679b9029b6ac2d291f/106/1031', 10, '000080/000030/000030/000010', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1032', 'configAdd', '参数新增', '106', 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:44', '', '1/2ea5441cad6d47679b9029b6ac2d291f/106/1032', 20, '000080/000030/000030/000020', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1033', 'configEdit', '参数修改', '106', 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:50', '', '1/2ea5441cad6d47679b9029b6ac2d291f/106/1033', 30, '000080/000030/000030/000030', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1034', 'configRemove', '参数删除', '106', 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:12:57', '', '1/2ea5441cad6d47679b9029b6ac2d291f/106/1034', 40, '000080/000030/000030/000040', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1035', 'configExport', '参数导出', '106', 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:13:04', '', '1/2ea5441cad6d47679b9029b6ac2d291f/106/1035', 50, '000080/000030/000030/000050', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1036', 'notice-query', '公告查询', '107', 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:13:17', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/107/1036', 10, '000080/000050/000010/000010', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1037', 'noticeAdd', '公告新增', '107', 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:13:23', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/107/1037', 20, '000080/000050/000010/000020', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1038', 'noticeEdit', '公告修改', '107', 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:13:29', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/107/1038', 30, '000080/000050/000010/000030', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1039', 'noticeRemove', '公告删除', '107', 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:13:36', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/107/1039', 40, '000080/000050/000010/000040', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('104', 'post-manager', '岗位管理', 'fb5cb6a02c33440991542c915ff62f34', 5, 'post', 'system/post/PostIndex', 1, 0, 'C', '0', '0', 'system:post:list', 'idcard', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:44:09', '岗位管理菜单', '1/8f00f7f7d3b44aaba1041bc8fdf6c470/104', 30, '000080/000010/000030', 3, 'n', '', '127.0.0.1', 14, '0');
INSERT INTO `sys_menu` VALUES ('1040', 'operateLogQuery', '操作查询', '500', 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:14:05', '', '1/108/500/1040', 10, '000080/000040/000010/000010', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1041', 'operateLogRemove', '操作删除', '500', 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:14:13', '', '1/108/500/1041', 20, '000080/000040/000010/000020', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1042', 'operateLoExport', '日志导出', '500', 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:14:20', '', '1/108/500/1042', 30, '000080/000040/000010/000030', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1043', 'loginLogQuery', '登录查询', '501', 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:loginLog:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:14:30', '', '1/108/501/1043', 10, '000080/000040/000020/000010', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1044', 'loginLogRemove', '登录删除', '501', 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:loginLog:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:14:36', '', '1/108/501/1044', 20, '000080/000040/000020/000020', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1045', 'loginLogExport', '日志导出', '501', 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:loginLog:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:14:43', '', '1/108/501/1045', 30, '000080/000040/000020/000030', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1046', 'onlineQuery', '在线查询', '109', 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:15:40', '', '2/109/1046', 10, '000020/000010/000010', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1047', 'onlineBatchLogout', '批量强退', '109', 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:15:47', '', '2/109/1047', 20, '000020/000010/000020', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1048', 'onlineLogout', '单条强退', '109', 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:15:54', '', '2/109/1048', 30, '000020/000010/000030', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1049', 'jobQuery', '任务查询', '110', 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:16:06', '', '2/110/1049', 10, '000020/000020/000010', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('105', 'dict-manager', '字典管理', '2ea5441cad6d47679b9029b6ac2d291f', 6, 'dict', 'system/dict/DictIndex', 1, 0, 'C', '0', '0', 'system:dict:list', 'read', 'admin', '2021-01-30 13:27:43', '1', '2021-06-08 09:53:17', '字典管理菜单', '1/2ea5441cad6d47679b9029b6ac2d291f/105', 20, '000080/000030/000020', 3, 'n', '', '127.0.0.1', 12, '0');
INSERT INTO `sys_menu` VALUES ('1050', 'jobAdd', '任务新增', '110', 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:16:17', '', '2/110/1050', 20, '000020/000020/000020', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1051', 'jobEdit', '任务修改', '110', 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:16:25', '', '2/110/1051', 30, '000020/000020/000030', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1052', 'jobRemove', '任务删除', '110', 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:16:32', '', '2/110/1052', 40, '000020/000020/000040', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1053', 'jobChangeStatus', '状态修改', '110', 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:16:42', '', '2/110/1053', 50, '000020/000020/000050', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1054', 'jobExport', '任务导出', '110', 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:16:49', '', '2/110/1054', 60, '000020/000020/000060', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1055', 'genQuery', '生成查询', '115', 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:18:08', '', '3/115/1055', 10, '000030/000020/000010', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1056', 'genEdit', '生成修改', '115', 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:18:14', '', '3/115/1056', 20, '000030/000020/000020', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1057', 'genRemove', '生成删除', '115', 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:18:23', '', '3/115/1057', 30, '000030/000020/000030', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1058', 'genImport', '导入代码', '115', 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:18:30', '', '3/115/1058', 40, '000030/000020/000040', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('1059', 'genPreview', '预览代码', '115', 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:18:38', '', '3/115/1059', 50, '000030/000020/000050', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('106', 'config-manager', '参数设置', '2ea5441cad6d47679b9029b6ac2d291f', 7, 'config', 'system/config/ConfigIndex', 1, 0, 'C', '0', '0', 'system:config:list', 'code', 'admin', '2021-01-30 13:27:43', '1', '2021-06-08 09:53:33', '参数设置菜单', '1/2ea5441cad6d47679b9029b6ac2d291f/106', 30, '000080/000030/000030', 3, 'n', '', '127.0.0.1', 12, '0');
INSERT INTO `sys_menu` VALUES ('1060', 'gen-code', '生成代码', '115', 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:18:45', '', '3/115/1060', 60, '000030/000020/000060', 3, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('107', 'notice-manager', '通知公告', 'd8a45047891d4a28a5a3faf96f2b8d97', 8, 'notice', 'system/notice/NoticeIndex', 1, 0, 'C', '0', '0', 'system:notice:list', 'notification', 'admin', '2021-01-30 13:27:43', '1', '2021-06-08 10:05:31', '通知公告菜单', '1/d8a45047891d4a28a5a3faf96f2b8d97/107', 10, '000080/000050/000010', 3, 'n', '', '127.0.0.1', 11, '0');
INSERT INTO `sys_menu` VALUES ('108', 'system-log', '日志管理', '1', 9, 'log', '', 1, 0, 'M', '0', '0', '', 'copy', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 10:41:19', '日志管理菜单', '1/108', 40, '000080/000040', 2, 'n', '', '127.0.0.1', 11, '0');
INSERT INTO `sys_menu` VALUES ('109', 'online-user', '在线用户', '2', 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'dot-chart', 'admin', '2021-01-30 13:27:43', '1', '2021-04-23 10:38:59', '在线用户菜单', '2/109', 10, '000020/000010', 2, 'n', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('1099', 'loginLogUnlock', '账户解锁', '501', 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:loginLog:unlock', '#', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:14:36', '', '1/108/501/1044', 20, '000080/000040/000020/000020', 4, 'y', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('110', 'job-manager', '定时任务', '2', 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'bar-chart', 'admin', '2021-01-30 13:27:43', '1', '2021-04-23 10:39:25', '定时任务菜单', '2/110', 20, '000020/000020', 2, 'n', '', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('111', 'druid-monitor', '数据监控', '2', 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'dashboard', 'admin', '2021-01-30 13:27:43', '1', '2021-04-23 10:52:49', '数据监控菜单', '2/111', 30, '000020/000030', 2, 'y', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('112', 'server-monitor', '服务监控', '2', 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'pie-chart', 'admin', '2021-01-30 13:27:43', '1', '2021-04-23 10:41:17', '服务监控菜单', '2/112', 40, '000020/000040', 2, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('113', 'cache-monitor', '缓存监控', '2', 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'box-plot', 'admin', '2021-01-30 13:27:43', '1', '2021-04-23 10:41:35', '缓存监控菜单', '2/113', 50, '000020/000050', 2, 'y', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('114', 'form-generate', '表单构建', '3', 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'bars', 'admin', '2021-01-30 13:27:43', '1', '2021-04-23 10:41:50', '表单构建菜单', '3/114', 10, '000030/000010', 2, 'y', '', '127.0.0.1', 6, '1');
INSERT INTO `sys_menu` VALUES ('115', 'code-gen', '代码生成', '3', 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-01-30 13:27:43', '1', '2021-03-26 15:17:26', '代码生成菜单', '3/115', 20, '000030/000020', 2, 'n', '', '127.0.0.1', 6, '0');
INSERT INTO `sys_menu` VALUES ('116', 'saggger-manager', '系统接口', '3', 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'api', 'admin', '2021-01-30 13:27:43', '1', '2021-04-23 10:42:53', '系统接口菜单', '3/116', 30, '000030/000030', 2, 'y', '', '127.0.0.1', 6, '1');
INSERT INTO `sys_menu` VALUES ('1a028e4c7c644c06a36dc6f64285b2e0', 'schedule_modify', '换班申请', 'c836f130e3214dde8007b1ed1fcf7086', 0, 'schedule/modify', NULL, 1, 0, 'M', '0', '0', '', 'file-sync', '1', '2023-02-23 22:05:25', '1', '2023-02-27 22:51:25', NULL, 'c836f130e3214dde8007b1ed1fcf7086/1a028e4c7c644c06a36dc6f64285b2e0', 40, '000014/000040', 2, 'y', '100', '127.0.0.1', 2, '1');
INSERT INTO `sys_menu` VALUES ('1d43e70d8a734644aa0d062dc230bc4f', 'testHttp', '测试外链', '2007', 0, 'http://localhost:8000/', '', 0, 0, 'C', '0', '0', '', 'compress', '1', '2021-05-06 16:02:42', '1', '2021-05-06 16:06:25', '', '2007/1d43e70d8a734644aa0d062dc230bc4f', 150, '000050/000150', 2, 'y', '100', '127.0.0.1', 4, '0');
INSERT INTO `sys_menu` VALUES ('1f89001d84ba48dcb41abc13cccc67e4', 'auth-center', '菜单授权', 'ed0919f0a42e4a07993622037df86a33', 0, 'sysAuth', 'system/role/SysRoleAuth', 1, 0, 'C', '0', '0', '', 'api', '1', '2021-06-04 13:44:30', '1', '2021-09-13 08:52:05', '', '1/ed0919f0a42e4a07993622037df86a33/1f89001d84ba48dcb41abc13cccc67e4', 30, '000080/000020/000030', 3, 'y', '100', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('2', 'system_monitor', '系统监控', '0', 2, 'monitor', '', 1, 0, 'M', '0', '0', '', 'fund', 'admin', '2021-01-30 13:27:43', '1', '2021-09-04 15:45:13', '系统监控目录', '2', 20, '000020', 1, 'n', '', '127.0.0.1', 11, '0');
INSERT INTO `sys_menu` VALUES ('2004', 'report_forms', '报表看板', '0', 4, 'echart', 'demo/chart/echartDashBoard', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2021-02-01 11:15:22', '1', '2023-03-26 23:16:02', '', '2004', 9, '000009', 1, 'y', '', '127.0.0.1', 13, '0');
INSERT INTO `sys_menu` VALUES ('2007', 'sys_demo', '示例中心', '0', 6, 'demo', '', 1, 0, 'M', '0', '0', '', 'pie-chart', 'admin', '2021-02-02 09:30:51', '1', '2021-09-04 16:20:47', '', '2007', 50, '000050', 1, 'n', '', '127.0.0.1', 18, '1');
INSERT INTO `sys_menu` VALUES ('2008', '2008', '选人页', '2007', 1, 'selectUser', 'demo/selectUser/selectUser', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2021-02-02 09:31:52', '1', '2021-03-26 15:22:03', '', '2007/2008', 20, '000050/000020', 2, 'y', '', '127.0.0.1', 7, '1');
INSERT INTO `sys_menu` VALUES ('2012', 'system-icon-select', '图标选择', 'd8a45047891d4a28a5a3faf96f2b8d97', 10, 'iconSelect', 'system/iconSelect/IconSelect', 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2021-02-06 15:04:26', '1', '2021-06-08 10:05:54', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/2012', 20, '000080/000050/000020', 3, 'y', '', '127.0.0.1', 10, '0');
INSERT INTO `sys_menu` VALUES ('2018', '2018', '选部门', '2007', 5, 'selectDept', 'demo/selectDept/selectDept', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2021-03-01 10:42:25', '1', '2021-03-26 15:22:18', '', '2007/2018', 30, '000050/000030', 2, 'y', '', '127.0.0.1', 7, '1');
INSERT INTO `sys_menu` VALUES ('2acc2c60c24b4ba2a6180b748f7c42eb', 'card', '就诊卡管理', '5e3a69d199454f0bad992706ac5bfc51', 0, 'patient/card', NULL, 1, 0, 'M', '0', '0', '', 'edit', '1', '2023-03-26 22:50:49', '1', '2023-03-26 22:58:34', NULL, '5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb', 20, '000010/000020', 2, 'y', '100', '127.0.0.1', 4, '0');
INSERT INTO `sys_menu` VALUES ('2bb61f0f958c400faf97f37d35a1b7d6', 'sysPortalConfigEdit', '多栏目门户配置修改', 'e70d56d0bec74c4aba2105854ce5608f', 30, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortalConfig:edit', '#', '1', '2021-05-10 18:20:28', '1', '2021-05-10 18:20:28', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/e70d56d0bec74c4aba2105854ce5608f/2bb61f0f958c400faf97f37d35a1b7d6', 30, '000080/000050/000040/30', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('2cd6e3f489bc44cd978b5f7d7772fa00', 'sysPortlet', '工作台小页', 'd8a45047891d4a28a5a3faf96f2b8d97', 100, 'sysPortlet', 'system/sysportlet/index', 1, 0, 'C', '0', '0', 'system:sysPortlet:list', 'color', '1', '2021-05-10 17:09:43', '1', '2021-09-13 08:53:15', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/2cd6e3f489bc44cd978b5f7d7772fa00', 30, '000080/000050/000030', 3, 'n', '', '127.0.0.1', 4, '0');
INSERT INTO `sys_menu` VALUES ('2e8945e8fe7140deb3375664de4b0e9d', 'sysUploadFilesQuery', '导入记录查询', '4e3d48641bcf44f18a59a5ba35315f28', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysUploadFiles:query', '#', '1', '2021-07-29 18:11:06', '1', '2021-07-29 18:11:06', '', 'd54485baef564e40a4b40249a937734b/4e3d48641bcf44f18a59a5ba35315f28/2e8945e8fe7140deb3375664de4b0e9d', 10, '000040/000010/10', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('2ea5441cad6d47679b9029b6ac2d291f', 'system-setting', '系统设置', '1', 0, 'sysSetting', '', 1, 0, 'M', '0', '0', '', 'setting', '1', '2021-06-08 09:52:35', '1', '2021-09-04 10:40:59', '', '1/2ea5441cad6d47679b9029b6ac2d291f', 30, '000080/000030', 2, 'n', '100', '127.0.0.1', 5, '0');
INSERT INTO `sys_menu` VALUES ('3', 'system_tool', '系统工具', '0', 3, 'tool', '', 1, 0, 'M', '1', '0', '', 'appstore', 'admin', '2021-01-30 13:27:43', '1', '2023-03-26 22:48:36', '系统工具目录', '3', 30, '000030', 1, 'n', '', '127.0.0.1', 10, '0');
INSERT INTO `sys_menu` VALUES ('330d1940a6a64dc7adcfa03fc9f57d25', 'simcard_oper_log', '卡操作日志查询', '76262a407245454492ccb8b100976ae9', 0, '', '', 1, 0, 'F', '0', '0', 'm2mSimcardOperLogQuery', '', '1', '2021-08-02 09:05:32', '1', '2021-08-02 09:05:32', '', '2dc9dcc092134fb18d15cb4966100b39/76262a407245454492ccb8b100976ae9/330d1940a6a64dc7adcfa03fc9f57d25', 20, '000210/000030/000020', 3, 'y', '100', '127.0.0.1', 1, '0');
INSERT INTO `sys_menu` VALUES ('4e3d48641bcf44f18a59a5ba35315f28', 'sysUploadFiles', '上传中心', 'd54485baef564e40a4b40249a937734b', 130, 'sysUploadFiles', 'system/sysuploadfiles/index', 1, 0, 'C', '0', '0', 'system:sysUploadFiles:list', 'upload', '1', '2021-07-29 18:11:06', '1', '2021-08-26 18:04:40', '', 'd54485baef564e40a4b40249a937734b/4e3d48641bcf44f18a59a5ba35315f28', 10, '000040/000010', 2, 'n', '', '127.0.0.1', 4, '1');
INSERT INTO `sys_menu` VALUES ('500', 'sys-operate-log', '操作日志', '108', 1, 'operlog', 'monitor/operlog/OperlogIndex', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-01-30 13:27:43', '1', '2021-04-02 10:06:43', '操作日志菜单', '1/108/500', 10, '000080/000040/000010', 3, 'n', '', '127.0.0.1', 8, '0');
INSERT INTO `sys_menu` VALUES ('501', 'sys-login-log', '登录日志', '108', 2, 'loginLog', 'monitor/loginlog/LoginLogIndex', 1, 0, 'C', '0', '0', 'monitor:loginLog:list', 'loginLog', 'admin', '2021-01-30 13:27:43', '1', '2021-04-02 10:07:05', '登录日志菜单', '1/108/501', 20, '000080/000040/000020', 3, 'n', '', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('51f7d1bf03bc4e9a9154f18e20dabb69', 'case_manage', '病历管理', '0', 0, 'case', NULL, 1, 0, 'M', '0', '0', '', 'hdd', '1', '2023-02-23 21:31:52', '1', '2023-03-26 22:53:34', NULL, '51f7d1bf03bc4e9a9154f18e20dabb69', 11, '000011', 1, 'y', '100', '127.0.0.1', 3, '1');
INSERT INTO `sys_menu` VALUES ('55f1fb9461b1476eb2bec8541b84d22e', 'sysDownloadFilesQuery', '导出记录查询', 'e16303c3ce5e4a03b045a71501cb301e', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysDownloadFiles:query', '#', '1', '2021-07-27 11:28:17', '1', '2021-07-27 11:28:17', '', 'd54485baef564e40a4b40249a937734b/e16303c3ce5e4a03b045a71501cb301e/55f1fb9461b1476eb2bec8541b84d22e', 10, '000040/000020/10', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('56b65ea40f9b4385991383fd766b5c06', 'simcard-query', 'SIM卡查看', '76262a407245454492ccb8b100976ae9', 0, '', '', 1, 0, 'F', '0', '0', 'iot:m2mSimcard:query', '', '1', '2021-08-02 09:04:36', '1', '2021-08-02 09:04:36', '', '2dc9dcc092134fb18d15cb4966100b39/76262a407245454492ccb8b100976ae9/56b65ea40f9b4385991383fd766b5c06', 10, '000210/000030/000010', 3, 'y', '100', '127.0.0.1', 1, '0');
INSERT INTO `sys_menu` VALUES ('58452e1f7b5c4dacbc75a827aa51332b', 'consume', '门诊消费记录', 'b1b627e3906241baad6e6f88cf8a3996', 0, 'expense/consume', NULL, 1, 0, 'M', '0', '0', '', 'red-envelope', '1', '2023-03-26 23:18:19', '1', '2023-03-26 23:20:35', NULL, 'b1b627e3906241baad6e6f88cf8a3996/58452e1f7b5c4dacbc75a827aa51332b', 10, '000012/000010', 2, 'y', '100', '127.0.0.1', 3, '0');
INSERT INTO `sys_menu` VALUES ('5c34c76bd4cc43e299779c2a38345243', 'patient', '患者管理', '5e3a69d199454f0bad992706ac5bfc51', 0, 'list', 'list/customer/List', 1, 0, 'M', '0', '0', '', 'bars', '1', '2023-02-23 21:09:10', '1', '2023-03-26 23:08:49', NULL, '5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243', 10, '000010/000010', 2, 'y', '100', '127.0.0.1', 5, '0');
INSERT INTO `sys_menu` VALUES ('5df559fd7ad541e894ce7af7cee6649a', 'customer_appoint', '预约列表', '5e3a69d199454f0bad992706ac5bfc51', 0, '/customer/appoint', NULL, 1, 0, 'M', '0', '0', NULL, 'paper-clip', '1', '2023-02-27 22:48:32', '1', '2023-02-27 22:48:32', NULL, '5e3a69d199454f0bad992706ac5bfc51/5df559fd7ad541e894ce7af7cee6649a', 20, '000010/000020', 2, 'y', '100', '127.0.0.1', 1, '1');
INSERT INTO `sys_menu` VALUES ('5e3a69d199454f0bad992706ac5bfc51', 'patient_info', '患者管理', '0', 0, 'patient', NULL, 1, 0, 'M', '0', '0', '', 'peoples', '1', '2023-02-23 21:06:56', '1', '2023-03-26 22:58:17', NULL, '5e3a69d199454f0bad992706ac5bfc51', 10, '000010', 1, 'n', '100', '127.0.0.1', 4, '0');
INSERT INTO `sys_menu` VALUES ('62b30b8665cb41f29a248f97439dda69', 'case', '病历管理', '5e3a69d199454f0bad992706ac5bfc51', 0, 'patient/case', NULL, 1, 0, 'M', '0', '0', '', 'hdd', '1', '2023-03-26 22:56:19', '1', '2023-03-26 22:58:45', NULL, '5e3a69d199454f0bad992706ac5bfc51/62b30b8665cb41f29a248f97439dda69', 30, '000010/000030', 2, 'y', '100', '127.0.0.1', 3, '0');
INSERT INTO `sys_menu` VALUES ('652e86f6905d478e924f0641ebe88874', 'simcard-list', '卡列表查询', '76262a407245454492ccb8b100976ae9', 0, '', '', 1, 0, 'F', '0', '0', 'iot:m2mSimcard:list', '', '1', '2021-08-02 13:52:45', '1', '2021-08-02 13:52:45', '', '2dc9dcc092134fb18d15cb4966100b39/76262a407245454492ccb8b100976ae9/652e86f6905d478e924f0641ebe88874', 30, '000210/000030/000030', 3, 'y', '100', '127.0.0.1', 1, '0');
INSERT INTO `sys_menu` VALUES ('67c8d43a175040a5874439d1516308da', 'sys-job-log', '调度日志', '108', 0, 'joblog', 'monitor/job/log', 1, 0, 'C', '0', '0', '', 'bug', '1', '2021-06-18 16:39:15', '1', '2021-06-18 16:42:49', '', '1/108/67c8d43a175040a5874439d1516308da', 30, '000080/000040/000030', 3, 'y', '100', '127.0.0.1', 5, '0');
INSERT INTO `sys_menu` VALUES ('6c5f7c21b8554629824ba898f20fba78', 'avue-ui', '可视化大屏', 'efa0099fd27f47008b4c881f27d93ac3', 0, ' http://localhost:8081/', '', 0, 0, 'C', '0', '0', '', 'monitor', '1', '2021-05-07 09:05:06', '1', '2021-09-04 16:31:35', '', 'efa0099fd27f47008b4c881f27d93ac3/6c5f7c21b8554629824ba898f20fba78', 10, '000060/000010', 2, 'y', '100', '127.0.0.1', 2, '1');
INSERT INTO `sys_menu` VALUES ('759d7e551ed148adbf1152f8fc55fe34', 'sysDownloadFilesExport', '导出记录导出', 'e16303c3ce5e4a03b045a71501cb301e', 50, '#', '', 1, 0, 'F', '0', '0', 'system:sysDownloadFiles:export', '#', '1', '2021-07-27 11:28:17', '1', '2021-07-27 11:28:17', '', 'd54485baef564e40a4b40249a937734b/e16303c3ce5e4a03b045a71501cb301e/759d7e551ed148adbf1152f8fc55fe34', 50, '000040/000020/50', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('79354c0d7f31441094be55e8e4f5fb20', 'appoint', '挂号管理', '0', 0, 'appoint', NULL, 1, 0, 'M', '0', '0', '', 'solution', '1', '2023-02-23 21:43:20', '1', '2023-02-27 22:55:15', NULL, '79354c0d7f31441094be55e8e4f5fb20', 13, '000013', 1, 'y', '100', '127.0.0.1', 4, '1');
INSERT INTO `sys_menu` VALUES ('7a11a673e0bb4249a7917408fca46090', 'drugs_add', '添加药品', '89e8d2bd9d64463da6f3472d6c85319d', 0, 'drug/add', '', 1, 0, 'M', '0', '0', '', 'file-search', '1', '2023-02-23 22:07:48', '1', '2023-02-23 22:08:30', NULL, '89e8d2bd9d64463da6f3472d6c85319d/7a11a673e0bb4249a7917408fca46090', 20, '000015/000020', 2, 'y', '100', '127.0.0.1', 2, '1');
INSERT INTO `sys_menu` VALUES ('7c1a610b0df0426289d4542eb35cd2d7', 'appoint_list', '排班列表', 'c836f130e3214dde8007b1ed1fcf7086', 0, 'appoint/list', NULL, 1, 0, 'M', '0', '0', '', 'job', '1', '2023-02-27 22:54:48', '1', '2023-03-13 23:11:39', NULL, 'c836f130e3214dde8007b1ed1fcf7086/7c1a610b0df0426289d4542eb35cd2d7', 35, '000014/000035', 2, 'y', '100', '127.0.0.1', 5, '1');
INSERT INTO `sys_menu` VALUES ('7e00c054a0d34baea9dbcec52f239d25', 'cache-manager', '缓存列表', '2', 0, 'cacheList', 'monitor/cache/indexCacheList', 1, 0, 'C', '0', '0', '', 'dashboardNew', '1', '2021-08-05 14:51:44', '1', '2021-08-05 14:53:53', NULL, '2/7e00c054a0d34baea9dbcec52f239d25', 55, '000020/000055', 2, 'y', '100', '127.0.0.1', 2, '0');
INSERT INTO `sys_menu` VALUES ('82f9dc418cf149f7a8bad5553c27c725', 'reimburse', '退款记录', 'b1b627e3906241baad6e6f88cf8a3996', 0, 'expense/reimburse', NULL, 1, 0, 'M', '0', '0', '', 'interation', '1', '2023-03-26 23:20:22', '1', '2023-03-26 23:20:46', NULL, 'b1b627e3906241baad6e6f88cf8a3996/82f9dc418cf149f7a8bad5553c27c725', 30, '000012/000030', 2, 'y', '100', '127.0.0.1', 2, '0');
INSERT INTO `sys_menu` VALUES ('841b8c3b06b1496da99c541629a7ec90', 'sysPortletAdd', '门户小页管理新增', '2cd6e3f489bc44cd978b5f7d7772fa00', 20, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortlet:add', '#', '1', '2021-05-10 17:09:43', '1', '2021-05-10 17:09:43', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/2cd6e3f489bc44cd978b5f7d7772fa00/841b8c3b06b1496da99c541629a7ec90', 20, '000080/000050/000030/20', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('89e8d2bd9d64463da6f3472d6c85319d', 'drug', '药品管理', '0', 0, 'drug', NULL, 1, 0, 'M', '0', '0', '', 'medicine-box', '1', '2023-02-23 22:00:56', '1', '2023-03-26 23:15:18', NULL, '89e8d2bd9d64463da6f3472d6c85319d', 15, '000015', 1, 'y', '100', '127.0.0.1', 4, '1');
INSERT INTO `sys_menu` VALUES ('8f00f7f7d3b44aaba1041bc8fdf6c470', 'org-manager', '组织管理', '1', 0, 'org', '', 1, 0, 'M', '0', '0', '', 'appstore', '1', '2021-06-08 09:31:04', '1', '2021-09-04 10:39:56', '', '1/8f00f7f7d3b44aaba1041bc8fdf6c470', 10, '000080/000010', 2, 'n', '100', '127.0.0.1', 4, '1');
INSERT INTO `sys_menu` VALUES ('91c141056bd24d3595f418883a4aed0b', 'sysDownloadFilesRemove', '导出记录删除', 'e16303c3ce5e4a03b045a71501cb301e', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysDownloadFiles:remove', '#', '1', '2021-07-27 11:28:17', '1', '2021-07-27 11:28:17', '', 'd54485baef564e40a4b40249a937734b/e16303c3ce5e4a03b045a71501cb301e/91c141056bd24d3595f418883a4aed0b', 40, '000040/000020/40', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('95329865e4c74ac89867ce4e9e693efd', 'sysUploadFilesRemove', '导入记录删除', '4e3d48641bcf44f18a59a5ba35315f28', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysUploadFiles:remove', '#', '1', '2021-07-29 18:11:06', '1', '2021-07-29 18:11:06', '', 'd54485baef564e40a4b40249a937734b/4e3d48641bcf44f18a59a5ba35315f28/95329865e4c74ac89867ce4e9e693efd', 40, '000040/000010/40', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('96920d5f903e4caaa2b7746351ef8ea9', 'appoint_list', '挂号列表', '79354c0d7f31441094be55e8e4f5fb20', 0, 'appoint/list', 'list/appoint/List', 1, 0, 'M', '0', '0', NULL, 'bars', '1', '2023-02-23 21:44:24', '1', '2023-02-23 21:44:24', NULL, '79354c0d7f31441094be55e8e4f5fb20/96920d5f903e4caaa2b7746351ef8ea9', 10, '000013/000010', 2, 'y', '100', '127.0.0.1', 1, '1');
INSERT INTO `sys_menu` VALUES ('992a9b58c99a427ebfcbb7533f55a2cb', 'sysPortletEdit', '门户小页管理修改', '2cd6e3f489bc44cd978b5f7d7772fa00', 30, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortlet:edit', '#', '1', '2021-05-10 17:09:43', '1', '2021-05-10 17:09:43', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/2cd6e3f489bc44cd978b5f7d7772fa00/992a9b58c99a427ebfcbb7533f55a2cb', 30, '000080/000050/000030/30', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('aa7e8d7ac1544c1f8ebfb6afa16351f9', 'sysPortalConfigAdd', '多栏目门户配置新增', 'e70d56d0bec74c4aba2105854ce5608f', 20, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortalConfig:add', '#', '1', '2021-05-10 18:20:28', '1', '2021-05-10 18:20:28', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/e70d56d0bec74c4aba2105854ce5608f/aa7e8d7ac1544c1f8ebfb6afa16351f9', 20, '000080/000050/000040/20', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('b1b627e3906241baad6e6f88cf8a3996', 'expense', '费用管理', '0', 0, 'expense', NULL, 1, 0, 'M', '0', '0', '', 'pay-circle', '1', '2023-03-26 23:17:38', '1', '2023-03-26 23:18:19', NULL, 'b1b627e3906241baad6e6f88cf8a3996', 12, '000012', 1, 'n', '100', '127.0.0.1', 2, '0');
INSERT INTO `sys_menu` VALUES ('b3418a3b67a9481bb833b8674e4250fc', 'sysDownloadFilesAdd', '导出记录新增', 'e16303c3ce5e4a03b045a71501cb301e', 20, '#', '', 1, 0, 'F', '0', '0', 'system:sysDownloadFiles:add', '#', '1', '2021-07-27 11:28:17', '1', '2021-07-27 11:28:17', '', 'd54485baef564e40a4b40249a937734b/e16303c3ce5e4a03b045a71501cb301e/b3418a3b67a9481bb833b8674e4250fc', 20, '000040/000020/20', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('b61000137c134a7393ded9b69512e1f0', 'sysUploadFilesEdit', '导入记录修改', '4e3d48641bcf44f18a59a5ba35315f28', 30, '#', '', 1, 0, 'F', '0', '0', 'system:sysUploadFiles:edit', '#', '1', '2021-07-29 18:11:06', '1', '2021-07-29 18:11:06', '', 'd54485baef564e40a4b40249a937734b/4e3d48641bcf44f18a59a5ba35315f28/b61000137c134a7393ded9b69512e1f0', 30, '000040/000010/30', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('b882b12ce42645039ed8af35377e4a75', 'sysDownloadFilesEdit', '导出记录修改', 'e16303c3ce5e4a03b045a71501cb301e', 30, '#', '', 1, 0, 'F', '0', '0', 'system:sysDownloadFiles:edit', '#', '1', '2021-07-27 11:28:17', '1', '2021-07-27 11:28:17', '', 'd54485baef564e40a4b40249a937734b/e16303c3ce5e4a03b045a71501cb301e/b882b12ce42645039ed8af35377e4a75', 30, '000040/000020/30', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('bad0110ab2cf471b8858b09a52c184fd', 'sysUploadFilesAdd', '导入记录新增', '4e3d48641bcf44f18a59a5ba35315f28', 20, '#', '', 1, 0, 'F', '0', '0', 'system:sysUploadFiles:add', '#', '1', '2021-07-29 18:11:06', '1', '2021-07-29 18:11:06', '', 'd54485baef564e40a4b40249a937734b/4e3d48641bcf44f18a59a5ba35315f28/bad0110ab2cf471b8858b09a52c184fd', 20, '000040/000010/20', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('c2b336b9b41d47388115c397ca077e2f', 'sysPortalConfigQuery', '多栏目门户配置查询', 'e70d56d0bec74c4aba2105854ce5608f', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortalConfig:query', '#', '1', '2021-05-10 18:20:28', '1', '2021-05-10 18:20:28', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/e70d56d0bec74c4aba2105854ce5608f/c2b336b9b41d47388115c397ca077e2f', 10, '000080/000050/000040/10', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('c56bb14816874497b353573811178fad', 'drug_list', '药品列表', '89e8d2bd9d64463da6f3472d6c85319d', 0, 'drug/list', 'list', 1, 0, 'M', '0', '0', '', 'bars', '1', '2023-02-23 22:07:22', '1', '2023-02-23 22:08:02', NULL, '89e8d2bd9d64463da6f3472d6c85319d/c56bb14816874497b353573811178fad', 10, '000015/000010', 2, 'y', '100', '127.0.0.1', 2, '1');
INSERT INTO `sys_menu` VALUES ('c71b5a0e94c7419da1ddf9180b1c421f', 'schedule', '医生排班', 'c7ce350ebebc4e23af0b23afe487b42d', 0, 'reserve/schedule', NULL, 1, 0, 'M', '0', '0', '', 'date', '1', '2023-03-26 23:13:43', '1', '2023-03-26 23:14:34', NULL, 'c7ce350ebebc4e23af0b23afe487b42d/c71b5a0e94c7419da1ddf9180b1c421f', 20, '000011/000020', 2, 'y', '100', '127.0.0.1', 2, '0');
INSERT INTO `sys_menu` VALUES ('c7ce350ebebc4e23af0b23afe487b42d', 'reserve', '预约管理', '0', 0, 'reserve', NULL, 1, 0, 'M', '0', '0', '', 'time', '1', '2023-03-26 23:07:43', '1', '2023-03-26 23:11:09', NULL, 'c7ce350ebebc4e23af0b23afe487b42d', 11, '000011', 1, 'n', '100', '127.0.0.1', 4, '0');
INSERT INTO `sys_menu` VALUES ('c836f130e3214dde8007b1ed1fcf7086', 'schedule', '排班管理', '0', 0, 'schedule', NULL, 1, 0, 'M', '0', '0', '', 'table', '1', '2023-02-23 22:02:01', '1', '2023-03-26 23:14:25', NULL, 'c836f130e3214dde8007b1ed1fcf7086', 14, '000014', 1, 'y', '100', '127.0.0.1', 6, '1');
INSERT INTO `sys_menu` VALUES ('c9d88c5c57494bfcac8137ffd0aa3121', 'genconfig-template', '模板配置', '3', 0, 'template', 'tool/gen/genconfigtemplate/index', 1, 0, 'C', '0', '0', '', 'picture', '1', '2021-03-07 12:28:59', '1', '2021-04-23 10:43:18', '', '3/c9d88c5c57494bfcac8137ffd0aa3121', 40, '000030/000040', 2, 'y', '100', '127.0.0.1', 6, '1');
INSERT INTO `sys_menu` VALUES ('cf162cbbb62b4cbb80f8c711413af72d', 'recharge', '门诊充值记录', 'b1b627e3906241baad6e6f88cf8a3996', 0, 'expense/recharge', NULL, 1, 0, 'M', '0', '0', '', 'property-safety', '1', '2023-03-26 23:19:43', '1', '2023-03-26 23:20:40', NULL, 'b1b627e3906241baad6e6f88cf8a3996/cf162cbbb62b4cbb80f8c711413af72d', 20, '000012/000020', 2, 'y', '100', '127.0.0.1', 2, '0');
INSERT INTO `sys_menu` VALUES ('d54485baef564e40a4b40249a937734b', 'file-center', '文件中心', '0', 0, 'fileCenter', NULL, 1, 0, 'M', '0', '0', '', 'tool', '1', '2021-08-04 14:15:20', '1', '2021-09-04 10:35:14', NULL, 'd54485baef564e40a4b40249a937734b', 40, '000040', 1, 'n', '100', '127.0.0.1', 4, '1');
INSERT INTO `sys_menu` VALUES ('d87a284bb7e34ae6997e6ab86b7254a5', 'sysUploadFilesExport', '导入记录导出', '4e3d48641bcf44f18a59a5ba35315f28', 50, '#', '', 1, 0, 'F', '0', '0', 'system:sysUploadFiles:export', '#', '1', '2021-07-29 18:11:06', '1', '2021-07-29 18:11:06', '', 'd54485baef564e40a4b40249a937734b/4e3d48641bcf44f18a59a5ba35315f28/d87a284bb7e34ae6997e6ab86b7254a5', 50, '000040/000010/50', 3, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('d8a45047891d4a28a5a3faf96f2b8d97', 'system-app', '系统应用', '1', 0, 'sysApp', '', 1, 0, 'M', '0', '0', '', 'laptop', '1', '2021-06-08 10:05:01', '1', '2021-09-04 10:41:12', '', '1/d8a45047891d4a28a5a3faf96f2b8d97', 50, '000080/000050', 2, 'n', '100', '127.0.0.1', 7, '0');
INSERT INTO `sys_menu` VALUES ('e16303c3ce5e4a03b045a71501cb301e', 'sysDownloadFiles', '下载中心', 'd54485baef564e40a4b40249a937734b', 50, 'sysDownloadFiles', 'system/sysdownloadfiles/index', 1, 0, 'C', '0', '0', 'system:sysDownloadFiles:list', 'download', '1', '2021-07-27 11:28:16', '1', '2021-08-26 18:06:48', '', 'd54485baef564e40a4b40249a937734b/e16303c3ce5e4a03b045a71501cb301e', 20, '000040/000020', 2, 'n', '', '127.0.0.1', 3, '1');
INSERT INTO `sys_menu` VALUES ('e70d56d0bec74c4aba2105854ce5608f', 'sysPortalConfig', '工作台配置', 'd8a45047891d4a28a5a3faf96f2b8d97', 110, 'sysPortalConfig', 'system/sysportalconfig/index', 1, 0, 'C', '0', '0', 'system:sysPortalConfig:list', 'dict', '1', '2021-05-10 18:20:28', '1', '2021-06-18 17:50:07', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/e70d56d0bec74c4aba2105854ce5608f', 40, '000080/000050/000040', 3, 'n', '', '127.0.0.1', 2, '0');
INSERT INTO `sys_menu` VALUES ('eb877bdf384e40cda4cba3cb04231fda', 'case_list', '病历列表', '51f7d1bf03bc4e9a9154f18e20dabb69', 0, 'case/list', 'list/case/List', 1, 0, 'M', '0', '0', NULL, 'bars', '1', '2023-02-23 21:34:32', '1', '2023-02-23 21:34:32', NULL, '51f7d1bf03bc4e9a9154f18e20dabb69/eb877bdf384e40cda4cba3cb04231fda', 10, '000011/000010', 2, 'y', '100', '127.0.0.1', 1, '1');
INSERT INTO `sys_menu` VALUES ('ed0919f0a42e4a07993622037df86a33', 'auth-manager', '权限管理', '1', 0, 'auth', '', 1, 0, 'M', '0', '0', '', 'solution', '1', '2021-06-08 09:49:56', '1', '2021-09-04 10:40:46', '', '1/ed0919f0a42e4a07993622037df86a33', 20, '000080/000020', 2, 'n', '100', '127.0.0.1', 3, '0');
INSERT INTO `sys_menu` VALUES ('efa0099fd27f47008b4c881f27d93ac3', 'system_chart', '可视化大屏', '0', 0, 'vuedata', '', 1, 0, 'M', '1', '0', '', 'dashboardNew', '1', '2021-05-06 18:25:31', '1', '2023-02-23 21:30:05', '', 'efa0099fd27f47008b4c881f27d93ac3', 60, '000060', 1, 'n', '100', '127.0.0.1', 12, '1');
INSERT INTO `sys_menu` VALUES ('f099257fce5b46519b4c05234e3a3db0', 'sysPortletExport', '门户小页管理查询', '2cd6e3f489bc44cd978b5f7d7772fa00', 50, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortlet:export', '#', '1', '2021-05-10 17:09:43', '1', '2021-05-10 17:09:43', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/2cd6e3f489bc44cd978b5f7d7772fa00/f099257fce5b46519b4c05234e3a3db0', 50, '000080/000050/000030/50', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('fa6c148d7bec4c31aa46b7a73d575af3', 'admin-oper', '管理员操作权限', 'ed9087f850894d21bb41044c8b95d415', 0, '', '', 1, 0, 'F', '0', '0', 'company:m2mCompany:admin', '', '1', '2021-07-27 09:08:52', '1', '2021-08-02 09:05:49', '', '51634d802b134c88834cebe9547c599f/ed9087f850894d21bb41044c8b95d415/fa6c148d7bec4c31aa46b7a73d575af3', 60, '000200/000010/000060', 3, 'y', '100', '127.0.0.1', 3, '0');
INSERT INTO `sys_menu` VALUES ('fae936ec1cec465d90fe413cf0508221', 'sysPortalConfigRemove', '多栏目门户配置删除', 'e70d56d0bec74c4aba2105854ce5608f', 10, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortalConfig:remove', '#', '1', '2021-05-10 18:20:28', '1', '2021-05-10 18:20:28', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/e70d56d0bec74c4aba2105854ce5608f/fae936ec1cec465d90fe413cf0508221', 40, '000080/000050/000040/40', 4, 'y', '', '127.0.0.1', 0, '0');
INSERT INTO `sys_menu` VALUES ('fb5cb6a02c33440991542c915ff62f34', 'hospital', '医院管理', '0', 0, 'hospital', NULL, 1, 0, 'M', '0', '0', '', 'appstore', '1', '2023-02-23 21:16:04', '1', '2023-03-26 23:16:24', NULL, 'fb5cb6a02c33440991542c915ff62f34', 15, '000015', 1, 'n', '100', '127.0.0.1', 9, '0');
INSERT INTO `sys_menu` VALUES ('fbeaa5ca1cd54c6fbcde247f0be6250e', 'sysPortalConfigExport', '多栏目门户配置查询', 'e70d56d0bec74c4aba2105854ce5608f', 50, '#', '', 1, 0, 'F', '0', '0', 'system:sysPortalConfig:export', '#', '1', '2021-05-10 18:20:28', '1', '2021-05-10 18:20:28', '', '1/d8a45047891d4a28a5a3faf96f2b8d97/e70d56d0bec74c4aba2105854ce5608f/fbeaa5ca1cd54c6fbcde247f0be6250e', 50, '000080/000050/000040/50', 4, 'y', '', '127.0.0.1', 0, '0');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `notice_content_html` longblob NULL COMMENT '公告内容HTML',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_notice_user_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_user_read`;
CREATE TABLE `sys_notice_user_read`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `notice_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知公告ID',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统用户id',
  `is_read` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已读（0未读，1已读），仅在制定通知接收人时使用',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index2`(`notice_id`, `user_id`, `is_read`, `status`, `del_flag`) USING BTREE,
  INDEX `index1`(`notice_id`, `user_id`, `is_read`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告用户阅读表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice_user_read
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回结果集',
  `log_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志变更内容',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `oper_id` bigint(20) NULL DEFAULT NULL COMMENT '任务ID',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `form_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单数据ID',
  `take_up_time` int(11) NULL DEFAULT NULL COMMENT '耗时',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_formId`(`form_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('01d1e1211ec74d5baee92bad5f32a409', '患者管理', 2, 'com.aidex.web.controller.hospital.PatientController.updateInfo()', 'PUT', 1, 'admin', NULL, '/hospital/patient/10', '127.0.0.1', '内网IP', '10 {\"avatarUrl\":\"string\",\"gmtCreate\":\"2023-03-26 15:45:28.022\",\"gmtModified\":\"2023-03-26 15:45:28.022\",\"id\":10,\"name\":\"string\",\"phone\":\"string\"}', '{\"code\":200,\"message\":\"操作成功\"}', NULL, 0, NULL, '2023-03-26 07:51:55', NULL, NULL, '0', NULL, 43);
INSERT INTO `sys_oper_log` VALUES ('02f05afa07df4d1ba1f58a2f00118664', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者列表\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:24', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('0380c29c78244c5f9b32b9d5d73a0749', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedulex\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:43', NULL, NULL, '0', NULL, 12);
INSERT INTO `sys_oper_log` VALUES ('03b04b61f8204a24ae505c25db589bcd', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"appoint\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:06:17', NULL, NULL, '0', NULL, 22);
INSERT INTO `sys_oper_log` VALUES ('060227decb6f4bf69ed698d68bbe6d11', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"recharge\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:15', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('063c91242042442caadbb30c8ecf28cd', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"recharge\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:14', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('0699521a520e4134b68b4a7e91ddfdac', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管理\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:33', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('08707938f7034c5e91aed5666ea88655', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"card\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:45', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('08adc61e1adb48f4b722533de6f7d174', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reimburse\",\"id\":\"82f9dc418cf149f7a8bad5553c27c725\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:45', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('093b96603f624d4daf0259c6edad241b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"hospital\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:54', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('0a24603153724b34b24947b70892534d', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生排班\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:14:33', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('0a35414d676e4ac4ae37b2b2e5763e21', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:56:19.27\",\"delFlag\":\"0\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"case\",\"menuName\":\"病历管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/62b30b8665cb41f29a248f97439dda69\",\"path\":\"case\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000010/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:56:19.27\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:56:19.27\",\"delFlag\":\"0\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"case\",\"menuName\":\"病历管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/62b30b8665cb41f29a248f97439dda69\",\"path\":\"case\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000010/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:56:19.27\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:56:19', NULL, NULL, '0', NULL, 35);
INSERT INTO `sys_oper_log` VALUES ('0b66afafbd3d460686cf02c8f983963c', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"doctor\",\"id\":\"100\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:05:08', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('0b7cd939535e469fbccb8753506a68f4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_info\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:31', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('0bef53777abc4c13a6c3bcd4d65deefe', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者列\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:46', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('0d37619050474de8873e00c6a0978a3f', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"system_tool\",\"id\":\"3\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:48:31', NULL, NULL, '0', NULL, 22);
INSERT INTO `sys_oper_log` VALUES ('0d3e6b66f68a449e94f6925d19bbb0c8', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"yiy\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:39', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('0e68b3bedf6c43e697c3216b5ee6dc76', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:49', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('0faca7d343674f24b70c9072d7a42dc6', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/7c1a610b0df0426289d4542eb35cd2d7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 15:14:25', NULL, NULL, '0', NULL, 66);
INSERT INTO `sys_oper_log` VALUES ('1092c4aabeb94ba6b376a0f65677ccd9', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:17:56', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('119911500b5c4c779c1b63193e9f75a4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历挂不了\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:15', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('12d7442b945a4ea6aa28ecb32d4cd588', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:06', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('133f331388bd404b955ca6af29e1e6e0', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:42', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('1360cab59ceb4cdb8cff8361ac4b0b27', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生管理\",\"id\":\"100\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:04:09', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('13789f448eec4515a3634f611b1180c1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedule\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"2\"}}', NULL, 0, NULL, '2023-03-26 15:13:26', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('13e45fea3a6748c7a1a33f3d1e76412d', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"system_tool\",\"id\":\"3\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:48:35', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('144148f8646b4320ae1f4704aa3f6d12', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊消费记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:17:58', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('14c7dafcb1264ed7b4716d7fec4d3b60', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"退款记录\",\"id\":\"82f9dc418cf149f7a8bad5553c27c725\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:45', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('14d35e6df5534637811504a3fce6210b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"退款记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:51', NULL, NULL, '0', NULL, 26);
INSERT INTO `sys_oper_log` VALUES ('17352fc5645d4484b8c502dc93a49925', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:10:42\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:10:42\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:11:26', NULL, NULL, '0', NULL, 33);
INSERT INTO `sys_oper_log` VALUES ('174506258c3743febf33f3832d5c68c9', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者列表\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:00', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('17be66467cfd4cd4834de5517f96c8c4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历挂\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:15', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('180cc906e62e471c9053e89f68b53519', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"consume\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:18:08', NULL, NULL, '0', NULL, 21);
INSERT INTO `sys_oper_log` VALUES ('192371bb79274cab833e527a63981788', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:49\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"card\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:53:51\",\"version\":2,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:49\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"card\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:53:51\",\"version\":2,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:55:58', NULL, NULL, '0', NULL, 44);
INSERT INTO `sys_oper_log` VALUES ('19535c3f3ea24ee385e3678608a301ea', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管理\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:48', NULL, NULL, '0', NULL, 25);
INSERT INTO `sys_oper_log` VALUES ('1dfed135f20142b48f4b58e7c3c8e982', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:12:34', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('1ec558994e504f598ace76f5274bcaf2', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"y\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:40', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('1f63cd8e56c34b2ca3a31a965eb2e27d', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:08', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('1fed15522ace404d9aa8519000a345af', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医院管理\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:23', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('2191be86dc644020b29ca99777aca3dd', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"card\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:33', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('22be1876d01144dfb41963a5de9dde7a', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管理\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:55:58', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('2568517efbcd4066aec159280a534dab', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"费用管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:55', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('26c75aabd1d94e529e655ce782ae597d', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/b1b627e3906241baad6e6f88cf8a3996', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":30}', NULL, 0, NULL, '2023-03-26 15:19:46', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('26d988c765374fce862badd7b65e51d2', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve/register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:54', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('26e1e5acef7f4746ab3345dad3c92bc5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:45', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('290bb062f50e429198d08074563ffb6c', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:42', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('29601476c7d2497cb7311e88dae78f9a', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历管理\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:17', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('2c8a99e9b5484ceb85e69ef622da1f98', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:55:55', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('2e18ce83cc7d4acaa8fc1c58fab4675b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"doctor\",\"id\":\"100\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:04:09', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('2e4e7326ed254d159ca29c6b091f5a00', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:18:19\",\"delFlag\":\"0\",\"icon\":\"red-envelope\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"consume\",\"menuName\":\"门诊消费记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/58452e1f7b5c4dacbc75a827aa51332b\",\"path\":\"expense/consume\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000012/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:18:55\",\"version\":2,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:18:19\",\"delFlag\":\"0\",\"icon\":\"red-envelope\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"consume\",\"menuName\":\"门诊消费记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/58452e1f7b5c4dacbc75a827aa51332b\",\"path\":\"expense/consume\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000012/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:18:55\",\"version\":2,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:20:34', NULL, NULL, '0', NULL, 37);
INSERT INTO `sys_oper_log` VALUES ('2f64e320021a41018f1b38cfdb5ad820', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/SysDeptIndex\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"cluster\",\"id\":\"103\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"dept-manager\",\"menuName\":\"科室管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/103\",\"path\":\"dept\",\"perms\":\"system:dept:list\",\"recordLog\":true,\"remark\":\"部门管理菜单\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":20,\"treeSorts\":\"000080/000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-27 23:10:02\",\"version\":14,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"system/dept/SysDeptIndex\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"cluster\",\"id\":\"103\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"dept-manager\",\"menuName\":\"科室管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/103\",\"path\":\"dept\",\"perms\":\"system:dept:list\",\"recordLog\":true,\"remark\":\"部门管理菜单\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":20,\"treeSorts\":\"000080/000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-27 23:10:02\",\"version\":14,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:01:23', NULL, NULL, '0', NULL, 38);
INSERT INTO `sys_oper_log` VALUES ('31ce8d0027b64b78b69b9e28dd2c30aa', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡列\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:55:55', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('32f1dbca9d4f42bd9429fae38c3fe09d', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserveregister\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:52', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('33067893e41048d2bb184f3e2eee51c1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"系统工具\",\"id\":\"3\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:48:32', NULL, NULL, '0', NULL, 23);
INSERT INTO `sys_oper_log` VALUES ('334c92cbd642488494a049a84901d168', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:58:25\",\"version\":3,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:58:25\",\"version\":3,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:59:13', NULL, NULL, '0', NULL, 44);
INSERT INTO `sys_oper_log` VALUES ('33a4d858ba5a41f5be36b32a499f9bd1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生管理\",\"id\":\"100\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:01:04', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('33a8492cfb9c47d38726300f33f4f17c', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_i\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:07', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('344eb0c2047c46f3bd4bde84db71ebc1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"hospital\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:23', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('36d81f2a5cad4a438ef97c4309189665', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊充值记录\",\"id\":\"cf162cbbb62b4cbb80f8c711413af72d\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:39', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('38eac1b545324f4bb47c6463063f5c4f', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"退款记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:21', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('3957a70e9c314432a01cee5b9027593b', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:41.694\",\"delFlag\":\"0\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:10:41.694\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:41.694\",\"delFlag\":\"0\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:10:41.694\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:10:41', NULL, NULL, '0', NULL, 51);
INSERT INTO `sys_oper_log` VALUES ('39fcb5fdaba74cddb1d0dcc85455c114', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:19:43.467\",\"delFlag\":\"0\",\"icon\":\"property-safety\",\"id\":\"cf162cbbb62b4cbb80f8c711413af72d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"recharge\",\"menuName\":\"门诊充值记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/cf162cbbb62b4cbb80f8c711413af72d\",\"path\":\"/recharge\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000012/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:19:43.467\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:19:43.467\",\"delFlag\":\"0\",\"icon\":\"property-safety\",\"id\":\"cf162cbbb62b4cbb80f8c711413af72d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"recharge\",\"menuName\":\"门诊充值记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/cf162cbbb62b4cbb80f8c711413af72d\",\"path\":\"/recharge\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000012/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:19:43.467\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:19:43', NULL, NULL, '0', NULL, 32);
INSERT INTO `sys_oper_log` VALUES ('3ad06342b2ef4d7ba7ab4dcee5d9fd01', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约管理\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:40', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('3b0c734a33be48dfaaf8e98043aebae1', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/0', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":90}', NULL, 0, NULL, '2023-03-26 15:06:58', NULL, NULL, '0', NULL, 28);
INSERT INTO `sys_oper_log` VALUES ('3c0cf1167e5d45e1805ba42dc416061f', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/c56bb14816874497b353573811178fad', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 15:15:18', NULL, NULL, '0', NULL, 71);
INSERT INTO `sys_oper_log` VALUES ('3cf22674936048629594b1cdab925ad1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生管理\",\"id\":\"100\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:00:49', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('3dce55b81f02457193c7eedde87c5a8f', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约挂号\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:38', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('3e00166f7abe41fdae33b75de09a4317', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"card\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:48', NULL, NULL, '0', NULL, 21);
INSERT INTO `sys_oper_log` VALUES ('3e2d36f1aa11462ca9d8cb33d80625bd', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"退款记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:50', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('3edeb470d61e46c2b898189300904254', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"y\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:39', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('3ef48670196e4e0283e0155e99468ca5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"jiuzhenk\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:49:57', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('401697494fca41cdb00e90fed2973a27', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊消费记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:18:18', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('43173f1ffea645d180952d425a611dde', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医院管理\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:52', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('465b4b7c313a4cc49c5fb5c8cc5d24a7', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医院管理\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:09:25', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('47db57af3bc2497faece54d64f797b3b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:01', NULL, NULL, '0', NULL, 27);
INSERT INTO `sys_oper_log` VALUES ('48c2261fadfa498b815c60ce0ac90b89', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊消费记录\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:34', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('48c599bcc26f4ee4ba5c12d0a596e805', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"3\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"system_tool\",\"menuName\":\"系统工具\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"3\",\"path\":\"tool\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"系统工具目录\",\"status\":\"1\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":30,\"treeSorts\":\"000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2021-09-04 10:34:25\",\"version\":9,\"visible\":\"1\"}', NULL, NULL, 1, '该菜单包含未停用的子菜单，不允许标记为停用', '2023-03-26 14:48:32', NULL, NULL, '0', NULL, 0);
INSERT INTO `sys_oper_log` VALUES ('4ba64a3ab95b4cb486d2f05fa5b03ccd', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/51f7d1bf03bc4e9a9154f18e20dabb69', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 14:57:40', NULL, NULL, '0', NULL, 64);
INSERT INTO `sys_oper_log` VALUES ('4c91c1b945954a03b8e2b888f4a60554', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"card\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:43', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('4ef768d0d4dd4c3b8887bd3f4bd40aab', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡列表\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:46', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('51ca4dd2eb994a3d948e7af87d6715e4', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"3\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"system_tool\",\"menuName\":\"系统工具\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"3\",\"path\":\"tool\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"系统工具目录\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":30,\"treeSorts\":\"000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2021-09-04 10:34:25\",\"version\":9,\"visible\":\"1\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"3\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"system_tool\",\"menuName\":\"系统工具\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"3\",\"path\":\"tool\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"系统工具目录\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":30,\"treeSorts\":\"000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2021-09-04 10:34:25\",\"version\":9,\"visible\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:48:36', NULL, NULL, '0', NULL, 62);
INSERT INTO `sys_oper_log` VALUES ('53e1b65dec7b4527a3e28dbb5201770e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历管理\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:19', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('5429964137ae4b19b713d9e94b09027b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡列表\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:50', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('55a30acd43204d1090f76ee406a19598', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:38', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('56fdc1fc46f3477a917208ad93c2cb3e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"case\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:05', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('5751d7d6fdfd409f8053c331be9464f3', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/0', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":90}', NULL, 0, NULL, '2023-03-26 15:06:06', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('5829cf601a8e4b92bd64a4fb51a25055', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者管理\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:16', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('583e865c82c24be0aa8816d2786b4cb5', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/0', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":90}', NULL, 0, NULL, '2023-03-26 15:16:13', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('586b29adf7fc4815bb0029236a38c244', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"case\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:07', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('5907fa9243c54ea29414502528c3c9ba', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医院管理\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:54', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('5960e77aef704cfd938cbd7701a056ad', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:48.702\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"card\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:50:48.702\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:48.702\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"card\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:50:48.702\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:50:48', NULL, NULL, '0', NULL, 32);
INSERT INTO `sys_oper_log` VALUES ('59741e60ee964eeea3baa036fe4ca4ae', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"case\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:19', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('5a046c960fb44880ae48fbb4d0caebd4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:57:57', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('5ca1ba0106fe46cf806ab7a2437fa0ac', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:25', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('5ff42a76f0a241448991b13d002e7eb3', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"费用管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:17:37', NULL, NULL, '0', NULL, 12);
INSERT INTO `sys_oper_log` VALUES ('60d67a63fda348f4bc7e0efb1dfe43f7', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:07:43\",\"delFlag\":\"0\",\"icon\":\"time\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve\",\"menuName\":\"预约管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"path\":\"reserve\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":11,\"treeSorts\":\"000011\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:07:43\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:07:43\",\"delFlag\":\"0\",\"icon\":\"time\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve\",\"menuName\":\"预约管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"path\":\"reserve\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":11,\"treeSorts\":\"000011\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:07:43\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:08:40', NULL, NULL, '0', NULL, 36);
INSERT INTO `sys_oper_log` VALUES ('60dde83900b64782a161b0816d054865', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_inf\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:08', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('6394299af80545df91385f43d3c92fdd', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"hospital\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":15,\"treeSorts\":\"000015\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:09:25\",\"version\":8,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"hospital\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":15,\"treeSorts\":\"000015\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:09:25\",\"version\":8,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:16:23', NULL, NULL, '0', NULL, 40);
INSERT INTO `sys_oper_log` VALUES ('6448e89d96f84fbb96e078c7b030c735', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:49\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"card\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:50:49\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:49\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"card\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:50:49\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:53:51', NULL, NULL, '0', NULL, 42);
INSERT INTO `sys_oper_log` VALUES ('644c22fc1f404fa595038dad639c31c8', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊充值记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:25', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('6459a327882c44d480aff56c0ec3565e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:20', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('650b61326a12479397c0b9471553648d', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/b1b627e3906241baad6e6f88cf8a3996', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":20}', NULL, 0, NULL, '2023-03-26 15:18:57', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('653ab238b4ab45cf81a009e8a877214d', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"reserve/register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:11:55\",\"version\":4,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"reserve/register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:11:55\",\"version\":4,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:12:39', NULL, NULL, '0', NULL, 35);
INSERT INTO `sys_oper_log` VALUES ('65be91f3a8bf4c97bb186839a0677e36', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:12:39', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('664cce9b17044b3390dd1f1e067ef229', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:13', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('66c94005944d47febd63a5ffe38c25c9', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:59:14\",\"version\":4,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:59:14\",\"version\":4,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:08:48', NULL, NULL, '0', NULL, 35);
INSERT INTO `sys_oper_log` VALUES ('687446a16c4f4bda98bb9f12b2b81fec', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"expense\",\"id\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:27', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('6890d8646e2945ad8aea5f300db5ee03', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:10:41', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('6891f32201724e36b90315d8e336825d', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡列\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:47', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('68ebf6299cc74d63afac092403ca0bd3', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医院\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:41', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('6a734afdf71346c98c5069de0a69f768', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约挂号\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:10:41', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('6c8f2d6605f34350bdeb6e61485640b1', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/5df559fd7ad541e894ce7af7cee6649a', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 14:49:14', NULL, NULL, '0', NULL, 70);
INSERT INTO `sys_oper_log` VALUES ('6d0647cf497346db9393cfe40c748b44', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:48', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('6f3a0ddbd0014c34aa8f54c7239f315c', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/eb877bdf384e40cda4cba3cb04231fda', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 14:53:34', NULL, NULL, '0', NULL, 78);
INSERT INTO `sys_oper_log` VALUES ('7152263a75674ed59b45cabfc337ef4b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:57:51', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('72672a78f13c415c89a38e39c1f41fdf', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管理\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:34', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('72bffa6bd79344d292d9b006c20e9251', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:11:26\",\"version\":2,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:11:26\",\"version\":2,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:11:38', NULL, NULL, '0', NULL, 41);
INSERT INTO `sys_oper_log` VALUES ('73d1e6d4c8e6414b8e6359b24e6b2b16', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"expense\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:17:37', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('764cb994161843238c9b7741f707249b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:45', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('7682df264f2a4d2696baad79602834fa', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"doctor\",\"id\":\"100\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:00:56', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('778e432f695646ed9e9f36f4dce558a9', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"recharge\",\"id\":\"cf162cbbb62b4cbb80f8c711413af72d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:39', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('77ca86ea43fb46d19ffc1e7ba1d0077e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:04', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('77e4a9e1b9e9457992a2f7fa017ebb42', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"card\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:55:58', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('790569c20c8d4747be79b81c1dcd2c05', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/b1b627e3906241baad6e6f88cf8a3996', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":20}', NULL, 0, NULL, '2023-03-26 15:18:22', NULL, NULL, '0', NULL, 21);
INSERT INTO `sys_oper_log` VALUES ('799636090aac41d6a965d9223a05cbf8', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"3\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"system_tool\",\"menuName\":\"系统工具\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"3\",\"path\":\"tool\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"系统工具目录\",\"status\":\"1\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":30,\"treeSorts\":\"000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2021-09-04 10:34:25\",\"version\":9,\"visible\":\"1\"}', NULL, NULL, 1, '该菜单包含未停用的子菜单，不允许标记为停用', '2023-03-26 14:48:33', NULL, NULL, '0', NULL, 0);
INSERT INTO `sys_oper_log` VALUES ('7f3f56a5133d44b99c164e95f2686725', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:05', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('7f6636956d9345029bc42823b706afb3', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/7a11a673e0bb4249a7917408fca46090', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 15:15:15', NULL, NULL, '0', NULL, 54);
INSERT INTO `sys_oper_log` VALUES ('801bb1fdd28744998fe7e0a84983c7e5', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:18:19.049\",\"delFlag\":\"0\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"consume\",\"menuName\":\"门诊消费记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/58452e1f7b5c4dacbc75a827aa51332b\",\"path\":\"/consume\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000012/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:18:19.049\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:18:19.049\",\"delFlag\":\"0\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"consume\",\"menuName\":\"门诊消费记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/58452e1f7b5c4dacbc75a827aa51332b\",\"path\":\"/consume\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000012/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:18:19.049\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:18:19', NULL, NULL, '0', NULL, 44);
INSERT INTO `sys_oper_log` VALUES ('8057080bb1134aa88e800be43297cefa', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:19:43\",\"delFlag\":\"0\",\"icon\":\"property-safety\",\"id\":\"cf162cbbb62b4cbb80f8c711413af72d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"recharge\",\"menuName\":\"门诊充值记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/cf162cbbb62b4cbb80f8c711413af72d\",\"path\":\"expense/recharge\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000012/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:19:43\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:19:43\",\"delFlag\":\"0\",\"icon\":\"property-safety\",\"id\":\"cf162cbbb62b4cbb80f8c711413af72d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"recharge\",\"menuName\":\"门诊充值记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/cf162cbbb62b4cbb80f8c711413af72d\",\"path\":\"expense/recharge\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000012/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:19:43\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:20:40', NULL, NULL, '0', NULL, 34);
INSERT INTO `sys_oper_log` VALUES ('80919e8687aa4bb6ae750347edaa5d61', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"system_tool\",\"id\":\"3\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:48:32', NULL, NULL, '0', NULL, 21);
INSERT INTO `sys_oper_log` VALUES ('80c8e2dfe70945b4a3c860f7ee9ef0f7', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:03', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('80e82cec8559401da1c5b9cbe30adebe', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"hospital\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:50', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('81d80aab5e4a454b8c568895513fe753', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生排班\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:29', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('82f63c91702f4a32a7765decb1fb1564', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedule\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"2\"}}', NULL, 0, NULL, '2023-03-26 15:13:37', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('831c2664496f4d39b3595475eb3a734c', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reimburse\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:21', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('840ba9e6d99e4891b85bac52c42f93c0', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"doctor\",\"id\":\"100\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:00:53', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('85e88067825e40eeb4cdbcb6d00fdf67', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生排班\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:28', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('88849f7d558b4d41ab98203bf553ef55', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约管理\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:08', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('891f93fdf83a41f49ebb12c134721d6a', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管理\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:55:56', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('8924b5c73a034802b89558cde3a9504e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"doctor\",\"id\":\"100\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:01:04', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('89f4cbf8aa54404c9c1b0cd87031ed01', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:06:09', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('8ab22ae469684c74950f3686f41fa206', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve/register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:53', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('8c8536b8aaa949279e7a3b70f4529d89', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedule\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:14:33', NULL, NULL, '0', NULL, 20);
INSERT INTO `sys_oper_log` VALUES ('8c8a676daa3143859aa74b3b4dcbcf7c', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"yi\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:39', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('8ce19d7ac0c24bd49793a298dfab415d', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"科室管理\",\"id\":\"103\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:01:23', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('8f1e0150680f4d2b987781489332de30', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约挂号\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:54', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('9146033e1da8418abd8faeaa45eea7e7', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:10:41', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('919e6b1527b94efe806632bf6172af4e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"hospital\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:47', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('92d7ce3d14674a49a1ba5d9533e8a0a7', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"recharge\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:42', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('93ec6eebaf3549a2882da4b2134ca955', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊充值记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:43', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('94145c5c13d04a94b5f7cdc9b65ca09e', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/0', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":90}', NULL, 0, NULL, '2023-03-26 15:05:45', NULL, NULL, '0', NULL, 52);
INSERT INTO `sys_oper_log` VALUES ('95871a412cf9457e8b063e1955965646', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:20:22\",\"delFlag\":\"0\",\"icon\":\"interation\",\"id\":\"82f9dc418cf149f7a8bad5553c27c725\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reimburse\",\"menuName\":\"退款记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/82f9dc418cf149f7a8bad5553c27c725\",\"path\":\"expense/reimburse\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000012/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:20:22\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:20:22\",\"delFlag\":\"0\",\"icon\":\"interation\",\"id\":\"82f9dc418cf149f7a8bad5553c27c725\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reimburse\",\"menuName\":\"退款记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/82f9dc418cf149f7a8bad5553c27c725\",\"path\":\"expense/reimburse\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000012/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:20:22\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:20:46', NULL, NULL, '0', NULL, 36);
INSERT INTO `sys_oper_log` VALUES ('96837b04837e4a1396794f47ec9e7df7', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历管理\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:18', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('96a23cf89d134d56aa4060822625c20a', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊消费\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:17:57', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('97803ea850fd43439c560a534285154a', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡列表\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:50', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('98d73e5aecb34835bea11e06f630eeea', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:40', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('9946f557f57c4aae9eb46edb19e5fe94', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:13:43.183\",\"delFlag\":\"0\",\"icon\":\"date\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"schedulex\",\"menuName\":\"医生排班\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/c71b5a0e94c7419da1ddf9180b1c421f\",\"path\":\"reserve/schedule\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000011/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:13:43.183\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:13:43.183\",\"delFlag\":\"0\",\"icon\":\"date\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"schedulex\",\"menuName\":\"医生排班\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/c71b5a0e94c7419da1ddf9180b1c421f\",\"path\":\"reserve/schedule\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000011/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:13:43.183\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:13:43', NULL, NULL, '0', NULL, 27);
INSERT INTO `sys_oper_log` VALUES ('99e7779ccb324745ab08f7fdd93148fc', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"2\"}}', NULL, 0, NULL, '2023-03-26 14:58:04', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('99fb06e09932486c86077c798dad3357', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊充值\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:21', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('9d1e43bb0ca44dfba7a0162dc1fae1bc', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:06:56\",\"delFlag\":\"0\",\"icon\":\"peoples\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient_info\",\"menuName\":\"患者管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51\",\"path\":\"patient\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":10,\"treeSorts\":\"000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:09:10\",\"version\":3,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:06:56\",\"delFlag\":\"0\",\"icon\":\"peoples\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient_info\",\"menuName\":\"患者管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51\",\"path\":\"patient\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":10,\"treeSorts\":\"000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:09:10\",\"version\":3,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:58:16', NULL, NULL, '0', NULL, 50);
INSERT INTO `sys_oper_log` VALUES ('9e8efcd64e364a9babaf7500b7e603de', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedule\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"2\"}}', NULL, 0, NULL, '2023-03-26 15:13:25', NULL, NULL, '0', NULL, 39);
INSERT INTO `sys_oper_log` VALUES ('a107e2d6dd104a13acfc39c7af1201b4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"appoint\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:06:10', NULL, NULL, '0', NULL, 12);
INSERT INTO `sys_oper_log` VALUES ('a1de4db62fc9450e83d9fddc250985ba', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊充值记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:41', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('a37a306854794a04999e35fcb000c3ee', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patiet\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:57:50', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('a3cee690125f4f35b69fc1e2900be8d4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者管理\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:48', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('a3f2498315ce4155b796e405d319d622', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:06:08', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('a4a314cfae6241f2b199f6d1622d4dc9', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"case\",\"id\":\"62b30b8665cb41f29a248f97439dda69\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:44', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('a50bf3a8f7be4776aaf447bf867e18e5', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/c7ce350ebebc4e23af0b23afe487b42d', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":10}', NULL, 0, NULL, '2023-03-26 15:09:53', NULL, NULL, '0', NULL, 30);
INSERT INTO `sys_oper_log` VALUES ('a64c8a4f90f340ea842d079e82ae760c', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡列表\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:48', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('a66feb0be3f646ff89f1cb7fd9192ff0', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:12:33', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('a6a7ec6d5f864b799f1c5a47994195a1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:06:48', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('a7cd327a57094a97be777ef7ea80a862', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/SysUserIndex\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"team\",\"id\":\"100\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"doctor\",\"menuName\":\"医生管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/100\",\"path\":\"doctor\",\"perms\":\"system:user:list\'\",\"recordLog\":true,\"remark\":\"主要维护平台相关用户信息\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":10,\"treeSorts\":\"000080/000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:04:10\",\"version\":21,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"system/user/SysUserIndex\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"team\",\"id\":\"100\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"doctor\",\"menuName\":\"医生管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/100\",\"path\":\"doctor\",\"perms\":\"system:user:list\'\",\"recordLog\":true,\"remark\":\"主要维护平台相关用户信息\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":10,\"treeSorts\":\"000080/000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:04:10\",\"version\":21,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:05:09', NULL, NULL, '0', NULL, 35);
INSERT INTO `sys_oper_log` VALUES ('a81cfe532ce24ec59c6c9b39aa1f8b09', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"报表看板\",\"id\":\"2004\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:02', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('a84c74cb621948a289e587b353b99eb5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:12:25', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('a9f89dd828224bc2ac3454c845bd8687', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:18:19\",\"delFlag\":\"0\",\"icon\":\"red-envelope\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"consume\",\"menuName\":\"门诊消费记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/58452e1f7b5c4dacbc75a827aa51332b\",\"path\":\"/consume\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000012/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:18:19\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:18:19\",\"delFlag\":\"0\",\"icon\":\"red-envelope\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"consume\",\"menuName\":\"门诊消费记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/58452e1f7b5c4dacbc75a827aa51332b\",\"path\":\"/consume\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000012/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:18:19\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:18:55', NULL, NULL, '0', NULL, 55);
INSERT INTO `sys_oper_log` VALUES ('a9f9fce8b85b4badb91cebabf19f81fd', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:27', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('aa4930a2f5884eba8617967498445be0', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"jiuzhenka\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:49:58', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('aaf8845790aa4322a00fa44bddcaca4f', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"consume\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:18:54', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('ab5b9af408fb4db1acd1fd49cd5e988f', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"系统工具\",\"id\":\"3\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:48:35', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('abbdfb5e4c3044d284f61b89d6c62799', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约挂号\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:12:39', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('aefd36f727e6437b8414a13c30a7a80e', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/b1b627e3906241baad6e6f88cf8a3996', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":10}', NULL, 0, NULL, '2023-03-26 15:17:40', NULL, NULL, '0', NULL, 36);
INSERT INTO `sys_oper_log` VALUES ('af83d0b549a34837bbaa01110cbbb951', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约挂号\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:10:00', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('b002dc66f2fb4a879b34593555ea6fd7', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历挂不\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:15', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('b016b007de8445c99e9a22491349477e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_in\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:07', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('b1577e83ff6a4ed4b3f33dc3416a94cb', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve/register\",\"id\":\"0cde805b2f754de09dd8318c151113db\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:54', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('b2b11c74937b4541bff9a60761b196ed', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生排班\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:37', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('b2ccaa4425164b4aae16a2439f1227f1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedule\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:14:33', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('b2cea058cc9f469dba225a926a489f58', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"consume\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:34', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('b3daa8890e68465c83037ea529b35156', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:06:49', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('b43425902f3d4efb9856ca9cbdfc596b', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:56:19\",\"delFlag\":\"0\",\"icon\":\"hdd\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"case\",\"menuName\":\"病历管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/62b30b8665cb41f29a248f97439dda69\",\"path\":\"patient/case\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000010/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:57:36\",\"version\":2,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:56:19\",\"delFlag\":\"0\",\"icon\":\"hdd\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"case\",\"menuName\":\"病历管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/62b30b8665cb41f29a248f97439dda69\",\"path\":\"patient/case\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000010/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:57:36\",\"version\":2,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:58:45', NULL, NULL, '0', NULL, 39);
INSERT INTO `sys_oper_log` VALUES ('b49f13f8d79a480ca36ad52164716d19', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:20:22.139\",\"delFlag\":\"0\",\"icon\":\"interation\",\"id\":\"82f9dc418cf149f7a8bad5553c27c725\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reimburse\",\"menuName\":\"退款记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/82f9dc418cf149f7a8bad5553c27c725\",\"path\":\"/reimburse\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000012/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:20:22.139\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:20:22.139\",\"delFlag\":\"0\",\"icon\":\"interation\",\"id\":\"82f9dc418cf149f7a8bad5553c27c725\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reimburse\",\"menuName\":\"退款记录\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996/82f9dc418cf149f7a8bad5553c27c725\",\"path\":\"/reimburse\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000012/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:20:22.139\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:20:22', NULL, NULL, '0', NULL, 23);
INSERT INTO `sys_oper_log` VALUES ('b7511909aef44c28b5c9c3f6bf3419d9', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"yi\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:39', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('b7da8a95958040388944dd404fbe06c3', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生管理\",\"id\":\"100\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:00:47', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('b96d869736e146ecb390f1527a8dc9c3', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:15', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('bb4ae94e0321416e9517a336b776fea5', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/5e3a69d199454f0bad992706ac5bfc51', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":20}', NULL, 0, NULL, '2023-03-26 14:49:48', NULL, NULL, '0', NULL, 26);
INSERT INTO `sys_oper_log` VALUES ('bbbfad57a98a4210a261b5163a24044c', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"demo/chart/echartDashBoard\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-02-01 11:15:22\",\"delFlag\":\"0\",\"icon\":\"monitor\",\"id\":\"2004\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"report_forms\",\"menuName\":\"报表看板\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"2004\",\"path\":\"echart\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"\",\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":9,\"treeSorts\":\"000009\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:54:05\",\"version\":12,\"visible\":\"1\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"demo/chart/echartDashBoard\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-02-01 11:15:22\",\"delFlag\":\"0\",\"icon\":\"monitor\",\"id\":\"2004\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"report_forms\",\"menuName\":\"报表看板\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"2004\",\"path\":\"echart\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"\",\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":9,\"treeSorts\":\"000009\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:54:05\",\"version\":12,\"visible\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:02', NULL, NULL, '0', NULL, 33);
INSERT INTO `sys_oper_log` VALUES ('bd170800decd402883184faf3b824514', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约挂号\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:11:25', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('bdb7aa0645e0436dba24f35a95522ca6', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_info\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:09', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('be704d2dcbc34993ad6502d9f0b2b0eb', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:06:56', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('be8da6021be845ed8793a1620f68f0a0', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"expense\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:50', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('bf88275b823a41d698af8f6ff3e7cc18', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"card\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:53:50', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('c1b15867a7e34acb9c1d0437d3744952', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:39', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('c215d044d40a4006a2a2420721c88405', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:49\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"patient/card\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:55:58\",\"version\":3,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:50:49\",\"delFlag\":\"0\",\"icon\":\"edit\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"card\",\"menuName\":\"就诊卡管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/2acc2c60c24b4ba2a6180b748f7c42eb\",\"path\":\"patient/card\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000010/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:55:58\",\"version\":3,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:58:34', NULL, NULL, '0', NULL, 36);
INSERT INTO `sys_oper_log` VALUES ('c22a4857d5e2468c84b12109049f1164', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_info\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:16', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('c2ef3dd62b7a442186197e8f6608afe8', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"jiuzhenka\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:49:58', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('c302215cc96749f8b0567b2ed3da4244', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:07:42.883\",\"delFlag\":\"0\",\"icon\":\"time\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve\",\"menuName\":\"预约管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"path\":\"list\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":11,\"treeSorts\":\"000011\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:07:42.883\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:07:42.883\",\"delFlag\":\"0\",\"icon\":\"time\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve\",\"menuName\":\"预约管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"path\":\"list\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":11,\"treeSorts\":\"000011\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:07:42.883\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:07:42', NULL, NULL, '0', NULL, 26);
INSERT INTO `sys_oper_log` VALUES ('c307a02fdf6a4353985757a33e9804f7', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve/register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:11:39\",\"version\":3,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:10:42\",\"delFlag\":\"0\",\"icon\":\"users\",\"id\":\"0cde805b2f754de09dd8318c151113db\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve/register\",\"menuName\":\"预约挂号\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/0cde805b2f754de09dd8318c151113db\",\"path\":\"register\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000011/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:11:39\",\"version\":3,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:11:54', NULL, NULL, '0', NULL, 39);
INSERT INTO `sys_oper_log` VALUES ('c401aa32791948249e7200beda9334b3', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管理\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:33', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('c40d6ffa2108423384ea226a0ae5530f', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:01', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('c4b84c272ba5404492e2bac58654fcce', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/5e3a69d199454f0bad992706ac5bfc51', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":30}', NULL, 0, NULL, '2023-03-26 14:56:00', NULL, NULL, '0', NULL, 34);
INSERT INTO `sys_oper_log` VALUES ('c53fb73e92b34242b540852a7b96327c', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"patient/list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:58:01\",\"version\":2,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"patient/list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:58:01\",\"version\":2,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:58:24', NULL, NULL, '0', NULL, 43);
INSERT INTO `sys_oper_log` VALUES ('c61c121c78c94d2d9c498b68b273add5', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:17:38.298\",\"delFlag\":\"0\",\"icon\":\"pay-circle\",\"id\":\"b1b627e3906241baad6e6f88cf8a3996\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"expense\",\"menuName\":\"费用管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996\",\"path\":\"expense\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:17:38.298\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:17:38.298\",\"delFlag\":\"0\",\"icon\":\"pay-circle\",\"id\":\"b1b627e3906241baad6e6f88cf8a3996\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"expense\",\"menuName\":\"费用管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"b1b627e3906241baad6e6f88cf8a3996\",\"path\":\"expense\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:17:38.298\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:17:38', NULL, NULL, '0', NULL, 29);
INSERT INTO `sys_oper_log` VALUES ('c696ff09e79c4e97944e83bf2acc8f5c', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"hospital\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:07:54\",\"version\":7,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"hospital\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:07:54\",\"version\":7,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:09:25', NULL, NULL, '0', NULL, 37);
INSERT INTO `sys_oper_log` VALUES ('c823e4a117e64fa0ba011603d61ca142', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"hospital\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:32:00\",\"version\":5,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"hospital\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:32:00\",\"version\":5,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:59:52', NULL, NULL, '0', NULL, 33);
INSERT INTO `sys_oper_log` VALUES ('c9a851927aef4164a52485aed8709a3c', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生\",\"id\":\"100\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:00:46', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('c9fb033905874ef8a3b44d2b58cbad2e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reserve\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:02', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('ca675236a70f4805b6b70bb2257c9ee2', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"dept-manager\",\"id\":\"103\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:01:14', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('cc7836f96d45487986f509bdc7d8c515', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"hospital\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:09:24', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('cd96f1b75f14412d87c632889eee50a1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:07:06', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('cf3aca9d40b446d28d22b29618b93ca1', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医院管理\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:42', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('cff74d7b1f1647f7b3a162fb59c87fa2', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"consume\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:18:09', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('d00687a9c85b4c97af585e7f558bead8', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"hospital\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:52', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('d02872fac3944d0ab4acbc0c1d6e5cd8', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:59:52\",\"version\":6,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:16:04\",\"delFlag\":\"0\",\"icon\":\"appstore\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"hospital\",\"menuName\":\"医院管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"fb5cb6a02c33440991542c915ff62f34\",\"path\":\"list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":12,\"treeSorts\":\"000012\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:59:52\",\"version\":6,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:07:54', NULL, NULL, '0', NULL, 38);
INSERT INTO `sys_oper_log` VALUES ('d0f83971cd41482ca13d3a5e7e46b187', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊消费记录\",\"id\":\"58452e1f7b5c4dacbc75a827aa51332b\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:18:55', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('d108521ff92149f1917350a49c579312', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"consume\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:18:18', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('d116aa2795034a2f838f383f9c0f23c8', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"退款记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:07', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('d37296a774464107a87c9fcf5a282c0e', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"dept-manager\",\"id\":\"103\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:01:23', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('d5422f5e02564ee7b366d4f6d967faa8', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"费用\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:53', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('d5f26423e792408385310a1b490954e3', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:56:19\",\"delFlag\":\"0\",\"icon\":\"hdd\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"case\",\"menuName\":\"病历管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/62b30b8665cb41f29a248f97439dda69\",\"path\":\"case\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000010/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:56:19\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 22:56:19\",\"delFlag\":\"0\",\"icon\":\"hdd\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"case\",\"menuName\":\"病历管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/62b30b8665cb41f29a248f97439dda69\",\"path\":\"case\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":30,\"treeSorts\":\"000010/000030\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 22:56:19\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:57:36', NULL, NULL, '0', NULL, 39);
INSERT INTO `sys_oper_log` VALUES ('d82e1bcb29664e26b97c05c062f60bd5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"register\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:10:37', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('d864be08cad349c7a2d861fc48332032', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:00', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('d90ece4727b6466991c9d400d0827b9d', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/c7ce350ebebc4e23af0b23afe487b42d', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":20}', NULL, 0, NULL, '2023-03-26 15:12:54', NULL, NULL, '0', NULL, 22);
INSERT INTO `sys_oper_log` VALUES ('da144d67f25d4c1a8016828b55d99246', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医院管理\",\"id\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:43', NULL, NULL, '0', NULL, 20);
INSERT INTO `sys_oper_log` VALUES ('dccb7e64d5e745db862ecd66f16fe8c7', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡管理\",\"id\":\"2acc2c60c24b4ba2a6180b748f7c42eb\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:55:58', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('dda75f0dcd0f49bb80cc50f0ad1b635b', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reimburse\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:08', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('ddeaaa4349434475b63e14b759618350', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"doctor\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"team\",\"id\":\"100\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"doctor\",\"menuName\":\"医生管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/100\",\"path\":\"user\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"主要维护平台相关用户信息\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":10,\"treeSorts\":\"000080/000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:32:30\",\"version\":19,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"doctor\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"team\",\"id\":\"100\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"doctor\",\"menuName\":\"医生管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/100\",\"path\":\"user\",\"perms\":\"\",\"recordLog\":true,\"remark\":\"主要维护平台相关用户信息\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":10,\"treeSorts\":\"000080/000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:32:30\",\"version\":19,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:01:04', NULL, NULL, '0', NULL, 37);
INSERT INTO `sys_oper_log` VALUES ('ddff588bf85b49b1af7b723d6f609707', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/89e8d2bd9d64463da6f3472d6c85319d', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 15:15:21', NULL, NULL, '0', NULL, 63);
INSERT INTO `sys_oper_log` VALUES ('de671a885a0240e18f61c9378a586ba5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patinet\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:57:48', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('df4dad5238ea4c019ffb2cdc9d9541a4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:29', NULL, NULL, '0', NULL, 26);
INSERT INTO `sys_oper_log` VALUES ('dfd630222edb44a086d35bd5ef657192', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/5e3a69d199454f0bad992706ac5bfc51', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":20}', NULL, 0, NULL, '2023-03-26 14:49:34', NULL, NULL, '0', NULL, 27);
INSERT INTO `sys_oper_log` VALUES ('e06a426dc07a426580a8f8f05f40ae14', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedulex\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:41', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('e277d6aeec1744aabfe112bad90d3ba5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"case\",\"id\":\"62b30b8665cb41f29a248f97439dda69\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:57:35', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('e28c2e176d9f482c94b95091e4af4cc2', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"费用管理\",\"id\":\"\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:53', NULL, NULL, '0', NULL, 40);
INSERT INTO `sys_oper_log` VALUES ('e34fcfbae03e440482dfc94e413a6de3', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:56:14', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('e49f468dfd1e4fbb86e2b75230a98e89', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:13:43\",\"delFlag\":\"0\",\"icon\":\"date\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"schedule\",\"menuName\":\"医生排班\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/c71b5a0e94c7419da1ddf9180b1c421f\",\"path\":\"reserve/schedule\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000011/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:13:43\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:13:43\",\"delFlag\":\"0\",\"icon\":\"date\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"schedule\",\"menuName\":\"医生排班\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d/c71b5a0e94c7419da1ddf9180b1c421f\",\"path\":\"reserve/schedule\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":20,\"treeSorts\":\"000011/000020\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:13:43\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:14:33', NULL, NULL, '0', NULL, 34);
INSERT INTO `sys_oper_log` VALUES ('e6ae975123a64a7fa582371b3375183a', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"预约挂号\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:10:00', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('e861d0ae6feb468fbf34cbdc61965684', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/c836f130e3214dde8007b1ed1fcf7086', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 15:14:27', NULL, NULL, '0', NULL, 59);
INSERT INTO `sys_oper_log` VALUES ('e8f81addc9bf487eb402e0e8dda7ca09', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊消费记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:18:08', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('e97f11d978e74772b93f1992865932ca', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedulex\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:42', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('eb2299791eae440697c50e17966832a5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生排班\",\"id\":\"\",\"parentId\":\"c7ce350ebebc4e23af0b23afe487b42d\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:13:42', NULL, NULL, '0', NULL, 12);
INSERT INTO `sys_oper_log` VALUES ('ec5882002ad74361aff17050a9676ce8', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"就诊卡\",\"id\":\"\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:50:03', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('ec77c9f052714ea1932dd66f583d5408', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:46', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('ecf7f4457f034795b4af48703d2da566', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:24', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('eda779d8b0af4ec0abe2934b61940936', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生管理\",\"id\":\"100\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:05:08', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('ef225125bf14401586c1d7b74cf3ca0d', '菜单管理', 3, 'com.aidex.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1a028e4c7c644c06a36dc6f64285b2e0', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', NULL, 0, NULL, '2023-03-26 15:14:22', NULL, NULL, '0', NULL, 61);
INSERT INTO `sys_oper_log` VALUES ('ef56a1a2aff84e5988b7b7bd30f4384d', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"/patient/list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:09:10\",\"version\":1,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"list/customer/List\",\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-02-23 21:09:10\",\"delFlag\":\"0\",\"icon\":\"bars\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"patient\",\"menuName\":\"患者列表\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\",\"parentIds\":\"5e3a69d199454f0bad992706ac5bfc51/5c34c76bd4cc43e299779c2a38345243\",\"path\":\"/patient/list\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"y\",\"treeLevel\":2,\"treeSort\":10,\"treeSorts\":\"000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-02-23 21:09:10\",\"version\":1,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 14:58:00', NULL, NULL, '0', NULL, 42);
INSERT INTO `sys_oper_log` VALUES ('efc10bf4348b4017b14d4310ca918183', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"patient_info\",\"id\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:13', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('f129738b4d4742f49a7f2d419fbb2a62', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"reimburse\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:20:07', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('f3f51036bf294742aa803077187f8c27', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历管理\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:57:35', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('f4c9fa2eb7c14ee493a9f5a1dae186f5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊消费记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:17:59', NULL, NULL, '0', NULL, 17);
INSERT INTO `sys_oper_log` VALUES ('f5a40920a31442f19d3a64b8ab6280bc', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"医生列\",\"id\":\"100\",\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:00:46', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('f5c1f7681d664fbd9d89f6b525df0ae0', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:07:43\",\"delFlag\":\"0\",\"icon\":\"time\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve\",\"menuName\":\"预约管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"path\":\"reserve\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":11,\"treeSorts\":\"000011\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:10:42\",\"version\":3,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"createBy\":\"1\",\"createDept\":\"100\",\"createTime\":\"2023-03-26 23:07:43\",\"delFlag\":\"0\",\"icon\":\"time\",\"id\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"reserve\",\"menuName\":\"预约管理\",\"menuType\":\"M\",\"params\":{},\"parentId\":\"0\",\"parentIds\":\"c7ce350ebebc4e23af0b23afe487b42d\",\"path\":\"reserve\",\"perms\":\"\",\"recordLog\":true,\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":1,\"treeSort\":11,\"treeSorts\":\"000011\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:10:42\",\"version\":3,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:11:09', NULL, NULL, '0', NULL, 35);
INSERT INTO `sys_oper_log` VALUES ('f7175cd69e6c4d7d9a37c6846bfaa4e5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"病历管理\",\"id\":\"62b30b8665cb41f29a248f97439dda69\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:58:44', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('f7382ecdffd84087adfaefb5e7cca8e5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者管理\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:48', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('f770d449f2244417a20dcf9917cf2620', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"schedule\",\"id\":\"c71b5a0e94c7419da1ddf9180b1c421f\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:14:31', NULL, NULL, '0', NULL, 16);
INSERT INTO `sys_oper_log` VALUES ('f7719b115f00492196ec7e4c4bd60c63', '菜单管理', 1, 'com.aidex.web.controller.system.SysMenuController.save()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/SysUserInde\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"team\",\"id\":\"100\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"doctor\",\"menuName\":\"医生管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/100\",\"path\":\"doctor\",\"perms\":\"system:user:list\'\",\"recordLog\":true,\"remark\":\"主要维护平台相关用户信息\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":10,\"treeSorts\":\"000080/000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:01:05\",\"version\":20,\"visible\":\"0\"}', '{\"code\":200,\"data\":{\"children\":[],\"component\":\"system/user/SysUserInde\",\"createBy\":\"admin\",\"createDept\":\"\",\"createTime\":\"2021-01-30 13:27:43\",\"delFlag\":\"0\",\"icon\":\"team\",\"id\":\"100\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuCode\":\"doctor\",\"menuName\":\"医生管理\",\"menuType\":\"C\",\"params\":{},\"parentId\":\"fb5cb6a02c33440991542c915ff62f34\",\"parentIds\":\"1/8f00f7f7d3b44aaba1041bc8fdf6c470/100\",\"path\":\"doctor\",\"perms\":\"system:user:list\'\",\"recordLog\":true,\"remark\":\"主要维护平台相关用户信息\",\"status\":\"0\",\"treeLeaf\":\"n\",\"treeLevel\":3,\"treeSort\":10,\"treeSorts\":\"000080/000010/000010\",\"updateBy\":\"1\",\"updateIp\":\"127.0.0.1\",\"updateTime\":\"2023-03-26 23:01:05\",\"version\":20,\"visible\":\"0\"}}', NULL, 0, NULL, '2023-03-26 15:04:10', NULL, NULL, '0', NULL, 37);
INSERT INTO `sys_oper_log` VALUES ('f8494154c5204a099c171be8d35f6ef4', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"expense\",\"id\":\"\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:51', NULL, NULL, '0', NULL, 15);
INSERT INTO `sys_oper_log` VALUES ('f8ee25861ec448d99cb6a81da4e89a61', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者管理\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:08:47', NULL, NULL, '0', NULL, 14);
INSERT INTO `sys_oper_log` VALUES ('fa48bccdcd6449bb8c637d92be106a61', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuCodeUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuCodeUnique', '127.0.0.1', '内网IP', '{\"menuCode\":\"report_forms\",\"id\":\"2004\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:16:01', NULL, NULL, '0', NULL, 18);
INSERT INTO `sys_oper_log` VALUES ('faa3bf12eda64e399406ee2641823eb5', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"门诊充值记录\",\"id\":\"\",\"parentId\":\"b1b627e3906241baad6e6f88cf8a3996\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 15:19:22', NULL, NULL, '0', NULL, 13);
INSERT INTO `sys_oper_log` VALUES ('fc841d038c6c4a63bd4ec1d41092dcd6', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"系统工具\",\"id\":\"3\",\"parentId\":\"0\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:48:31', NULL, NULL, '0', NULL, 25);
INSERT INTO `sys_oper_log` VALUES ('fd94789ca77f40a9a7169f3dcf11743a', '字典类型', 11, 'com.aidex.web.controller.system.SysMenuController.checkMenuNameUnique()', 'GET', 1, 'admin', NULL, '/system/menu/checkMenuNameUnique', '127.0.0.1', '内网IP', '{\"menuName\":\"患者列表\",\"id\":\"5c34c76bd4cc43e299779c2a38345243\",\"parentId\":\"5e3a69d199454f0bad992706ac5bfc51\"}', '{\"code\":200,\"data\":{\"code\":\"1\"}}', NULL, 0, NULL, '2023-03-26 14:59:13', NULL, NULL, '0', NULL, 19);
INSERT INTO `sys_oper_log` VALUES ('fe5fc159bebc487fbab9f55e203e2f19', '菜单管理', 10, 'com.aidex.web.controller.system.SysMenuController.findMaxSort()', 'GET', 1, 'admin', NULL, '/system/menu/findMaxSort/0', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":90}', NULL, 0, NULL, '2023-03-26 15:16:25', NULL, NULL, '0', NULL, 14);

-- ----------------------------
-- Table structure for sys_portal_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_config`;
CREATE TABLE `sys_portal_config`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小页名称',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小页编码',
  `application_range` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用范围(S系统,R角色,U用户)',
  `is_default` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认',
  `resource_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源ID(角色ID或者用户ID)',
  `system_defined_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统定义ID区分系统定义和用户自定义',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作台配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_portal_config
-- ----------------------------
INSERT INTO `sys_portal_config` VALUES ('73c217ba0fb24945a8faef74eb10d302', '工作台', '6c297eb4651940edbb45c87c75be00d7', 'U', 'Y', '1', 'app1', '[{\"id\":\"4ae60dd1debe462096698e1da993317a\",\"x\":0,\"y\":0,\"w\":3,\"h\":262,\"i\":\"4ae60dd1debe462096698e1da993317a\",\"key\":\"kuaijierukou\",\"isShowTitle\":\"N\",\"isAllowDrag\":false,\"name\":\"快捷入口\",\"type\":\"smallPage\",\"url\":\"dashboard/portal/CommonUse\",\"options\":\"{\\\"titleRequired\\\":true,\\\"moreUrl\\\":\\\"\\\",\\\"refresh\\\":1}\",\"moved\":false},{\"id\":\"fd7290c27f644234b38d18faf5d75783\",\"x\":0,\"y\":262,\"w\":3,\"h\":1370,\"i\":\"fd7290c27f644234b38d18faf5d75783\",\"key\":\"todo\",\"isShowTitle\":\"N\",\"isAllowDrag\":true,\"name\":\"待办小页\",\"type\":\"smallPage\",\"url\":\"dashboard/portal/ToDo\",\"options\":\"{\\\"titleRequired\\\":true,\\\"moreUrl\\\":\\\"\\\",\\\"refresh\\\":1}\",\"moved\":false}]', NULL, '0', '1', '100', '2021-09-01 16:25:30', '1', '2021-09-04 21:44:35', '127.0.0.1', NULL, 5, '0');

-- ----------------------------
-- Table structure for sys_portlet
-- ----------------------------
DROP TABLE IF EXISTS `sys_portlet`;
CREATE TABLE `sys_portlet`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小页名称',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小页编码',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小页ULRL',
  `refresh_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '刷新频率',
  `show_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示标题',
  `is_allow_drag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许拖拽',
  `x_grid_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '横向栅格数',
  `y_grid_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纵向栅格数',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `table_config_idx1`(`name`, `code`, `del_flag`) USING BTREE,
  INDEX `table_config_idx`(`name`, `code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作台小页管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_portlet
-- ----------------------------
INSERT INTO `sys_portlet` VALUES ('48ab0929410c4458b8a0fb1f6e1517a6', '项目金额总览', 'test1', 'demo/portLetCards/AmountStatistics', NULL, 'N', 'Y', '2', '100', 10, '0', '1', '100', '2021-05-10 17:16:13', '1', '2021-05-24 09:21:04', '127.0.0.1', NULL, 10, '0');
INSERT INTO `sys_portlet` VALUES ('4ae60dd1debe462096698e1da993317a', '快捷入口', 'kuaijierukou', 'dashboard/portal/CommonUse', NULL, 'N', 'N', '3', '300', 90, '0', '1', '100', '2021-05-20 16:48:19', '1', '2021-05-27 17:43:55', '127.0.0.1', NULL, 3, '0');
INSERT INTO `sys_portlet` VALUES ('9460f48c10574f3f8dc41e91a9e7d852', '统计图-饼图', 'test8', 'demo/chart/pie-chart', NULL, 'N', 'Y', '2', '100', 80, '0', '1', '100', '2021-05-13 17:24:35', '1', '2021-05-18 10:44:30', '127.0.0.1', NULL, 2, '0');
INSERT INTO `sys_portlet` VALUES ('9e84a390d85045b3b3d50bb71096d5f0', '当月任务完成情况总览', 'test3', 'demo/portLetCards/TaskCompletionStatistics', NULL, 'N', 'Y', '2', '100', 30, '0', '1', '100', '2021-05-13 16:21:28', '1', '2021-05-19 16:54:09', '127.0.0.1', NULL, 4, '0');
INSERT INTO `sys_portlet` VALUES ('c42a1e2bc13e4a8ebdc640f137b71afb', '统计图-折线图', 'test7', 'demo/chart/line-chart', NULL, 'N', 'Y', '2', '100', 70, '0', '1', '100', '2021-05-13 17:23:23', '1', '2021-05-18 10:44:23', '127.0.0.1', NULL, 4, '0');
INSERT INTO `sys_portlet` VALUES ('ce6b3d01fd44400c9f919ede36b0dfd4', '统计图-面积图', 'test6', 'demo/chart/area-chart', NULL, 'N', 'Y', '2', '100', 60, '0', '1', '100', '2021-05-13 17:19:13', '1', '2021-05-18 10:44:16', '127.0.0.1', NULL, 6, '0');
INSERT INTO `sys_portlet` VALUES ('edbe13d789dc46efa17af9e8348cd08a', '访问量', 'test4', 'demo/portLetCards/TrafficStatistics', NULL, 'N', 'Y', '1', '100', 40, '0', '1', '100', '2021-05-13 16:23:29', '1', '2021-05-18 10:44:01', '127.0.0.1', NULL, 3, '0');
INSERT INTO `sys_portlet` VALUES ('f2d7ae2c79b748f28c1d1b9a75490887', '仪表盘', 'test5', 'demo/portLetCards/DashboardChart', NULL, 'N', 'Y', '1', '100', 50, '0', '1', '100', '2021-05-13 16:43:16', '1', '2021-05-18 10:44:06', '127.0.0.1', NULL, 2, '0');
INSERT INTO `sys_portlet` VALUES ('f3fe47b17c53437cb5c672d29ea432ae', '当月任务总数统计', 'test2', 'demo/portLetCards/TaskTotalStatistics', NULL, 'N', 'Y', '1', '100', 20, '0', '1', '100', '2021-05-13 16:15:06', '1', '2021-05-18 10:43:51', '127.0.0.1', NULL, 4, '0');
INSERT INTO `sys_portlet` VALUES ('fd7290c27f644234b38d18faf5d75783', '待办小页', 'todo', 'dashboard/portal/ToDo', NULL, 'N', 'Y', '3', '300', 100, '0', '1', '100', '2021-05-20 18:00:35', '1', '2021-05-20 18:28:47', '127.0.0.1', NULL, 4, '0');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', 10, '0', 'admin', NULL, '2021-01-30 13:27:43', '1', '2021-09-05 10:11:01', '127.0.0.1', '1', 1, '0');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', 20, '0', 'admin', NULL, '2021-01-30 13:27:43', '1', '2021-09-05 10:10:50', '127.0.0.1', '1', 1, '0');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', 30, '0', 'admin', NULL, '2021-01-30 13:27:43', '1', '2021-09-05 10:11:12', '127.0.0.1', '1', 1, '0');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', 40, '0', 'admin', NULL, '2021-01-30 13:27:43', '1', '2021-09-05 10:11:16', '127.0.0.1', '1', 1, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', NULL, '2021-01-30 13:27:43', '1', '2021-07-13 10:16:52', '超级管理员', '127.0.0.1', 3);
INSERT INTO `sys_role` VALUES ('1d65a356f35d455bbb2a3a614737b0f7', '项目管理员', 'projectAdmin', 3, '2', 1, 1, '0', '0', '1', '100', '2021-06-03 18:39:55', '1', '2021-07-13 11:47:03', NULL, '127.0.0.1', 14);
INSERT INTO `sys_role` VALUES ('2', '系统管理员', 'sysAdmin', 2, '2', 1, 1, '0', '0', 'admin', NULL, '2021-01-30 13:27:43', '1', '2021-07-13 11:46:35', '普通角色', '127.0.0.1', 7);
INSERT INTO `sys_role` VALUES ('c6676868d24e43098e4724014a096800', '一般用户', 'ordinaryUser', 50, '2', 0, 0, '0', '0', '1', '100', '2021-07-16 14:49:26', '1', '2021-07-17 12:46:50', NULL, '127.0.0.1', 3);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `dept_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('1d65a356f35d455bbb2a3a614737b0f7', '40f40750917349249f3a7d4593e3e886');
INSERT INTO `sys_role_dept` VALUES ('2', '40f40750917349249f3a7d4593e3e886');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_table_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_table_config`;
CREATE TABLE `sys_table_config`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `table_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表唯一性编码',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `space` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '间距',
  `columns` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应列集合JSON',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `table_config_idx1`(`table_key`, `user_id`, `del_flag`) USING BTREE,
  INDEX `table_config_idx`(`table_key`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表格个性化配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_table_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_theme_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme_config`;
CREATE TABLE `sys_theme_config`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `theme_obj` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应主题JSON',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1删除 2停用）',
  `sort` int(4) NOT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx1`(`user_id`, `del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户主题信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_theme_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_upload_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_upload_files`;
CREATE TABLE `sys_upload_files`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upload_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ID',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `batch_content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新内容',
  `batch_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `batch_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标值',
  `batch_value_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标值中文显示',
  `file_create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `upload_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载用户',
  `dto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'DTO对象',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `service_bean` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属Bean对象',
  `batch_count` int(11) NULL DEFAULT NULL COMMENT '总处理数',
  `success_count` int(11) NULL DEFAULT NULL COMMENT '已处理变更',
  `success_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已处理变更文件路径',
  `fail_count` int(11) NULL DEFAULT NULL COMMENT '失败变更',
  `fail_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败变更文件路径',
  `progress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进度',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展选项',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `status` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导入记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_upload_files
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `dept_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `name_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆名称',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '前后台类型标识 0:后台用户 1:前台用户',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `nation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `birth_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `polity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `office_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真号',
  `work_space` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作地点',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `user_pinyin` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名全拼和简拼',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_dept` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新IP',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '100', '管理员', NULL, 'admin', 'admin', '管理员', '1', '11223344@qq.com', '15355558888', '0', '/profile\\avatar\\2021/07/28\\fce3dc16-5f76-41d8-8ad7-fa5ade9668ef.jpeg', '$2a$10$pKFKKWAQz5lNS7uLqNZYveEkNSgDQEOThN/0SJ/HmwFeyQfJwhX96', NULL, NULL, NULL, NULL, NULL, '029-03456751111', NULL, NULL, 1, 'admin,admin', '0', '0', '127.0.0.1', '2023-03-26 22:48:07', 'admin', NULL, '2021-01-30 13:27:43', '1', '2021-08-17 11:18:23', '10.216.70.100', '管理员', 32);
INSERT INTO `sys_user` VALUES ('2', '100', 'test', NULL, 'test', 'test', 'sdfsd', '2', '334444@qq.com', '15155558888', '0', NULL, '$2a$10$etMMI1O1HTWJ9W8//vuRdOMF2xxbG4rZQkRgAGZDGOtOpHSiGwEGq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'test,test', '0', '0', NULL, NULL, '1', '100', '2021-04-07 14:41:30', '1', '2021-09-05 10:37:08', '127.0.0.1', NULL, 10);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('01085bb3d1174d119d5b35877378a366', '2');
INSERT INTO `sys_user_post` VALUES ('01085bb3d1174d119d5b35877378a366', '3');
INSERT INTO `sys_user_post` VALUES ('01085bb3d1174d119d5b35877378a366', '4');
INSERT INTO `sys_user_post` VALUES ('1', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `idx`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('01085bb3d1174d119d5b35877378a366', '2');

-- ----------------------------
-- Table structure for user_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `avatar_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户头像',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_basic_info_phone_uindex`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户基础信息表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_basic_info
-- ----------------------------
INSERT INTO `user_basic_info` VALUES (4, '111', '', '15680934168', '2023-02-25 08:54:40', '2023-02-25 08:54:40');

-- ----------------------------
-- Table structure for user_case
-- ----------------------------
DROP TABLE IF EXISTS `user_case`;
CREATE TABLE `user_case`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `card_id` bigint(20) NOT NULL COMMENT '就诊卡编号',
  `appointment_id` bigint(20) NOT NULL COMMENT '预约编号',
  `doctor_id` bigint(20) NOT NULL COMMENT '医生编号',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病例详情',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户病例表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_case
-- ----------------------------
INSERT INTO `user_case` VALUES (2, 2, 0, 2, 'string', '2023-03-26 22:12:58', '2023-03-26 22:12:58');

-- ----------------------------
-- Table structure for user_medical_card
-- ----------------------------
DROP TABLE IF EXISTS `user_medical_card`;
CREATE TABLE `user_medical_card`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '就诊卡号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '性别 男：1，女：2',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `identification_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件号',
  `birth_date` datetime NOT NULL COMMENT '出生日期',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户就诊卡信息表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_medical_card
-- ----------------------------
INSERT INTO `user_medical_card` VALUES (1, 'cardtest1', 0, '15680934168', '123456', '2023-03-26 16:23:55', '2023-03-26 16:48:41', '2023-03-26 16:54:56');
INSERT INTO `user_medical_card` VALUES (2, 'test1', 0, '15680934168', 'string', '2023-03-26 16:23:55', '2023-03-26 17:02:54', '2023-03-26 17:02:54');

-- ----------------------------
-- Table structure for user_medical_card_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_medical_card_relation`;
CREATE TABLE `user_medical_card_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `type` int(11) NOT NULL COMMENT '关系类型 0：本人，1：父母，2：兄弟/姐妹，3：伴侣，4：子女，5：同事/朋友，6：其他',
  `account_id` bigint(20) NOT NULL COMMENT '账号编号',
  `card_id` bigint(20) NOT NULL COMMENT '就诊卡编号',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户就诊卡关系表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_medical_card_relation
-- ----------------------------
INSERT INTO `user_medical_card_relation` VALUES (3, 0, 4, 2, '2023-03-26 17:02:54', '2023-03-26 17:02:54');

-- ----------------------------
-- Table structure for visit_appointment
-- ----------------------------
DROP TABLE IF EXISTS `visit_appointment`;
CREATE TABLE `visit_appointment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预约编号',
  `plan_id` bigint(20) NOT NULL COMMENT '出诊编号',
  `card_id` bigint(20) NOT NULL COMMENT '就诊卡号',
  `account_id` bigint(20) NOT NULL COMMENT '账号编号',
  `time_period` int(11) NOT NULL COMMENT '1： 8点半~9点，2： 9点~9点半，3： 9点半~10点，4： 10点~10点半，5： 11点~11点半，6： 11点半~12点，7：2点~2点半，8： 2点半~3点，9： 3点~3点半，10： 3点半~4点，11： 4点~4点半，12： 4点半~5点，13： 5点~5点半，14：5点半~6点',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '预约状态 0：未开始，1：未按时就诊，2：取消预约挂号，3：已完成',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出诊预约表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visit_appointment
-- ----------------------------
INSERT INTO `visit_appointment` VALUES (2, 2, 2, 4, 0, 3, '2023-03-26 21:33:26', '2023-03-26 22:04:21');

-- ----------------------------
-- Table structure for visit_plan
-- ----------------------------
DROP TABLE IF EXISTS `visit_plan`;
CREATE TABLE `visit_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '出诊编号',
  `dept_id` bigint(20) NOT NULL COMMENT '门诊编号',
  `doctor_id` bigint(20) NOT NULL COMMENT '医生编号',
  `time` int(11) NOT NULL DEFAULT 1 COMMENT '时间段 1：上午，2：下午',
  `day` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出诊日期',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出诊信息表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visit_plan
-- ----------------------------
INSERT INTO `visit_plan` VALUES (2, 100, 1, 1, '2023-03-26 20:16:26', '2023-03-26 21:26:44', '2023-03-26 21:26:44');

SET FOREIGN_KEY_CHECKS = 1;