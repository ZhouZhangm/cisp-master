/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : test_school

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 22/04/2022 19:35:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_app_appdef
-- ----------------------------
DROP TABLE IF EXISTS `act_app_appdef`;
CREATE TABLE `act_app_appdef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int(0) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_APP_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_appdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangelog`;
CREATE TABLE `act_app_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(0) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangelog
-- ----------------------------
INSERT INTO `act_app_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2022-02-25 11:27:34', 1, 'EXECUTED', '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', NULL, '3.6.2', NULL, NULL, '5759653878');
INSERT INTO `act_app_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2022-02-25 11:27:34', 2, 'EXECUTED', '8:ccea9ebfb6c1f8367ca4dd473fcbb7db', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', NULL, '3.6.2', NULL, NULL, '5759653878');
INSERT INTO `act_app_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2022-02-25 11:27:34', 3, 'EXECUTED', '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', NULL, '3.6.2', NULL, NULL, '5759653878');

-- ----------------------------
-- Table structure for act_app_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangeloglock`;
CREATE TABLE `act_app_databasechangeloglock`  (
  `ID` int(0) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangeloglock
-- ----------------------------
INSERT INTO `act_app_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_app_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment`;
CREATE TABLE `act_app_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment_resource`;
CREATE TABLE `act_app_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_casedef
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_casedef`;
CREATE TABLE `act_cmmn_casedef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int(0) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CASE_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_casedef
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangelog`;
CREATE TABLE `act_cmmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(0) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangelog
-- ----------------------------
INSERT INTO `act_cmmn_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:31', 1, 'EXECUTED', '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:32', 2, 'EXECUTED', '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:32', 3, 'EXECUTED', '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:32', 4, 'EXECUTED', '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 5, 'EXECUTED', '8:70349de472f87368dcdec971a10311a0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 6, 'EXECUTED', '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 7, 'EXECUTED', '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('8', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 8, 'EXECUTED', '8:e8c2eb1ce28bc301efe07e0e29757781', 'addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('9', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 9, 'EXECUTED', '8:4cb4782b9bdec5ced2a64c525aa7b3a0', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('10', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 10, 'EXECUTED', '8:341c16be247f5d17badc9809da8691f9', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('11', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 11, 'EXECUTED', '8:d7c4da9276bcfffbfb0ebfb25e3f7b05', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('12', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 12, 'EXECUTED', '8:adf4ecc45f2aa9a44a5626b02e1d6f98', 'addColumn tableName=ACT_CMMN_RU_CASE_INST', '', NULL, '3.6.2', NULL, NULL, '5759650833');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('13', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2022-02-25 11:27:33', 13, 'EXECUTED', '8:7550626f964ab5518464709408333ec1', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '3.6.2', NULL, NULL, '5759650833');

-- ----------------------------
-- Table structure for act_cmmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangeloglock`;
CREATE TABLE `act_cmmn_databasechangeloglock`  (
  `ID` int(0) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_cmmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_cmmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment`;
CREATE TABLE `act_cmmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment_resource`;
CREATE TABLE `act_cmmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  `GENERATED_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CMMN_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_case_inst`;
CREATE TABLE `act_cmmn_hi_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_mil_inst`;
CREATE TABLE `act_cmmn_hi_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_plan_item_inst`;
CREATE TABLE `act_cmmn_hi_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) NULL DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_case_inst`;
CREATE TABLE `act_cmmn_ru_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `LOCK_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_REF_ID_`(`REFERENCE_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_mil_inst`;
CREATE TABLE `act_cmmn_ru_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_plan_item_inst`;
CREATE TABLE `act_cmmn_ru_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) NULL DEFAULT NULL,
  `VAR_COUNT_` int(0) NULL DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(0) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_STAGE_INST`(`STAGE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_sentry_part_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_sentry_part_inst`;
CREATE TABLE `act_cmmn_ru_sentry_part_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(0) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ON_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IF_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_PLAN_ITEM`(`PLAN_ITEM_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_sentry_part_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_content_item
-- ----------------------------
DROP TABLE IF EXISTS `act_co_content_item`;
CREATE TABLE `act_co_content_item`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MIME_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) NULL DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_SIZE_` bigint(0) NULL DEFAULT 0,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `idx_contitem_taskid`(`TASK_ID_`) USING BTREE,
  INDEX `idx_contitem_procid`(`PROC_INST_ID_`) USING BTREE,
  INDEX `idx_contitem_scope`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_content_item
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangelog`;
CREATE TABLE `act_co_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(0) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangelog
-- ----------------------------
INSERT INTO `act_co_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2022-02-25 11:27:30', 1, 'EXECUTED', '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.2', NULL, NULL, '5759650541');
INSERT INTO `act_co_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2022-02-25 11:27:30', 2, 'EXECUTED', '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.2', NULL, NULL, '5759650541');

-- ----------------------------
-- Table structure for act_co_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangeloglock`;
CREATE TABLE `act_co_databasechangeloglock`  (
  `ID` int(0) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangeloglock
-- ----------------------------
INSERT INTO `act_co_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangelog`;
CREATE TABLE `act_dmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(0) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangelog
-- ----------------------------
INSERT INTO `act_dmn_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 1, 'EXECUTED', '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.2', NULL, NULL, '5759649309');
INSERT INTO `act_dmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 2, 'EXECUTED', '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.2', NULL, NULL, '5759649309');
INSERT INTO `act_dmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 3, 'EXECUTED', '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.2', NULL, NULL, '5759649309');
INSERT INTO `act_dmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 4, 'EXECUTED', '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.2', NULL, NULL, '5759649309');
INSERT INTO `act_dmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 5, 'EXECUTED', '8:3e03528582dd4eeb4eb41f9b9539140d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.2', NULL, NULL, '5759649309');
INSERT INTO `act_dmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 6, 'EXECUTED', '8:646c6a061e0b6e8a62e69844ff96abb0', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.2', NULL, NULL, '5759649309');
INSERT INTO `act_dmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 7, 'EXECUTED', '8:215a499ff7ae77685b55355245b8b708', 'dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION', '', NULL, '3.6.2', NULL, NULL, '5759649309');
INSERT INTO `act_dmn_databasechangelog` VALUES ('8', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2022-02-25 11:27:29', 8, 'EXECUTED', '8:5355bee389318afed91a11702f2df032', 'addColumn tableName=ACT_DMN_DECISION', '', NULL, '3.6.2', NULL, NULL, '5759649309');

-- ----------------------------
-- Table structure for act_dmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;
CREATE TABLE `act_dmn_databasechangeloglock`  (
  `ID` int(0) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_dmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_decision
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_decision`;
CREATE TABLE `act_dmn_decision`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(0) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_DMN_DEC_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_decision
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment`;
CREATE TABLE `act_dmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment_resource`;
CREATE TABLE `act_dmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_hi_decision_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_hi_decision_execution`;
CREATE TABLE `act_dmn_hi_decision_execution`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FAILED_` bit(1) NULL DEFAULT b'0',
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_JSON_` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_hi_decision_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint(0) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangelog`;
CREATE TABLE `act_fo_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(0) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangelog
-- ----------------------------
INSERT INTO `act_fo_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2022-02-25 11:27:29', 1, 'EXECUTED', '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.2', NULL, NULL, '5759649851');
INSERT INTO `act_fo_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2022-02-25 11:27:29', 2, 'EXECUTED', '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.2', NULL, NULL, '5759649851');
INSERT INTO `act_fo_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2022-02-25 11:27:30', 3, 'EXECUTED', '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.2', NULL, NULL, '5759649851');
INSERT INTO `act_fo_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2022-02-25 11:27:30', 4, 'EXECUTED', '8:2087829f22a4b2298dbf530681c74854', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.2', NULL, NULL, '5759649851');
INSERT INTO `act_fo_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2022-02-25 11:27:30', 5, 'EXECUTED', '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.2', NULL, NULL, '5759649851');

-- ----------------------------
-- Table structure for act_fo_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;
CREATE TABLE `act_fo_databasechangeloglock`  (
  `ID` int(0) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangeloglock
-- ----------------------------
INSERT INTO `act_fo_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_fo_form_definition
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_definition`;
CREATE TABLE `act_fo_form_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(0) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_FORM_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_definition
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_deployment`;
CREATE TABLE `act_fo_form_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_instance
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_instance`;
CREATE TABLE `act_fo_form_instance`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) NULL DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_instance
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_resource`;
CREATE TABLE `act_fo_form_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('3a89edaa-99e9-11ec-95c9-60f262a4e51a', 1, 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', '3a89eda9-99e9-11ec-95c9-60f262a4e51a', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E6365220D0A20202020202020202020202020786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4449220D0A20202020202020202020202020786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F4449220D0A20202020202020202020202020747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F5850617468220D0A202020202020202020202020207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0D0A202020203C70726F636573732069643D224C6561766522206E616D653D224C6561766550726F636573732220697345786563757461626C653D2274727565223E0D0A20202020202020203C757365725461736B2069643D226C656176655461736B22206E616D653D22E8AFB7E581872220666C6F7761626C653A61737369676E65653D22247B6C656176655461736B7D222F3E0D0A20202020202020203C757365725461736B2069643D226D616E616765725461736B22206E616D653D22E7BB8FE79086E5AEA1E6A0B8222F3E0D0A20202020202020203C6578636C7573697665476174657761792069643D226D616E616765724A756467655461736B222F3E0D0A20202020202020203C656E644576656E742069643D22656E644C6561766522206E616D653D22E7BB93E69D9F222F3E0D0A20202020202020203C73746172744576656E742069643D2273746172744C6561766522206E616D653D22E5BC80E5A78B222F3E0D0A20202020202020203C73657175656E6365466C6F772069643D226D6F6465466C6F772220736F757263655265663D226C656176655461736B22207461726765745265663D226D616E616765725461736B222F3E0D0A20202020202020203C73657175656E6365466C6F772069643D22666C6F7753746172742220736F757263655265663D2273746172744C6561766522207461726765745265663D226C656176655461736B222F3E0D0A20202020202020203C73657175656E6365466C6F772069643D226A75676465466C6F772220736F757263655265663D226D616E616765725461736B22207461726765745265663D226D616E616765724A756467655461736B222F3E0D0A20202020202020203C656E644576656E742069643D22656E644C6561766532222F3E0D0A20202020202020203C73657175656E6365466C6F772069643D22666C6F77456E6422206E616D653D22E9809AE8BF872220736F757263655265663D226D616E616765724A756467655461736B22207461726765745265663D22656E644C65617665223E0D0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E0D0A202020202020202020202020202020203C215B43444154415B247B636865636B526573756C743D3D27E9809AE8BF87277D5D5D3E0D0A2020202020202020202020203C2F636F6E646974696F6E45787072657373696F6E3E0D0A20202020202020203C2F73657175656E6365466C6F773E0D0A20202020202020203C73657175656E6365466C6F772069643D2272656A656374466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226D616E616765724A756467655461736B220D0A202020202020202020202020202020202020202020207461726765745265663D22656E644C6561766532223E0D0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E0D0A202020202020202020202020202020203C215B43444154415B247B636865636B526573756C743D3D27E9A9B3E59B9E277D5D5D3E0D0A2020202020202020202020203C2F636F6E646974696F6E45787072657373696F6E3E0D0A20202020202020203C2F73657175656E6365466C6F773E0D0A202020203C2F70726F636573733E0D0A202020203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F70726F63657373223E0D0A20202020202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D224C65617665222069643D2242504D4E506C616E655F70726F63657373223E0D0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226C656176655461736B222069643D2242504D4E53686170655F6C656176655461736B223E0D0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2237392E3939393939393939393939393939222077696474683D223130302E302220783D223330342E36303830373937333535383937342220793D223132322E3030303030303030303030303031222F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D616E616765725461736B222069643D2242504D4E53686170655F6D616E616765725461736B223E0D0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223436352E302220793D223132322E30222F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D616E616765724A756467655461736B222069643D2242504D4E53686170655F6D616E616765724A756467655461736B223E0D0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223631312E352220793D223134322E30222F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E644C65617665222069643D2242504D4E53686170655F656E644C65617665223E0D0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223639362E352220793D223134382E30222F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172744C65617665222069643D2242504D4E53686170655F73746172744C65617665223E0D0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223231332E323235363535383134393132382220793D223134372E30222F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E644C6561766532220D0A20202020202020202020202020202020202020202020202020202020202069643D2242504D4E53686170655F656E644C6561766532223E0D0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223631372E352220793D2237332E3332303938323835373533353732222F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F77456E64222069643D2242504D4E456467655F666C6F77456E64223E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223635312E313231373934383731373934392220793D223136322E3337383230353132383230353134222F3E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223639362E353030323833393738353339342220793D223136322E30383931373031363537343138222F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2272656A656374466C6F77222069643D2242504D4E456467655F72656A656374466C6F77223E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223633312E3836363039333537373738362220793D223134322E333636303933353737373836303722202F3E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223633312E353933313039303237363939332220793D223130312E333230363733323336353734383522202F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226D6F6465466C6F77222069643D2242504D4E456467655F6D6F6465466C6F77223E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223430342E36303830373937333535383937342220793D223136322E3022202F3E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223436352E302220793D223136322E3022202F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F775374617274222069643D2242504D4E456467655F666C6F775374617274223E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223234332E323235363535383134393132382220793D223136322E3022202F3E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223330342E36303830373937333535383937342220793D223136322E3022202F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A75676465466C6F77222069643D2242504D4E456467655F6A75676465466C6F77223E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223536352E302220793D223136322E323133363735323133363735323322202F3E0D0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223631312E393134313633303930313238382220793D223136322E343134313633303930313238373722202F3E0D0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0D0A20202020202020203C2F62706D6E64693A42504D4E506C616E653E0D0A202020203C2F62706D6E64693A42504D4E4469616772616D3E0D0A3C2F646566696E6974696F6E733E, 0);
INSERT INTO `act_ge_bytearray` VALUES ('3ac8563b-99e9-11ec-95c9-60f262a4e51a', 1, 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.Leave.png', '3a89eda9-99e9-11ec-95c9-60f262a4e51a', 0x89504E470D0A1A0A0000000D49484452000002DE000000D40806000000AB902410000011A64944415478DAEDDDDF6FD5659E077066E21F307FC05C703189DE6EE22473B11724BB175C902C319243690B05148808624375FC59B3DA90C50B849964A36094DD9A1AB9202CD9D1D902229505C29A75FC11031871C0A6D8CAD4A183E587FADDE7E9F6345F8EA73F4ECF8F9E73BEAF57F249B1A7A7354F3EA7DFF779FA7C9F67D122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AAA2B5B5F597B95CEEE1952B571E087521D458A824D478A88BE1B183E1E3F6F875460B00004AD4D2D2B23C54FF64C04EE658EF86E7B4193D0000984508CF8B43BD5D42D82E56032B56ACF895D10400802272B95CC8CC2B47D221BAB5B535D9B1634772ECD8B1E4D2A54BC9B56BD792E8FAF5EBC9E0E06072F2E4C964D7AE5D497B7B7B61F81E33FB0D00003F0DDDCB4258BE9D0EDCBDBDBDC9F0F0703217A3A3A3135F1F9F970EE0217C3F6074010060D1D44CF754E8EEECEC9C98DD9E8FF8BCAEAEAEC2F06DE61B00806C9B5CD33DB5BCA4BBBB7B6A39C97CC565283D3D3D85CB4EEE31DA000064D6E4CE255333DDE586EE74F82E98F91E30DA00006435742F4FAFE99EEFF29299969DA4D77C5B720200405683F7D46C77BC31B21AFAFAFACC7A0300905DF1A4C9FC0D957156FAEAD5AB5509DE71B79382AD06171B7D00003263F218F88930BC73E7CEA49AE23EDFA9E0BDDDE80300901921001FC887E1E3C78F573578C7437652C1FBB0D10700204BC1FB423E0C57FAA6CA42F184CB54F0BE6CF40100C852F01ECB87E14A6D2138D3D682A9E03D6EF40100C852F09E0AC3B590FE79461F00802C056F33DE00005083E06D8D370000D42078DBD5040000AACD3EDE000050034EAE0400801A696969E9CF07E2DEDEDEAA04EFBEBEBE74E81E30EA00006431782FCF87E238EB5DE99B2CE3F78BDF37FF33C2CF6B33EA0000645208C4EFE68371676767C5B6168C5B08767575DD31DBBD64C992BB8C380000590DDE8B438DE40372777777D9E13B86EE9E9E9E74E81E6B6969B9C76803009069B95C6E65FE46CBFCCCF77C979DC4E715CC745B6202000079212077A4C3775C9B1D6FB88CBB92CC75F7927823657A4D77AC10EA7F6B7401002025CE7C871A4D07E718A4E33EDFF1909D389B9D5F86129793C41329E3E1387BF6EC493A3A3AEE08DC9347D277185500002822AEF94E6F3338CF1AB0A61B0000E616C0EF9F0CE0B74B09DC7196DBEE25000050A278C26508E0DB42A03E10EA62A8F154D0BE1CEA703C06DE899400005041B95CEE37F959F010C8971A110000A84EF03E989AF13E6B440000A0C242D0BEB770CD7708E2CB8C0C00005436781F2E7243E5593753020040E542F7BDD3ED70D2D2D2B2DC080100406582F7DB336C2378CA08010040F9A1FBDED9F6F3B6D61B0000CA0FDE87E770788E1D4E0000A00A613C310A00002078030080E00D000008DE00002078030080E00D000008DE000020780300008237000008DE0000207803C02C9224B9EB8B2FBE3870FAF4E91F8E1E3D9AF4F7F7AB1AD79123479213274E7C13AA4D0FEA413D287803D0A462E019181848868787939B376FAA05AA919191E4BDF7DEFB6B0840F7EB41A507056F009A509C651478EA26F8DCECEFEFFF4C0F2A3D287803D084E29FF6058EFAA9107A6EEB41A507056F009A505CDF296CD455E849F4A0D283823700190E3D7FFB7628F9E2EC6BC9A747FE79A2E2BFE3E70415A1470FEA41C11B002A147AC64607934FFEF84CF2A7FFECBAA3E2E7E263C28AD0A307F5A0E00D0015083D973FFD8F9F049E7C7DF5E9616145E8D1837A50F006804A849ECFDEFD9769434F7C4C58117AF4A01E14BC01A002A1E793FEE7A60D3DF1316145E8D1837A50F00600A147E8D1834A0F0ADE003446E8893B484C177AE263C28AD0A307F5A0E00D0015083D174EFE7EDAD0131F1356841E3DA807056F00A840E8B93AF851F2C97F75FFF44FFCE173F1316145E8D1837A50F006800A849E5817FFE7DF7E127AE2E70415A1470FEA41C11B002A157A6EDC482EFCF7BFFEF44FFCE173F1316145E8D1837A50F0068032434F3C15F0FCC9DF4DBBBE363EE6E440A1470FEA41C11B00E61B7A6EDC48862E1C4B3E7EE7C969034FBEE2D7C4AF35F328F4E8413D2878034009A167B61946338F428F1ED4838237005420F4CC658671A69947E145E8D1837AB009FC42F006A0EAA167BE81275FC28BD0A307F560835B1A2A11BC01A87AE851428F1ED48319F68FA14643ED9AFCB8CC950200A147E8D1834A0F562774E7C3769CF91E11BE01107A841E3DA8F460F542F76C9F0700A147E8D1834A0F9668E92CE13AFFF852570D20B3CE9C39B362DFBE7D7FE8E9E919D9B265CBAD8E8E8E899B61DADADA7E7CE8A1876E3DFBECB3975F7AE9A5836FBEF9E6AF8D96D023F4E841A507CB08D566BE8B686D6DFD652E977B385C7B0F84BA106A2C5E87438D87BA181E3B183E6E8F5F67B4A041BDF6DA6B3B9F7BEEB9EBDBB66D4B5E7EF9E5E4F4E9D3C9E0E060323E3E9E44F1E3F0F070F2C1071F24FBF7EF4FE2D73DF6D8635F87DA66F4841EA1470F2A3D5810A69756E9EB9B564B4BCBF250FD2154DF980CDA73A977C373DA5C79A1411C3C78F01F42E0FEB6ABAB6B22547FFFFDF7C95C7DF8E187C9134F3CF1E3D6AD5BFFBC6EDDBABB8DA6D023F4E84195E91E9CEF0C767CDE5856C37708CF8B43BD5D42D82E56032B56ACF8952B30D4B1D75F7F7DDFC68D1B7F3C7CF8704981BBD03BEFBC933CF8E083B7CC7E0B3D428F1E5499EDC172978D6472D9492E970B9979E5483A44B7B6B6263B76EC488E1D3B965CBA7429B976EDDAC4B5F6FAF5EB137F893E79F264B26BD7AEA4BDBDBD307C8F99FD863A75E8D0A17FDFB2654B72FEFCF9A412BEFCF2CB64F3E6CDB71F7FFCF127056FA147E8D1832A533D38DB8D94B5FE3E8D12BA9785B07C3B1DB87B7B7B279675CEC5E8E8E8C4D7C7E7A5037808DF0F48395047F6EEDDFBFB871F7EF8C7B9BEB8E72A7EBF7803E6860D1B32FDA2177A841E3DA832D48395DE9D241333DF9333DD53A1BBB3B37362767B3EE2F3E272D182F06DE61BEAC12BAFBCF2EB8D1B37FE50A999EE6233DFEBD6ADBB1E5EF4F708DE4AE8D183AAA97BB0F0C6C89F855A33F9B11485CF6BEA1B2E27D7744F2D2FE9EEEE9E5A4E325F71194A4F4F4FE1B293CC5E87A16E3CF5D45323714D7735C535DFEBD7AFFF93E0AD841E3DA89AB6070B67A663687E355432F971AEE17BBAE7356DF89EDCB9646AA6BBDCD09D0EDF0533DF03520F2CA0DDBB773FB17DFBF61F6FDDBA9554DBA38F3EFAB7ACFEA94BE8117AF4A06AF21E2CB61C64CD64784E4A08DFE9D09DAFD5A9C79B6ECD77DC3230BDA67BBECB4B665A76925EF36DC9092CA0A79F7EFA6ADC32B0163EFAE8A3E481071EF858F056428F1ED4834DD583D385E162217AA6F05DECEBF715F9FAA65AF39D9EED8E374656435F5F9F596F5868FBF7EFFFBB78436539DB06966AD3A64D7F8D6BD99A691CE32FCD507F2FF4083DF5DA7F7A500F56B297A609DD4B4B08D3C5C2F75C437761F85EDAC8AFCF78D264FE86CA382B7DF5EAD5AA5C7BE36E27055B0D36D575181AC28B2FBEB82F486AE9D5575FBD1A8FB56DA6714CFDF9AE3F97CBFD46E8117AEAADFFF4A01EAC642FCD23FCCE16BE4B0DDDE99F3F52CF33DFB38DE9E431F0135FB373E7CEAA5E7FE33EDFA9E0DD54D7616808CF3CF3CC85780C7C2DC5652DAB57AFFE633306EF54BD5D38C321F4083D0BD97F7A500F56B2970A42F75C43EF74E1FBE7F30CDD8533EECB1AF1F519FEFB40FEB1E3C78F57F5FA1B0FD949FD7F1C9682A0C6366DDA746D6868A8A6C13BEEEBDDDADA3AD4E4C17B6A8623FF0B56E8117A16B2FFF4A01EAC642F2D9AFF1AEB62E1FB5C19A1BBDCFF9F051FD3F0EF0BF9CF55FAA6CA42F184CBD4FFC36529086A6CF5EAD5DF8F8F8FD73478C79F177ED9DCCC42F04ECF70BCF1C61BC286D0B360FD17FFC42D78EBC14AF4D2E2C58BB79519728B85EF72427761F85EDA6063FA7DFEDF95DA4270A6AD05533F775C0A8205F885B010E6F08BA8694BE0A89FD093B5DE13BCEBAB1AB187EEBBEFBE89807CF7DD7797FBA6E1E74566BACF4D7EBE1CBBE2F76AD4D768ADAFBF5210D4587B7BFBED8598F10E2FF81B1999F13E9BCBE5962D59B2E4AE460B3DD3CC46CDF971B38DF5D57FF1EB046F3D58A15E2AF738F89966BC4B3964A7D167BC27C6349E2669C61B3262E3C68DDF2EC41AEF969696C1260FDE77049E460C3DC5427461F09ECB73849EFAE8BF7AECC172DFDC35FA9BC30609DE457B6932E48E2DAACE1AEFF984EF465AE37DC7985AE30D19F2C8238F9CAAF5AE26A74E9DBADC6C7753A77E919D8A279015B94809DE82F782F65FBD06EF727AACD17BB4CE83F78CBD34CF19E6E9B60C2CB6AB4929E1BB517635293AA67635810CD9BC79F3937BF7EEFDA196C17BF7EEDD1F35E13EDED3CD0A09DE82775DF49FE02D7857B297E631D33CDB3EDDA59E709977EFA2FADFC77BC631B58F3764483C316BD3A64DDFD5F2E4CA8E8E8EC12C9E9825780BDE7A50F06ED21E9C6DC679AE87E3941ABEF3CB5D9637FA75D8C99590211B366C381B0FB5A9853367CE7C1C5EECEF67719C056FC15B0F0ADE4DDC83D3CD7C977A22E55CC377FEE72D6F86C18B7B7AE703716F6F6F55AEBF7D7D7DE9D03D20FDC0C2BDE0976FDDBAF55A2D66BDD7AE5DFB59F8796D82B7E02DF4E841C1BBE97A30CE7C172EFB58B3A8F47DBA8B85EFD525CCB037E475381F8AE3AC77A56FB28CDF2F7EDFD4E13D99BC0E43DD686F6F3F79E8D0A11BD50CDDFBF7EF7F2FBECB2E61EDA0D0633B41A147F016BC1B2F7CA76FB84C87E8520EC799EE7975B965602584EBE3BBF960DCD9D959B1AD05E316825D5D5D77CC7667F53A0CF5F4825FBC66CD9A6FCF9F3F5F9569EFCF3FFFFCE2AA55ABBE0EEFB2EFC9EA18DB4359F0D683B613CC480F162E3BF9D9E48C75A95B04163EAFDCFDC3EBFE3A1C6A241F90BBBBBBCB0EDF3174F7F4F4A443F75896AFC3505772B9DCCAF5EBD78FC67DB62BE9CA952B436D6D6D5F65FD4F5B82B7E0AD0755867AB0D2FB6A175BC6D294D7E1FC8D96F999EFF92E3B89CF2B98E9B6C404EAF01D77C7DAB56BBF3977EEDCCD4A84EEF3E7CF7F1A4377F865F2DBAC8FADD023F4E84195B11EAC54F8AEDBC371AA751D4E87EFB8363BDE7019772599EBEE25F146CAF49AEE58AEC350C7EFB857AD5AF597B7DE7A6BB08C1B2E6FEFDBB7EF0FE1DDF595F84BC4A80A3D428F1E5499ECC172978734F5F29299AEC3A146D3C13906E9B8CF773C6427CE66E797A1C4E524F144CA7838CE9E3D7BE296BD8527658EB90E43FDBFE35E1CB7375ABF7EFDA5B367CF5E292571BFFFFEFBEFAD59B3E67FE30D1CD692093D428F1E5499EFC1F9EE42D2B4375296721D2E72E47C29E53A0C0DF6C2BF3FBEF04390BEF2FCF3CF9F3D71E2C4B9AF82F1F1F1DB31647FF7DD77DF0C0D0D7D193E3FF0C20B2F1C696B6BFB32BED0E3BB6B774D0B3D428F1E547AB020442FABD2D737FD7538BDFC642E81DB75181A583C592BBCF0B78517F2815017438D4FBEB8E3C7CBA10EC7E3679D8425F4083D7A50E9C132C3743C06BEE14FA4741D06107A94E0ADF4E0425A3A19AA97CEF0F888D00D80D023F4E841A507CB37DDCCB7E52500083D428F1E547AB0CAE15BE80640E8117AF4A0D283550EDFBB846E00841EA1470F2A3D585D714D77B228A35B060220F4083D7A50E9C15AFA85210040E8117AF4A0D2830020F428A1470FEA410040E8117AF4A0D2830020F428C15BE94100107A94D0A307F5200020F4083D7A50E94100107A94D0A307F5200008DEC286D0A30795E00D00428FD0A307951E0400A147093D7A500F0200428FD0A307951E0400A147093D7A500F0280D0A3841E3DA8070100A147E8D1834A0F024043397AF4A8B0513F351E42CF6DC15B09DE00D0844E9C3831343C3C2C70D4410D0E0EBE1942CF67DEFC296FFE00A0091D3B76EC9F8E1F3FFEEDD75F7FFD9DD0B170612786EE23478EFC39D4FDDEFC296FFE00A04985B0B72C5C6CCFC699AEF8676655F38AE3FE591643B7377FDEFC0100E0CD9F377F0000000000000000000000000000000000000000000000000000FCBFFF03EA6496A66B380A380000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('673b97fa-a9eb-11ec-bd2b-60f262a4e51a', 1, 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', '673b97f9-a9eb-11ec-bd2b-60f262a4e51a', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0D0A20203C70726F636573732069643D224C6561766522206E616D653D224C6561766550726F636573732220697345786563757461626C653D2274727565223E0D0A202020203C757365725461736B2069643D226C656176655461736B22206E616D653D22E8AFB7E581872220666C6F7761626C653A61737369676E65653D22247B6C656176655461736B7D222F3E0D0A202020203C757365725461736B2069643D226D616E616765725461736B22206E616D653D22E7BB8FE79086E5AEA1E6A0B8222F3E0D0A202020203C6578636C7573697665476174657761792069643D226D616E616765724A756467655461736B222F3E0D0A202020203C656E644576656E742069643D22656E644C6561766522206E616D653D22E7BB93E69D9F222F3E0D0A202020203C73746172744576656E742069643D2273746172744C6561766522206E616D653D22E5BC80E5A78B222F3E0D0A202020203C73657175656E6365466C6F772069643D226D6F6465466C6F772220736F757263655265663D226C656176655461736B22207461726765745265663D226D616E616765725461736B222F3E0D0A202020203C73657175656E6365466C6F772069643D22666C6F7753746172742220736F757263655265663D2273746172744C6561766522207461726765745265663D226C656176655461736B222F3E0D0A202020203C73657175656E6365466C6F772069643D226A75676465466C6F772220736F757263655265663D226D616E616765725461736B22207461726765745265663D226D616E616765724A756467655461736B222F3E0D0A202020203C656E644576656E742069643D22656E644C6561766532222F3E0D0A202020203C73657175656E6365466C6F772069643D22666C6F77456E6422206E616D653D22E9809AE8BF872220736F757263655265663D226D616E616765724A756467655461736B22207461726765745265663D22656E644C65617665223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B636865636B526573756C743D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D2272656A656374466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226D616E616765724A756467655461736B22207461726765745265663D22656E644C6561766532223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B636865636B526573756C743D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A20203C2F70726F636573733E0D0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F70726F63657373223E0D0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D224C65617665222069643D2242504D4E506C616E655F70726F63657373223E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226C656176655461736B222069643D2242504D4E53686170655F6C656176655461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2239352E30222077696474683D223130302E302220783D223330342E363038312220793D223132322E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D616E616765725461736B222069643D2242504D4E53686170655F6D616E616765725461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D223130352E30222077696474683D223132352E302220783D223436352E302220793D223132322E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D616E616765724A756467655461736B222069643D2242504D4E53686170655F6D616E616765724A756467655461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223631312E352220793D223134322E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E644C65617665222069643D2242504D4E53686170655F656E644C65617665223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223639362E352220793D223134382E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172744C65617665222069643D2242504D4E53686170655F73746172744C65617665223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223137382E32323536362220793D223134372E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E644C6561766532222069643D2242504D4E53686170655F656E644C6561766532223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223631372E352220793D2237332E3332303938323835373533353732222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F77456E64222069643D2242504D4E456467655F666C6F77456E64223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223635312E313231373934383731373934392220793D223136322E3337383230353132383230353134222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223639362E353030323833393738353339342220793D223136322E30383931373031363537343138222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2272656A656374466C6F77222069643D2242504D4E456467655F72656A656374466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223633312E3836363039333537373738362220793D223134322E3336363039333537373738363037222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223633312E353933313039303237363939332220793D223130312E3332303637333233363537343835222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226D6F6465466C6F77222069643D2242504D4E456467655F6D6F6465466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223430342E363038312220793D223136392E35222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223436352E302220793D223137342E35222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F775374617274222069643D2242504D4E456467655F666C6F775374617274223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223230382E32323536362220793D223136392E3530303032222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223330342E363038312220793D223136392E35222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A75676465466C6F77222069643D2242504D4E456467655F6A75676465466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223539302E302220793D223137342E3738303434222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223631312E393134313633303930313238382220793D223136322E3431343136333039303132383737222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A202020203C2F62706D6E64693A42504D4E506C616E653E0D0A20203C2F62706D6E64693A42504D4E4469616772616D3E0D0A3C2F646566696E6974696F6E733E0D0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('677322bb-a9eb-11ec-bd2b-60f262a4e51a', 1, 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.Leave.png', '673b97f9-a9eb-11ec-bd2b-60f262a4e51a', 0x89504E470D0A1A0A0000000D49484452000002DE000000ED080600000088E572750000164A4944415478DAEDDD0B8C54D77907701CBB6A55A56A5A55E943694AAB54B5AA547DC451D2D656691BC958C2895B19D6CB2EB080033436D8A660C7F1035A7BEB0457C53851531B5C9B0415D748A114357EF030061340C489E3C4750D8971205B30844020B03C6CDF9E6F7B070DE37DCCECCE0CBB33BF9FF469C63BB30F5D7F33F7CF9973CF19350A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000809A686B6B7B5F4B4BCB8DD75D77DDAA54BB531D4F95A5EA4EB5273DB63ADDCE8BE7395A000050A1D6D6D66B52ADCB037656663D9BBEA7DDD103008001A4F03C3AD5931584EDDE6ACBF8F1E33FE0680200402F5A5A5A5266BEEE5071886E6B6BCBEEBBEFBE6CE3C68DD9DEBD7BB363C78E65E1C4891359575757B675EBD66CF1E2C5D9A449934AC3F771A3DF0000F0CED03D2E85E5B3C5817BC58A15D9C18307B3721C3972A4E7F9F17DC5013C85EFEB1D5D000018756EA4FB5CE89E3B776ECFE8F660C4F7CD9F3FBF347C1BF90600A0B9E573BACF4D2F59B060C1B9E9248315D3503A3B3B4BA79D5CEA680300D0B4F2954BCE8D740F35741787EF9291EF2D8E360000CD1ABAAF299ED33DD8E925FD4D3B299EF36DCA090000CD1ABCCF8D76C78591B5B072E54AA3DE000034AFD869B27041658C4A1F3E7CB826C13B563B29596A70B4A30F0040D3C8B781EF09C38B162DCA6A29D6F92E0ADEF31C7D00009A460AC0AB0A6178D3A64D350DDEB1C94E51F05EEBE80300D04CC17B77210C57FBA2CA52B1C36551F0DEE7E80300D04CC1FB78210C576B09C1FE96162C0ADEDD8E3E0000CD14BCCF85E17A28FE7D8E3E0000CD14BC8D780300401D82B739DE00005087E06D55130000A835EB780300401DD8B9120000EAA4B5B5755D2110AF58B1A226C17BE5CA95C5A17B8BA30E00403306EF6B0AA13846BDAB7D9165FCBCF8B985DF917E5FBBA30E0040534A81F8D942309E3B776ED596168C2504E7CF9F7FDE68F79831632E71C4010068D6E03D3AD5A142405EB060C190C37784EECECECEE2D07DBCB5B5F552471B0080A6D6D2D2725DE142CBC2C8F760A79DC4F7958C749B62020000052920771487EF989B1D175CC6AA24E5AE5E12175216CFE98E4AA1FED38E2E0000148991EF54478A837304E958E73B36D989D1ECC23494984E123B52C6E6380F3EF860D6D1D1715EE0CEB7A4EF70540100A01731E7BB7899C141D61673BA0100A0BC007E6D1EC0CF5612B86394DBEA25000050A1D8E13205F09B53A05E956A4FAAEEA2A0BD2FD5DAD806DE8E94000050452D2D2D1F2D8C82A7403ED611010080DA04EFD54523DE3B1D110000A8B214B42F2B9DF39D82F83847060000AA1BBCD7F67241E54E1753020040F542F7657DAD70D2DADA7A8D23040000D509DE4FF6B38CE03647080000861EBA2F1B683D6F73BD010060E8C17B6D199BE758E10400006A10C63347010000046F000010BC010000C11B0000046F000010BC010000C11B0000046F000040F0060000C11B0000046F001840966597BCF6DA6BABB66FDFFED6860D1BB275EBD6A93AD7FAF5EBB3CD9B37FF3055BB1ED483FA5CF006A04145E0D9B2654B76F0E0C1ECF4E9D3EA02D5A14387B2E79E7BEEC7299C5CAB07953E17BC01684031CA28F00C9B50727ADDBA75AFE841A5CF056F001A507CB42F0C0C9F4A81E4AC1E54FA5CF006A001C5DC4B41605805924C0F2A7D2E7803D0C4A1E72747F767AFED7C347B79FDDFF754DC8FAF091182B71E548237005429F41C3FD2957DE7E9BBB26FFDD7FCF32ABE168F091282B71E548237005421F4EC7BF93FDF11780AF58397D70A1282B71E548237005423F4BCF2ECE7FA0C3DF198202178EB41257803401542CF77D62DEC33F4C4638284E0AD0795E00D00428F40A207953E17BC011819A1275690E82BF4C4638284E0AD0795E00D0055083DBBB77EA1CFD0138F091282B71E548237005421F41CEE7A29FBCE330BDEF9117FFA5A3C264808DE7A5009DE005085D013B5E7EB5F7A47E889AF091182B71E54823700542BF49C3A95EDFEDA17DFF9117FFA5A3C264808DE7A5009DE0030C4D013BB02EEDAFAF93EE7D7C663760E14BCF5A012BC0160B0A1E7D4A96CFFEE8DD9B79FFA4C9F81A750F19C78AE9147C15B0F2AC11B002A083D038D301A791448F4A012BC01A00AA1A79C11C6FE461E050BC15B0FAA06E8F3F708DE00D43CF40C36F0144AB010BCF5A01AE17D3E365526780350F3D0A304123DA89AB8CF3F96EA48AAC5F9ED38670A00841E81440F2A7D5E9BD03DAE68E4FB90F00D80D02390E841A5CF6B17BA07FA3A00083D02891E54FABC42630708D785C7C73A6B0075B563C78EF1CB962DFB6A6767E7A1D9B3679FE9E8E8E8B900A5BDBDFDED4F7DEA5367EEBEFBEE7D0F3CF0C0EAC71F7FFCC38E96D0A3046F3DA886799F971BAA8D7CF7A2ADADED7D2D2D2D37A61CB02AD5EE54C72313A4EA4EB5273DB63ADDCE8BE7395A5081471F7D74D1C2850B4FDC7CF3CDD9430F3D946DDFBE3DEBEAEACABABBBBB310B7070F1ECC5E78E1856CF9F2E5593CEFD65B6F7D23D5CD8E9ED0A3046F3DA886619F7FACC291EC4A9FDFB05A5B5BAF49B52E85EA5379D02EA79E4DDFD3EECC0BFD58BD7AF55FA6C07D74FEFCF93DA1FACD37DFCCCAF5E28B2F66B7DF7EFBDB73E6CCF9FEB469D37EC7D1147A94E0AD07D530E9F3C18E60C7F71D6FD6F09DC2F3E8544F5610B67BAB2DE3C78FFF8033309478ECB1C796CD9C39F3EDB56BD75614B84B3DF5D453D9273FF9C93346BF851E2578EB41350CFA7CA8D3469A72DA494B4B4BCACCD71D2A0ED16D6D6DD97DF7DD976DDCB831DBBB776F76ECD8B19EF3FE8913277A3E15DFBA756BB678F1E26CD2A449A5E1FBB8D16F28B266CD9A2FCF9E3D3BDBB56B57560DAFBFFE7A76C30D379CBDEDB6DB3EE3E80A3D4AF0D683FAFC0219E842CA7AFF9C9112BAC7A5B07CB63870AF58B1A2678A69398E1C39D2F3FCF8BEE2009EC2F7F5CEC434BDA54B977EE1C61B6F7CBBDC1754B9E2E7C505983366CCF042137A94E0AD07F5F9850ADDD59A26D21423DFF948F7B9D03D77EEDC9ED1EDC188EF8BA9AB25E1DBC837CDEBE1871FFEF0CC9933DFAAD648776F23DFD3A64D3B915E68973ADA428F12BCF5A03EAF93D20B232F4A3525BFAD44E9F735F40597F99CEE73D34B162C58706E3AC960C53494CECECED269273201CDE98E3BEE381473BA6B29E67C4F9F3EFD5B8EB6D0A3046F3DA8CFEB18BAC71585E7475265F96DB9E1BBAFEF6BD8F09DAF5C726EA47BA8A1BB387C978C7C6F7146A6E92C59B2E4F679F3E6BD7DE6CC99ACD66EB9E5969FF87849E85182B71ED4E7750EDDA3F211EBACA8CA09DFC5A1BB50938B1E6FB839DFB16460F19CEEC14E2FE96FDA49F19C6F9980A673E79D771E8E2503EBE1A5975ECAAEBFFEFA6F3BEA428F12BCFDBFD7E735D25718EE2D44F717BE7B7BFEB25E9EDF5073BE8B47BBE3C2C85A58B972A5516F9AD3F2E5CBFF302EA81CCAB281959A356BD68F63FE98A32FF428C15BE9F31A85EEB11584E9DEC277B9A1BB347C0FEB692711AA535DDED7E3B1D364E182CA18953E7CF8704D7240AC7652B2D4A04C4073B8FFFEFB9725593D3DF2C82387632B59475FE85182B7D2E755546EF81D287C571ABA8B7FFFA1E13CF25D34BD635D4B4BCB474B1FCFB781EF79CEA2458B6A9A05629DEFA2E02D13D01CEEBAEBAEDDB10D7C3DC5B496C993273FEDE80B3D4AF056FABCCAA1BBDCD0DB57F87ED7204377E988FBB00CDFBDEC26F964F10878FAEF5585C7366DDA54D32C109BEC14FD1D6B9D99690AB366CD3AB67FFFFEBA06EF58D7BBADAD6DBFA32FF428C15BE9F3FE4C9830E163B1D9CAF8F1E3DF5DC5D0DD5FF87E7508A17BA87FCF8508DEE746C02380A7FBBB0B5FABF64595A56287CBA2BF619F33334D61F2E4C96F767777D73578C7EF4B2FF0D38E7ECDDE58470B3D82B7E0AD1AA1CFF34D5C7AD67C8E51D15801A324840F7584B9B7F03D94D05D1ABEC70EB3F3433640BD59B85FAD2504FB5B5AB0E8F7763B7BD32C212DBB10E2F73AFA35FB7FFA6C3E7FEF83428FE02D78AB111EBC3FD84B388C10FEC52BAFBC726C1E90170FB11DDFD5CB48F7ABF9D78722FEAEAC8CB03B2CAB5E59A050CEDE34854993269DADF788F7C993270B2FB413F9CE58AFA7FAEF543B53607C2EDD7E35E699A5FBCBD3ED3FA737DE7F4CF7FF2EDDBF2DBFF0635AAA74B7655CFAFA5FA4FB1F696B6BFBBD891327FED6F8F1E37FE5E31FFFF8CFA5DB8B9B3878BF921FDFB3E9182D4DC7E897841EC15BF05623B1CFE3FDABBF7078F9E5971FB8F8E28B4FBDFFFDEF9F3DC8F7FDFE46BC2BD96467A48F78EF8C736AFE8F1A23DE502B3367CE3C7A21E678A737D3AEABAFBEFA67E34D3505E6DF486F98BF9B5E7897A5FFFEB3F4E2BF2ADDBF36DD4E4EF537E96B7F9B6EEF4EF5B9F4F5CFA7FFFED774FB787CEC986A43AAEDE9B197D2EDF7521D488F1FCB3F2E3B952A5650D997BEF63FE9F61BB15E68AAA7537D25D597533D94EA9FD2E3F7A6BA3DFD9C9B623E61FADAC474FF1331BF30DDFF9374FFF7D3DFF9DBE9FEAF757474BC67C68C193F358C83F79EE237D4F4B71F49F5E9E28F67851EC15BF05623A5CF0BCBDBF55563C68C397BC92597BC7DC515579CAA307C9733C77B30E17B24CDF1EE09DCE9185E923F6E8E37D4D24D37DDB4ADDEAB9A6CDBB66D5F3DAE60BEEAAAAB7E3ABD09FF62AC4B9A6E7F27BDB9FC515C3C9202F495E9F7FF55CC154CB73352DD921EBB23DDFE43AA25314A9C6EFF2DD57FE41B096C4DF562AA5DA9BA521D4D75263F191CCDBFB63B7FCED7F2EF5993FF8C65F133F39F7D67FCAEF4F8CCF8DDE9F7FC75FEB75C117F5BFC8DE9FEAFC7DF9CC2FDCF0CE18D757F1F27A838EEB3E20D56E811BC056F35DCFA3CDE9BD2FBDF6F4E9830E1CFD37BE2D4F8A433FFE4F3783FC17B570C92BCF7BDEF6DAB7084B9AF25037B5BD5A492F03D525635D9163B54160277D1E35635815ABAE1861B3EB374E9D2B7EA19BC972C59F25223ACD919A3DEE924F1F3310A9E6E3F10A3E2E98DEC8F63943C4E04ADFF2F46CFE7C4687ABABD2746D7D363FF928FB67F25DD7F2A1F857F211F95DF9B8FD277E7A3F671C23990EAB554DF8ED1FDF4BC8DF968FFBFE7A3FF5FC83F0D5810C775A0797BE9B9DF7CF8E187B353A74E090382B7E0ADEA564F3FFD74D65BB0CEA7187E3FFF9432A61E6E4AF558AA85A93A52EDE8639EF7AC92E058EE48F340EB7457BAC365C165A386FF3ADEE78D7097B28E37D4588C06CF9A35EB643D77AEECE8E8E8B24BD5C0162E5CF8AE98AF9E4E4ABF1CF3D7F38B8C3E929FB4627EFB843879C51B65BA7F6B3E0FFEFE322E9A391D3B92A59F297C0BDEB538B197F5DA16BC9BABE25AA2F6F6F6AC8F603D26FAA6AF30D8CBFBDADA7EFA6CA011E77237C7A9347C47E83F9EEA9A919E09EC5C09B51FB9DD199BDAD4C38E1D3B62D4F67947BD36E2E2D23EC2F6F1FC42CB4B0BA147E816BC6B14BCF7E41F578F16BC55713DF3CC33839DE33DAFE882F11BFB0AE8658C7C57BA2365B9E1BBF0FBAE6984D7703E5DB2E7DCB162C58A9A6481952B57169F9FB6387BD354629ED79C39738ED563D47BEAD4A9AFC4FC6647BD76A38D25813B568DB93F02B9D02378D73178F7BBAA8E1ED4E7159EA3E27A9C6DFD2D91DAC7C877E9B48F29A32A5FA7BBB7F03DB98211F61199090AE79018F5AEF64596F1F3E2E7166DDE2313D07C264D9AB475CD9A35A76A19BA972F5F1EF3F8B694315AC1E0DF302F2DCCE38E91A1BE2ED2147A866520B9A8117A3056D1295D5527F5E5CDA5AF7B3D287857F049DEBB0779C17921148FED254457B2394E5FDF372C970CACD23FA09F2DBC86E7CE9D5BB5A5056309C1F9F3E79F37DA2D13D0B423A553A64C39BA6BD7AE9A0C7B7FF7BBDFDD3371E2C4370A531DA85DF08ED18A819E37D242CFA8DED7D82DFBF191F0117C7A0DBE1517D5E6C1F57FE382DAF4FFF2E5B8F036A667A55A9FEFDCF744BAFD52BE1466AC98F3D97CAE6CAC737F53ACD4932FC5393E3DF7EA7CCBED58CDE743B16C675C2FD0DEDEFEABE9F617F230735195DF4BFABAB6E0BC4FBB046FC1BB4E4AA79D5C948F5857DAF7A5DF37B6514377D1A7A7870AAFDF050B160C397C47E8EEECEC3C6F0AA44C40538BAD79A74F9F7E24D6D9AEA603070EEC4F27FA1FF83869F81889C1BBBFAF0DF4F84809241184639DF808C6B1FA431E943F94C2F39FE6ABE58C8B409D4E5893F2A530E744E0CE57B4F96C7A8D3D10813C5F29E2893CA8AFCB83FBD7F320FFBD3CD8FF285F3DA7AA81BF8C8B7BBF114B690ADE82F7050CDF43D5DB349686CC04C56BA8C7C8F760A79DC4F7958C749B6202F9BF723BA64E9DFAC3575F7DF5743542F7AE5DBB5E8ED01D1BB838BA82B7E03D3CE7785733F00F14BCD373620DFCD382B7E03D42C3F7B0DD1CA75699A0387CC7DCECB8E03256252977F592B890B2784E773E054D2680E27FE5A693EE8F9E78E289AE215C707976D9B2655F4D27D95883BAC35115BC05EFA6B9B8B2B7C01D27EE55E97DE50F466A0FAA86E8F3A14E0F69E8E925FD6582D26B372248C73ADFB1C94E8C6617A6A1C47492D8913236C779F0C10763F9E0DED65F9709A09793E7E8F8887AFAF4E97B77EEDC79A092C4FDFCF3CF3F3765CA946FC64513E66F09DE8277F304EF18352F5D55279DB017F7B6B4A0E02D785FE0F05DE98875C35E4859492628632A597F251340192FB66BE3C59682F4817BEEB967E7E6CD9B5FFD41D2DDDD7D3642F6C993277FB87FFFFED7D3D7B7DC7BEFBDEBDBDBDB5FCF7762EC70A5B2E02D783757F02E5ACE7277AC64D2DF4A148D10BC470DF1A2DF510D7ED1F030EEF34AA78B34D5F492723241F1F4937202B74C00158ADDACE2449A6F8CB127BF282BCB6FF7E53B89CDB3FB94E02D78376FF08E35BBCB3DC1364AF01E4A5F367A5F0FF33E2F374CC736F0237E474A990040F0B69C6003CEF16ED41E14BC1BB2CFC7E6A17A6C3F8F1F12BA0168FAD063EEAB1E14BCF5790D47BE4D2F0140E811BCF5A0E0ADCF6B1CBE856E00841EC15B0F0ADE82778DC3F762A11B00A147F0D68382B7E05D5B31A73B1BD5A44B060220F408DE7AD072829613ACA7F738430020F408DE7A50E97300107A9440A207953E0700A14720D1834A9F0380D0A3046FA5CF0140E85102891E54FA1C00841E81440F2A7D0E00428F1248F4A012BC0110BC050181440F2A7D0E00428F40A207953E0700A14709247A50E97300107A04123DA8F43900083D4A20D183FA1C00841E2590E841A5CF0140E81148F4A0D2E70020F42881440F2A7D0E00428F40A207953E0700A1472011BC953E0700A14709247A50E97300107A04123DA8F43900083D4A20D1834AF00640F05602891E54FA1C00841E81440F2A7D0E00428F1248F4A0D2E70020F408247A50E97300107A9440A207F53900083D4A20D1834A9F0380D02390E841A5CF0140E85102891E54FA1C00841E81440F2A7D0E00428F40A207953E078086B361C3064160F854770A2467056F2578034003DABC79F3FE83070F0A03C3A0BABABA1E4F81E415C15B09DE00D080366EDCF8894D9B361D7DE38D374E0A04176EA43B42F7FAF5EBBF9FEA5AC15B09DE00D0A052D81B974E843B639A439C1055DD2B8EFB2BCD18BA056FC11B0000C15B09DE000082B712BC010010BC95E00D0020782BC11B0040F0568237000082B712BC01004624BBA7DAA11500803AB07BAA1D5A0100A803BBA7DAA11500803AB17BAA1D5A010000000000000000000000000000000000000000000000000086B5FF032057D3B4256550CD0000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('b71535e8-bbc3-11ec-9743-60f262a4e51a', 1, 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', 'b71535e7-bbc3-11ec-9743-60f262a4e51a', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0D0A20203C70726F636573732069643D224C6561766522206E616D653D224C6561766550726F636573732220697345786563757461626C653D2274727565223E0D0A202020203C757365725461736B2069643D226C656176655461736B22206E616D653D22E5ADA6E7949FE68F90E587BAE997AEE9A2982220666C6F7761626C653A61737369676E65653D22247B6C656176655461736B7D222F3E0D0A202020203C757365725461736B2069643D226D616E616765725461736B22206E616D653D22E5B7A5E4BD9CE4BABAE59198E5A484E79086222F3E0D0A202020203C6578636C7573697665476174657761792069643D226D616E616765724A756467655461736B222F3E0D0A202020203C656E644576656E742069643D22656E644C6561766522206E616D653D22E7BB93E69D9F222F3E0D0A202020203C73746172744576656E742069643D2273746172744C6561766522206E616D653D22E5BC80E5A78B222F3E0D0A202020203C73657175656E6365466C6F772069643D226D6F6465466C6F772220736F757263655265663D226C656176655461736B22207461726765745265663D226D616E616765725461736B222F3E0D0A202020203C73657175656E6365466C6F772069643D22666C6F7753746172742220736F757263655265663D2273746172744C6561766522207461726765745265663D226C656176655461736B222F3E0D0A202020203C73657175656E6365466C6F772069643D226A75676465466C6F772220736F757263655265663D226D616E616765725461736B22207461726765745265663D226D616E616765724A756467655461736B222F3E0D0A202020203C656E644576656E742069643D22656E644C6561766532222F3E0D0A202020203C73657175656E6365466C6F772069643D22666C6F77456E6422206E616D653D22E9809AE8BF872220736F757263655265663D226D616E616765724A756467655461736B22207461726765745265663D22656E644C65617665223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B636865636B526573756C743D3D27E9809AE8BF87277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D2272656A656374466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226D616E616765724A756467655461736B22207461726765745265663D22656E644C6561766532223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B636865636B526573756C743D3D27E9A9B3E59B9E277D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A20203C2F70726F636573733E0D0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F70726F63657373223E0D0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D224C65617665222069643D2242504D4E506C616E655F70726F63657373223E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226C656176655461736B222069643D2242504D4E53686170655F6C656176655461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2239352E30222077696474683D223130302E302220783D223330342E363038312220793D223132322E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D616E616765725461736B222069643D2242504D4E53686170655F6D616E616765725461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D223130352E30222077696474683D223132352E302220783D223436352E302220793D223132322E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D616E616765724A756467655461736B222069643D2242504D4E53686170655F6D616E616765724A756467655461736B223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223631312E352220793D223134322E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E644C65617665222069643D2242504D4E53686170655F656E644C65617665223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223639362E352220793D223134382E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172744C65617665222069643D2242504D4E53686170655F73746172744C65617665223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223137382E32323536362220793D223134372E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E644C6561766532222069643D2242504D4E53686170655F656E644C6561766532223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223631372E352220793D2237332E3332303938323835373533353732222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F77456E64222069643D2242504D4E456467655F666C6F77456E64223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223635312E313231373934383731373934392220793D223136322E3337383230353132383230353134222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223639362E353030323833393738353339342220793D223136322E30383931373031363537343138222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2272656A656374466C6F77222069643D2242504D4E456467655F72656A656374466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223633312E3836363039333537373738362220793D223134322E3336363039333537373738363037222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223633312E353933313039303237363939332220793D223130312E3332303637333233363537343835222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226D6F6465466C6F77222069643D2242504D4E456467655F6D6F6465466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223430342E363038312220793D223136392E35222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223436352E302220793D223137342E35222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F775374617274222069643D2242504D4E456467655F666C6F775374617274223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223230382E32323536362220793D223136392E3530303032222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223330342E363038312220793D223136392E35222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A75676465466C6F77222069643D2242504D4E456467655F6A75676465466C6F77223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223539302E302220793D223137342E3738303434222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223631312E393134313633303930313238382220793D223136322E3431343136333039303132383737222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A202020203C2F62706D6E64693A42504D4E506C616E653E0D0A20203C2F62706D6E64693A42504D4E4469616772616D3E0D0A3C2F646566696E6974696F6E733E0D0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('b7ab8279-bbc3-11ec-9743-60f262a4e51a', 1, 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.Leave.png', 'b71535e7-bbc3-11ec-9743-60f262a4e51a', 0x89504E470D0A1A0A0000000D49484452000002DE000000ED080600000088E57275000016424944415478DAEDDD0B8C54D77907701CBB6A55A56A5A55E943694AAB54B5AA547DC451D2D656691BC958C2895B79592FBBC0020ED0D8609B821DC78FA5B5B74E70558C1335B5C1B54950718D144A51E3070F633001449C384E5CD7901807B20543080402CBC3F6EDF9B677D030DEC7CCEECCB0BBF3FB499F66BC33FBD0F53773FF9C39F79C3163000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A889D6D6D6F7353737DF78DD75D7AD4AB53BD5F15459AAEE547BD263ABD3EDFC789EA3050000156A6969B926D5BA3C606765D6B3E97BDA1C3D000018400ACF63533D5941D8EEADB63435357DC0D10400805E343737A7CC7CDDA1E210DDDADA9ADD77DF7DD9C68D1BB3BD7BF766C78E1DCBC2891327B2AEAEAE6CEBD6ADD9E2C58BB3C993279786EFE346BF0100E09DA17B420ACB678B03F78A152BB283070F66E53872E448CFF3E3FB8A03780ADFD73BBA000030E6DC48F7B9D03D6FDEBC9ED1EDC188EF5BB0604169F836F20D004063CBE7749F9B5ED2D1D1716E3AC960C53494CECECED26927973ADA000034AC7CE5927323DD430DDDC5E1BB64E47B8BA30D0040A386EE6B8AE7740F767A497FD34E8AE77C9B72020040A306EF73A3DD7161642DAC5CB9D2A83700008D2B769A2C5C5019A3D2870F1FAE49F08ED54E4A961A1CEBE80300D030F26DE07BC2F0A2458BB25A8A75BE8B82F77C471F0080869102F0AA4218DEB469534D83776CB25314BCD73AFA00003452F0DE5D08C3D5BEA8B254EC705914BCF739FA00003452F03E5E08C3D55A42B0BFA5058B8277B7A30F00402305EF7361B81E8A7F9FA30F004023056F23DE00005087E06D8E370000D421785BD50400006ACD3ADE0000500776AE0400803A696969595708C42B56ACA849F05EB9726571E8DEE2A80300D088C1FB9A42288E51EF6A5F64193F2F7E6EE177A4DFD7E6A80300D09052207EB6108CE7CD9B57B5A5056309C1050B169C37DA3D6EDCB84B1C7100001A35788F4D75A810903B3A3A861CBE23747776761687EEE32D2D2D973ADA000034B4E6E6E6EB0A175A1646BE073BED24BEAF64A4DB14130000284801B9BD387CC7DCECB8E03256252977F592B890B2784E77540AF59F76740100A0488C7CA73A521C9C2348C73ADFB1C94E8C6617A6A1C47492D8913236C779F0C107B3F6F6F6F30277BE257DBBA30A0000BD8839DFC5CB0C0EB2B698D30D0000E505F06BF3007EB692C01DA3DC562F0100800AC50E972980DF9C02F5AA547B52751705ED7DA9D6C636F076A40400802A6A6E6EFE6861143C05F2F18E080000D42678AF2E1AF1DEE98800004095A5A07D59E99CEF14C4273832000050DDE0BDB6970B2A77BA98120000AA17BA2FEB6B85939696966B1C210000A84EF07EB29F6504B73942000030F4D07DD940EB799BEB0D0000430FDE6BCBD83CC70A2700005083309E390A00002078030080E00D000008DE00002078030080E00D000008DE000020780300008237000008DE0000207803C000B22CBBE4B5D75E5BB57DFBF6B7366CD890AD5BB74ED5B9D6AF5F9F6DDEBCF987A9DAF4A01ED4E7823700A354049E2D5BB664070F1ECC4E9F3EAD2E501D3A74287BEEB9E77E9CC2C9B57A50E973C11B8051284619059E61134A4EAF5BB7EE153DA8F4B9E00DC028141FED0B03C3A7522039AB07953E17BC01188562EEA52030AC0249A607953E17BC0168E0D0F393A3FBB3D7763E9ABDBCFEEF7B2AEEC7D78408C15B0F2AC11B00AA147A8E1FE9CABEF3F45DD9B7FE6BC179155F8BC70409C15B0F2AC11B00AA107AF6BDFC9FEF083C85FAC1CB6B0509C15B0F2AC11B00AA117A5E79F6737D869E784C9010BCF5A012BC01A00AA1E73BEB16F6197AE2314142F0D6834AF00600A14720D1834A9F0BDE008C8CD0132B48F4157AE2314142F0D6834AF006802A849EDD5BBFD067E889C70409C15B0F2AC11B00AA107A0E77BD947DE7998E777EC49FBE168F091282B71E548237005421F444EDF9FA97DE117AE26B4284E0AD0795E00D00D50A3DA74E65BBBFF6C5777EC49FBE168F091282B71E548237000C31F4C4AE80BBB67EBECFF9B5F1989D03056F3DA8046F00186CE839752ADBBF7B63F6EDA73ED367E029543C279E6BE451F0D6834AF006800A42CF40238C461E05123DA8046F00A842E8296784B1BF9147C142F0D6836A14F4F97B046F006A1E7A061B780A255808DE7A508DF03E1F9F2A13BC01A879E85102891E540DDCE71F4B7524D5E2FC7682330500428F40A207953EAF4DE89E5034F27D48F80640E81148F4A0D2E7B50BDD037D1D00841E81440F2A7D5EA1F10384EBC2E3E39D3580BADAB16347D3B265CBBEDAD9D97968CE9C3967DADBDB7B2E40696B6B7BFB539FFAD499BBEFBE7BDF030F3CB0FAF1C71FFFB0A325F428C15B0FAA61DEE7E5866A23DFBD686D6D7D5F7373F38D2907AC4AB53BD5F1C804A9BA53ED498FAD4EB7F3E3798E1654E0D1471F5DB470E1C21337DF7C73F6D0430F65DBB76FCFBABABAB2EEEEEE2CC4EDC18307B3175E78215BBE7C7916CFBBF5D65BDF4875B3A327F428C15B0FAA61D8E71FAB7024BBD2E78F5A2D2D2DD7A45A9742F5A93C689753CFA6EF6973E6857EAC5EBDFA2F53E03EBA60C1829E50FDE69B6F66E57AF1C517B3DB6FBFFDEDB973E77E7FFAF4E9BFE3680A3D4AF0D6836A98F4F96047B0E3FB8E376AF84EE1796CAA272B08DBBDD596A6A6A60F38034389C71E7B6CD9AC59B3DE5EBB766D4581BBD4534F3D957DF2939F3C63F45BE85182B71E54C3A0CF873A6DA421A79D343737A7CC7CDDA1E210DDDADA9ADD77DF7DD9C68D1BB3BD7BF766C78E1DEB39EF9F3871A2E753F1AD5BB7668B172FCE264F9E5C1ABE8F1BFD86226BD6ACF9F29C3973B25DBB7665D5F0FAEBAF6737DC70C3D9DB6EBBED338EAED0A3046F3DA8CF2F90812EA4ACF7CF1929A17B420ACB678B03F78A152B7AA69896E3C891233DCF8FEF2B0EE0297C5FEF4C4CC35BBA74E9176EBCF1C6B7CB7D41952B7E5E5C803973E64C2F34A14709DE7A509F5FA8D05DAD69220D31F29D8F749F0BDDF3E6CDEB19DD1E8CF8BE98BA5A12BE8D7CD3B81E7EF8E10FCF9A35EBAD6A8D74F736F23D7DFAF413E98576A9A32DF428C15B0FEAF33A29BD30F2A25453F3DB4A947EDFA8BEE0329FD37D6E7A494747C7B9E9248315D3503A3B3B4BA79DC80434A63BEEB8E350CCE9AEA598F33D63C68C6F39DA428F12BCF5A03EAF63E89E50149E1F4995E5B7E586EFBEBE6FD486EF7CE5927323DD430DDDC5E1BB64E47B8B33320D67C99225B7CF9F3FFFED3367CE64B576CB2DB7FCC4C74B428F12BCF5A03EAF73E81E938F586745554EF82E0EDD859A52F4F8A89BF31D4B0616CFE91EECF492FEA69D14CFF99609683877DE79E7E15832B01E5E7AE9A5ECFAEBAFFFB6A32EF428C1DBFF7B7D5E237D85E1DE42747FE1BBB7E72FEBE5F9A36ACE77F168775C18590B2B57AE34EA4D635ABE7CF91FC60595435936B052B367CFFE71CC1F73F4851E25782B7D5EA3D03DBE8230DD5BF82E37749786EF613DED244275AACBFB7A3C769A2C5C5019A3D2870F1FAE490E88D54E4A961A9409680CF7DF7FFFB224ABA7471E79E4706C25EBE80B3D4AF056FABC8ACA0DBF0385EF4A4377F1EF3F349C47BE8BA677AC6B6E6EFE68E9E3F936F03DCF59B468514DB340ACF35D14BC65021AC35D77DDB53BB681AFA798D63265CA94A71D7DA14709DE4A9F573974971B7AFB0ADFEF1A64E82E1D711F96E1BB97DD249F2C1E014FFFBDAAF0D8A64D9B6A9A0562939DA2BF63AD33330D61F6ECD9C7F6EFDF5FD7E01DEB7AB7B6B6EE77F4851E25782B7DDE9F8913277E2C365B696A6A7A771543777FE1FBD52184EEA1FE3D1722789F1B018F009EEEEF2E7CADDA1755968A1D2E8BFE867DCECC34842953A6BCD9DDDD5DD7E01DBF2FBDC04F3BFA357B631D2BF408DE82B71A0D7D9E6FE2D2B3E6738C8AC60A1825217CA823CCBD85EFA184EED2F03D7E989D1FB201EACDC2FD6A2D21D8DFD28245BFB7DBD99B460969D98510BFD7D1AFD9FFD367F3F97B1F147A046FC15B8DF0E0FDC15EC26184F02F5E79E595E3F380BC7888EDF8AE5E46BA5FCDBF3E14F177656584DD6159F5CA028572F6A6214C9E3CF96CBD47BC4F9E3C5978A19DC877C67A3DD57FA7DA9902E373E9F6AB31CF2CDD5F9E6EFF39BDF1FE63BAFF77E9FE6DF9851FD353A5BBCD13D2D7FF22DDFF486B6BEBEF4D9A34E9B79A9A9A7EE5E31FFFF8CFA5DB8B1B3878BF921FDFB3E9182D4DC7E897841EC15BF05623B1CFE3FDABBF7078F9E5971FB8F8E28B4FBDFFFDEF9F33C8F7FDFE46BC2BD96467A48F78EF8C736AFE8F1A23DE502BB366CD3A7A21E678A737D3AEABAFBEFA67E34D3505E6DF486F98BF9B5E7897A5FFFEB3F4E2BF2ADDBF36DD4E49F537E96B7F9B6EEF4EF5B9F4F5CFA7FFFED774FB787CEC986A43AAEDE9B197D2EDF7521D488F1FCB3F2E3B952A5650D997BEF63FE9F61BB15E68AAA7537D25D597533D94EA9FD2E3F7A6BA3DFD9C9B623E61FADAA474FF1331BF30DDFF9374FFF7D3DFF9DBE9FEAFB5B7B7BF67E6CC993F358C83F79EE237D4F4B71F49F5E9E28F67851EC15BF05623A5CF0BCBDBF555E3C68D3B7BC92597BC7DC515579CAA307C9733C77B30E17B24CDF1EE09DCE9185E923F6E8E37D4D24D37DDB4ADDEAB9A6CDBB66D5F3DAE60BEEAAAAB7E3ABD09FF62AC4B9A6E7F27BDB9FC515C3C9202F495E9F7FF55CC154CB73353DD921EBB23DDFE43AA25314A9C6EFF2DD57FE41B096C4DF562AA5DA9BA521D4D75263F191CCDBFB63B7FCED7F2EF5993FF8C65F133F39F7D67FCAEF4F8ACF8DDE9F7FC75FEB75C117F5BFC8DE9FEAFC7DF9CC2FDCF0CE18D757F1F27A838EEB3E30D56E811BC056F35DCFA3CDE9BD2FBDF6F4E9C38F1CFD37BE2B4F8A433FFE4F3783FC17B570C92BCF7BDEF6DAD7084B9AF25037B5BD5A492F03D525635D9163B54160277D1E35635815ABAE1861B3EB374E9D2B7EA19BC972C59F2D26858B33346BDD349E2E763143CDD7E2046C5D31BD91FC728799C085AFE5F8C9ECF8DD1F4747B4F8CAEA7C7FE251F6DFF4ABAFF543E0AFF423E2ABF371FA5EFCE47EDE3847320D56BA9BE1DA3FBE9791BF3D1FE7FCF47FFBF907F1AD011C775A0797BE9B9DF7CF8E187B353A74E090382B7E0ADEA564F3FFD74D65BB0CEA7187E3FFF9432A61E6E4AF558AA85A9DA53EDE8639EF7EC92E058EE48F340EB7457BAC365C1656386FF3ADEE78D7097B28E37D4588C06CF9E3DFB643D77AE6C6F6FEFB24BD5C0162E5CF8AE98AF9E4E4ABF1CF3D7F38B8C3E929FB4627EFBC43879C51B65BA7F6B3E0FFEFE322E9A391D3B92A59F297C0BDEB538B197F5DA16BC1BABE25AA2B6B6B6AC8F603D2EFAA6AF30D8CBFBDADA7EFA6CA011E77237C7A9347C47E83F9EEA9A919E09EC5C09B51FB9DD199BDAD4C38E1D3B62D4F67947BD36E2E2D23EC2F6F1FC42CB4B0BA147E816BC6B14BCF7E41F578F15BC55713DF3CC33839DE33DBFE882F11BFB0AE8658C7C57BA2365B9E1BBF0FBAE190DAFE17CBA64CFB963C58A1535C9022B57AE2C3E3F6D71F6A6A1C43CAFB973E71EABC7A8F7B469D35E89F9CD8E7AED461B4B0277AC1A737F0472A147F0AE63F0EE77551D3DA8CF2B3C47C5F538DBFA5B22B58F91EFD2691F53C754BE4E776FE17B4A0523EC23321314CE2131EA5DED8B2CE3E7C5CF2DDABC4726A0F14C9E3C79EB9A356B4ED532742F5FBE3CE6F16D2963B482C1BF615E5A98C71D23437D5DA429F40CCB4072D168E8C15845A774559DD4973797BEEEF5A0E05DC12779EF1EE405E785503CBE97105DC9E6387D7DDFB05C32B04AFF807EB6F01A9E376F5ED596168C2504172C5870DE68B74C40C38E944E9D3AF5E8AE5DBB6A32ECFDDDEF7E77CFA44993DE284C75A076C13B462B067A5EBD43CF98DED7C81D318FD7E323F8F41A7C2B2EAACD83EBFFC605B5E9FFE5CB71E16D4CCF4AB53EDFB9EF8974FBA57C29CC5831E7B3F95CD958E7FEA658A9275F8AB3293DF7EA7CCBED58CDE743B16C675C2FD0D6D6F6ABE9F617F230735195DF4BFABAB6E0BC4FBB046FC1BB4E4AA79D5C948F5857DAF7A5DF377EB486EEA24F4F0F155EBF1D1D1D430EDF11BA3B3B3BCF9B022913D0D0626BDE1933661C8975B6ABE9C08103FBD389FE073E4E1A3E2E44F0EEEF6BC3FDF17A059208C2B14E7C04E358FD210FCA1F4AE1F94FF3D5722644A04E27ACC9F95298732370E72BDA7C36BDC61E88409EAF14F1441ED4D7E5C1FDEB7990FF5E1EEC7F94AF9E53D5C05FC6C5BDDF88A534056FC1FB0286EFA1EA6D1ACBA8CC04C56BA8C7C8F760A79DC4F7958C749B6202F9BF72DBA74D9BF6C3575F7DF5743542F7AE5DBB5E8ED01D1BB838BA82B7E03D3CE7785733F00F14BCD373620DFCD382B7E03D42C3F7B0DD1CA75699A0387CC7DCECB8E03256252977F592B890B2784E773E054D2680E27FE5A693EE8F9E78E289AE215C707976D9B2655F4D27D95883BADD5115BC05EF86B9B8B2B7C01D27EE55E97DE50F2E540F2A17118F19FAF490513DBDA4BF4C507AED4604E958E73B36D989D1ECC23494984E123B52C6E6380F3EF8602C1FDCDBFAEB3201F472F21C1B1F51CF983163EFCE9D3B0F5492B89F7FFEF9E7A64E9DFACDB868C2FC2DC15BF06E9CE01DA3E6A5ABEAA413F6E2DE961614BC05EF0B1CBE2B1DB11EB51752569209CA984AD65FC90450C68BEDDA78B1A5207DE09E7BEED9B979F3E6577F907477779F8D907DF2E4C91FEEDFBFFFF5F4F52DF7DE7BEFFAB6B6B6D7F39D18DB5DA92C780BDE8D15BC8B96B3DC1D2B99F4B712C54808DE635C143C5AFBBCD2E9220D35BDA49C4C503CFDA49CC02D1340856237AB3891E61B63ECC92FCACAF2DB7DF94E62F3ED3E25780BDE8D1BBC63CDEE724FB0232578EBDB51DBE7E586E9D8067EC4EF482913003458F03672D81873BC876B0F0ADE82772FC6E7A17A7C3F8F1F12BA0118F5A1C7DC573D28780BDE1770E4DBF41200046FC15B0F0ADE82778DC3B7D00D80E02D78EB41C15BF0AE71F85E2C740320780BDE7A50F016BC6B2BE67467631A74C94000046FC15B0F5A4ED07282F5F41E670800046FC15B0F2A7D0E00428F1248F4A0D2E70020F408247A50E97300107A94E0ADF43900083D4A20D1834A9F0380D02390E841A5CF0140E85102891E5482370082B7202090E841A5CF0140E81148F4A0D2E70020F42881440F2A7D0E00428F40A207953E0700A14709247A509F0380D0A304123DA8F43900083D02891E54FA1C00841E2590E841A5CF0140E81148F4A0D2E70020F4082482B7D2E70020F42881440F2A7D0E00428F40A207953E0700A14709247A5009DE0008DE4A20D1834A9F0380D02390E841A5CF0140E85102891E54FA1C00841E81440F2A7D0E00428F1248F4A03E0700A14709247A50E97300107A04123DA8F43900083D4A20D1834A9F0380D02390E841A5CF0140E81148F4A0D2E70030EA6CD8B04110183ED59D02C959C15B09DE00300A6DDEBC79FFC18307858161505D5D5D8FA740F28AE0AD046F001885366EDCF8894D9B361D7DE38D374E0A04176EA43B42F7FAF5EBBF9FEA5AC15B09DE00304AA5B037219D0877C634873821AABA571CF7571A31740BDE8237000082B712BC0100046F2578030020782BC11B0040F05682370080E0AD046F0000046F257803008C48764FB5432B00007560F7543BB402005007764FB5432B00007562F7543BB402000000000000000000000000000000000000000000000000000C6BFF07E7D42F75B27581310000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('e613a494-95ec-11ec-be38-60f262a4e51a', 1, 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', 'e613a493-95ec-11ec-be38-60f262a4e51a', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C646566696E6974696F6E730D0A2020202020202020786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C220D0A2020202020202020786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E220D0A20202020202020207461726765744E616D6573706163653D224578616D706C6573223E0D0A0D0A202020203C70726F636573732069643D226F6E655461736B50726F6365737322206E616D653D22546865204F6E65205461736B2050726F63657373223E0D0A20202020202020203C73746172744576656E742069643D22746865537461727422202F3E0D0A20202020202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D22746865537461727422207461726765745265663D227468655461736B22202F3E0D0A20202020202020203C757365725461736B2069643D227468655461736B22206E616D653D226D79207461736B22202F3E0D0A20202020202020203C73657175656E6365466C6F772069643D22666C6F77322220736F757263655265663D227468655461736B22207461726765745265663D22746865456E6422202F3E0D0A20202020202020203C656E644576656E742069643D22746865456E6422202F3E0D0A202020203C2F70726F636573733E0D0A0D0A3C2F646566696E6974696F6E733E, 0);

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('batch.schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('eventsubscription.schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', 1);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.6.0.0)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.6.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.6.0.0', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int(0) NULL DEFAULT NULL,
  `DURATION_` bigint(0) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------
INSERT INTO `act_hi_actinst` VALUES ('0d49bae8-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d49bae7-a9d0-11ec-a709-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-22 19:05:58.287', '2022-03-22 19:05:58.287', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('0d49bae9-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d49bae7-a9d0-11ec-a709-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 19:05:58.287', '2022-03-22 19:05:58.287', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('0d49baea-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d49bae7-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', '0d49baeb-a9d0-11ec-a709-60f262a4e51a', NULL, '请假', 'userTask', NULL, '2022-03-22 19:05:58.287', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('17a3e06f-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06e-a9d0-11ec-a709-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-22 19:06:15.655', '2022-03-22 19:06:15.655', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('17a3e070-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06e-a9d0-11ec-a709-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 19:06:15.655', '2022-03-22 19:06:15.655', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('17a3e071-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06e-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', '17a3e072-a9d0-11ec-a709-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-22 19:06:15.655', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('1efe8d05-bbc6-11ec-9021-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', '1efe65f4-bbc6-11ec-9021-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:40:13.956', '2022-04-14 15:40:13.959', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('1eff5056-bbc6-11ec-9021-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', '1efe65f4-bbc6-11ec-9021-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:40:13.961', '2022-04-14 15:40:13.961', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('1eff5057-bbc6-11ec-9021-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', '1efe65f4-bbc6-11ec-9021-60f262a4e51a', 'theTask', '1f025d98-bbc6-11ec-9021-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:40:13.961', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('3686fa38-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa37-a9d0-11ec-a709-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-22 19:07:07.475', '2022-03-22 19:07:07.476', 1, 1, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('36872149-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa37-a9d0-11ec-a709-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 19:07:07.476', '2022-03-22 19:07:07.476', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('3687214a-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa37-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', '3687214b-a9d0-11ec-a709-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-22 19:07:07.476', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('3ad59caf-99e9-11ec-95c9-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', '3ad59cae-99e9-11ec-95c9-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:25:53.515', '2022-03-02 13:25:53.518', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('3ad637f0-99e9-11ec-95c9-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', '3ad59cae-99e9-11ec-95c9-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:25:53.519', '2022-03-02 13:25:53.519', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('3ad637f1-99e9-11ec-95c9-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', '3ad59cae-99e9-11ec-95c9-60f262a4e51a', 'theTask', '3ad881e2-99e9-11ec-95c9-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:25:53.520', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('440744be-9d34-11ec-92ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '44071dac-9d34-11ec-92ac-60f262a4e51a', '440744bd-9d34-11ec-92ac-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-06 18:00:34.683', '2022-03-06 18:00:34.686', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4407e0ff-9d34-11ec-92ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '44071dac-9d34-11ec-92ac-60f262a4e51a', '440744bd-9d34-11ec-92ac-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-06 18:00:34.687', '2022-03-06 18:00:34.687', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4407e100-9d34-11ec-92ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '44071dac-9d34-11ec-92ac-60f262a4e51a', '440744bd-9d34-11ec-92ac-60f262a4e51a', 'theTask', '4409dcd1-9d34-11ec-92ac-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-06 18:00:34.687', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47174372-9f5b-11ec-8849-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4716ce40-9f5b-11ec-8849-60f262a4e51a', '47174371-9f5b-11ec-8849-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:44:52.519', '2022-03-09 11:44:52.522', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('471806c3-9f5b-11ec-8849-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4716ce40-9f5b-11ec-8849-60f262a4e51a', '47174371-9f5b-11ec-8849-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:44:52.524', '2022-03-09 11:44:52.524', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('471806c4-9f5b-11ec-8849-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4716ce40-9f5b-11ec-8849-60f262a4e51a', '47174371-9f5b-11ec-8849-60f262a4e51a', 'theTask', '471b1405-9f5b-11ec-8849-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:44:52.524', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4d7107a8-99eb-11ec-a283-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4d70e096-99eb-11ec-a283-60f262a4e51a', '4d7107a7-99eb-11ec-a283-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:40:43.726', '2022-03-02 13:40:43.728', 1, 2, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4d71a3e9-99eb-11ec-a283-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4d70e096-99eb-11ec-a283-60f262a4e51a', '4d7107a7-99eb-11ec-a283-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:40:43.730', '2022-03-02 13:40:43.730', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4d71a3ea-99eb-11ec-a283-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4d70e096-99eb-11ec-a283-60f262a4e51a', '4d7107a7-99eb-11ec-a283-60f262a4e51a', 'theTask', '4d7378ab-99eb-11ec-a283-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:40:43.730', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4e43e22e-c226-11ec-a685-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4e436cfc-c226-11ec-a685-60f262a4e51a', '4e43e22d-c226-11ec-a685-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-22 18:23:51.926', '2022-04-22 18:23:51.931', 1, 5, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4e44f39f-c226-11ec-a685-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4e436cfc-c226-11ec-a685-60f262a4e51a', '4e43e22d-c226-11ec-a685-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 18:23:51.933', '2022-04-22 18:23:51.933', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('4e44f3a0-c226-11ec-a685-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4e436cfc-c226-11ec-a685-60f262a4e51a', '4e43e22d-c226-11ec-a685-60f262a4e51a', 'theTask', '4e487611-c226-11ec-a685-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-22 18:23:51.933', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('63b47e5d-bbc4-11ec-8d5f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:27:50.240', '2022-04-14 15:27:50.244', 1, 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('63b568be-bbc4-11ec-8d5f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:27:50.246', '2022-04-14 15:27:50.246', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('63b568bf-bbc4-11ec-8d5f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', 'theTask', '63b87600-bbc4-11ec-8d5f-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:27:50.246', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('677fa5df-a9eb-11ec-bd2b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 22:21:46.047', '2022-03-22 22:21:46.049', 1, 2, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67801b10-a9eb-11ec-bd2b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 22:21:46.050', '2022-03-22 22:21:46.050', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67804221-a9eb-11ec-bd2b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', 'theTask', '678216e2-a9eb-11ec-bd2b-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 22:21:46.051', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70864b0e-bbd5-11ec-852a-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '7085fcec-bbd5-11ec-852a-60f262a4e51a', '70864b0d-bbd5-11ec-852a-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 17:29:53.192', '2022-04-14 17:29:53.195', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70870e5f-bbd5-11ec-852a-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '7085fcec-bbd5-11ec-852a-60f262a4e51a', '70864b0d-bbd5-11ec-852a-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 17:29:53.197', '2022-04-14 17:29:53.197', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70870e60-bbd5-11ec-852a-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '7085fcec-bbd5-11ec-852a-60f262a4e51a', '70864b0d-bbd5-11ec-852a-60f262a4e51a', 'theTask', '7089a671-bbd5-11ec-852a-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 17:29:53.197', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70d96d96-99e9-11ec-95c9-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d94685-99e9-11ec-95c9-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:27:24.137', '2022-03-02 13:27:24.137', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70d96d97-99e9-11ec-95c9-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d94685-99e9-11ec-95c9-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:27:24.137', '2022-03-02 13:27:24.137', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70d96d98-99e9-11ec-95c9-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d94685-99e9-11ec-95c9-60f262a4e51a', 'leaveTask', '70d96d99-99e9-11ec-95c9-60f262a4e51a', NULL, '请假', 'userTask', NULL, '2022-03-02 13:27:24.137', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('720cfa6f-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:41:45.146', '2022-03-02 13:41:45.146', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('720cfa70-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:41:45.146', '2022-03-02 13:41:45.146', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('720cfa71-99eb-11ec-a283-60f262a4e51a', 2, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'leaveTask', '720cfa72-99eb-11ec-a283-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-02 13:41:45.146', '2022-03-02 13:43:53.485', 3, 128339, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('789bd9f0-c229-11ec-ad12-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '789b64be-c229-11ec-ad12-60f262a4e51a', '789bd9ef-c229-11ec-ad12-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-22 18:46:31.457', '2022-04-22 18:46:31.461', 1, 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('789cc451-c229-11ec-ad12-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '789b64be-c229-11ec-ad12-60f262a4e51a', '789bd9ef-c229-11ec-ad12-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 18:46:31.463', '2022-04-22 18:46:31.463', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('789ceb62-c229-11ec-ad12-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '789b64be-c229-11ec-ad12-60f262a4e51a', '789bd9ef-c229-11ec-ad12-60f262a4e51a', 'theTask', '789fd193-c229-11ec-ad12-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-22 18:46:31.464', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('81c45b42-bbd5-11ec-ab5c-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 17:30:22.120', '2022-04-14 17:30:22.123', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('81c51e93-bbd5-11ec-ab5c-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 17:30:22.125', '2022-04-14 17:30:22.125', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('81c51e94-bbd5-11ec-ab5c-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', 'theTask', '81c7ddb5-bbd5-11ec-ab5c-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 17:30:22.125', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('8afe9426-9f5c-11ec-bf9b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:53:55.939', '2022-03-09 11:53:55.942', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('8aff5777-9f5c-11ec-bf9b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:53:55.944', '2022-03-09 11:53:55.944', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('8aff7e88-9f5c-11ec-bf9b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', 'theTask', '8b023da9-9f5c-11ec-bf9b-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:53:55.945', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('8ec62561-a9ce-11ec-a709-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 18:55:16.535', '2022-03-22 18:55:16.541', 1, 6, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('8ec784f2-a9ce-11ec-a709-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 18:55:16.544', '2022-03-22 18:55:16.544', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('8ec784f3-a9ce-11ec-a709-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', 'theTask', '8ecae054-a9ce-11ec-a709-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 18:55:16.544', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('9b6070ec-ae78-11ec-95a7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', '9b6070eb-ae78-11ec-95a7-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-28 17:22:36.774', '2022-03-28 17:22:36.779', 1, 5, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('9b61825d-ae78-11ec-95a7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', '9b6070eb-ae78-11ec-95a7-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-28 17:22:36.781', '2022-03-28 17:22:36.781', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('9b61a96e-ae78-11ec-95a7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', '9b6070eb-ae78-11ec-95a7-60f262a4e51a', 'theTask', '9b6504cf-ae78-11ec-95a7-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-28 17:22:36.782', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('a6cee84e-99e9-11ec-aaa8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:28:54.665', '2022-03-02 13:28:54.667', 1, 2, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('a6cf5d7f-99e9-11ec-aaa8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:28:54.668', '2022-03-02 13:28:54.668', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('a6cf5d80-99e9-11ec-aaa8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 'theTask', 'a6d13241-99e9-11ec-aaa8-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:28:54.668', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('a79ead10-bbc8-11ec-a3eb-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:58:22.169', '2022-04-14 15:58:22.174', 1, 5, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('a7a00ca1-bbc8-11ec-a3eb-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:58:22.178', '2022-04-14 15:58:22.178', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('a7a00ca2-bbc8-11ec-a3eb-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 'theTask', 'a7a515b3-bbc8-11ec-a3eb-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:58:22.178', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('abc035c7-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-04-22 19:16:35.246', '2022-04-22 19:16:35.246', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('abc035c8-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 19:16:35.246', '2022-04-22 19:16:35.246', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('abc035c9-c22d-11ec-ad12-60f262a4e51a', 2, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'leaveTask', 'abc05cda-c22d-11ec-ad12-60f262a4e51a', NULL, '学生提出问题', 'userTask', '111', '2022-04-22 19:16:35.246', '2022-04-22 19:17:32.783', 3, 57537, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('b7ce25ad-bbc3-11ec-9743-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:23:01.841', '2022-04-14 15:23:01.846', 1, 5, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('b7cf853e-bbc3-11ec-9743-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:23:01.849', '2022-04-14 15:23:01.849', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('b7cf853f-bbc3-11ec-9743-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 'theTask', 'b7d355d0-bbc3-11ec-9743-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:23:01.849', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ba85072e-99ea-11ec-abc8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:36:37.232', '2022-03-02 13:36:37.239', 1, 7, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ba879f3f-99ea-11ec-abc8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:36:37.249', '2022-03-02 13:36:37.249', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ba87c650-99ea-11ec-abc8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', 'theTask', 'ba8db9c1-99ea-11ec-abc8-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:36:37.250', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('be8bf4a6-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'modeFlow', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:43:53.485', '2022-03-02 13:43:53.485', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('be8c1bb7-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'managerTask', 'be8c1bb8-99eb-11ec-a283-60f262a4e51a', NULL, '经理审核', 'userTask', NULL, '2022-03-02 13:43:53.486', NULL, 2, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('c0e25643-b1ad-11ec-a110-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'c0e25642-b1ad-11ec-a110-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-01 19:20:36.517', '2022-04-01 19:20:36.520', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('c0e31994-b1ad-11ec-a110-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'c0e25642-b1ad-11ec-a110-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-01 19:20:36.522', '2022-04-01 19:20:36.522', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('c0e340a5-b1ad-11ec-a110-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'c0e25642-b1ad-11ec-a110-60f262a4e51a', 'theTask', 'c0e5d8b6-b1ad-11ec-a110-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-01 19:20:36.522', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('c8ad6612-9f5b-11ec-a901-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:48:29.929', '2022-03-09 11:48:29.932', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('c8ae2963-9f5b-11ec-a901-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:48:29.934', '2022-03-09 11:48:29.934', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('c8ae2964-9f5b-11ec-a901-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', 'theTask', 'c8b07355-9f5b-11ec-a901-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:48:29.934', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ce0bf6fe-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'modeFlow', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 19:17:32.785', '2022-04-22 19:17:32.785', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ce0c1e0f-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'managerTask', 'ce0c1e10-c22d-11ec-ad12-60f262a4e51a', NULL, '工作人员处理', 'userTask', NULL, '2022-04-22 19:17:32.786', NULL, 2, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('d3fd7a9e-9605-11ec-8832-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-02-25 14:40:31.725', '2022-02-25 14:40:31.730', 1, 5, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('d3ff284f-9605-11ec-8832-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-02-25 14:40:31.736', '2022-02-25 14:40:31.736', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('d3ff2850-9605-11ec-8832-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', 'theTask', 'd4040a51-9605-11ec-8832-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-02-25 14:40:31.736', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('d42879d1-b1b2-11ec-8842-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'd42879d0-b1b2-11ec-8842-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-01 19:56:56.336', '2022-04-01 19:56:56.339', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('d4291612-b1b2-11ec-8842-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'd42879d0-b1b2-11ec-8842-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-01 19:56:56.340', '2022-04-01 19:56:56.340', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('d4291613-b1b2-11ec-8842-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'd42879d0-b1b2-11ec-8842-60f262a4e51a', 'theTask', 'd42b8714-b1b2-11ec-8842-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-01 19:56:56.340', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('dc40d9e6-99e9-11ec-9d2f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:30:24.331', '2022-03-02 13:30:24.333', 1, 2, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('dc414f17-99e9-11ec-9d2f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:30:24.334', '2022-03-02 13:30:24.334', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('dc414f18-99e9-11ec-9d2f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 'theTask', 'dc4323d9-99e9-11ec-9d2f-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:30:24.334', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('de0caefc-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0caefb-99eb-11ec-a283-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:44:46.338', '2022-03-02 13:44:46.338', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('de0caefd-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0caefb-99eb-11ec-a283-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:44:46.338', '2022-03-02 13:44:46.338', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('de0caefe-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0caefb-99eb-11ec-a283-60f262a4e51a', 'leaveTask', 'de0caeff-99eb-11ec-a283-60f262a4e51a', NULL, '请假', 'userTask', NULL, '2022-03-02 13:44:46.338', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('dedff72a-9f5c-11ec-91ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'dedff729-9f5c-11ec-91ac-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:56:16.668', '2022-03-09 11:56:16.676', 1, 8, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('dee1cbeb-9f5c-11ec-91ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'dedff729-9f5c-11ec-91ac-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:56:16.679', '2022-03-09 11:56:16.679', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('dee1f2fc-9f5c-11ec-91ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'dedff729-9f5c-11ec-91ac-60f262a4e51a', 'theTask', 'dee6aded-9f5c-11ec-91ac-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:56:16.680', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e368dd2e-99ea-11ec-a8f7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:37:45.834', '2022-03-02 13:37:45.837', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e369796f-99ea-11ec-a8f7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:37:45.839', '2022-03-02 13:37:45.839', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e369a080-99ea-11ec-a8f7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 'theTask', 'e36bc361-99ea-11ec-a8f7-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:37:45.839', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e3fa1647-a9c2-11ec-a27f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 17:31:45.521', '2022-03-22 17:31:45.526', 1, 5, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e3fb27b8-a9c2-11ec-a27f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 17:31:45.528', '2022-03-22 17:31:45.528', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e3fb27b9-a9c2-11ec-a27f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 'theTask', 'e3feaa2a-a9c2-11ec-a27f-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 17:31:45.528', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e4c39613-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39612-99eb-11ec-a283-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:44:57.603', '2022-03-02 13:44:57.603', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e4c39614-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39612-99eb-11ec-a283-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:44:57.603', '2022-03-02 13:44:57.603', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e4c39615-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39612-99eb-11ec-a283-60f262a4e51a', 'leaveTask', 'e4c39616-99eb-11ec-a283-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-02 13:44:57.603', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e6349a18-95ec-11ec-be38-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'e6349a17-95ec-11ec-be38-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-02-25 11:42:04.867', '2022-02-25 11:42:04.870', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e6355d69-95ec-11ec-be38-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'e6349a17-95ec-11ec-be38-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-02-25 11:42:04.872', '2022-02-25 11:42:04.872', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('e6355d6a-95ec-11ec-be38-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'e6349a17-95ec-11ec-be38-60f262a4e51a', 'theTask', 'e638439b-95ec-11ec-be38-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-02-25 11:42:04.872', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ea002b98-9bb8-11ec-b364-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'ea002b97-9bb8-11ec-b364-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-04 20:45:04.381', '2022-03-04 20:45:04.385', 1, 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ea0115f9-9bb8-11ec-b364-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'ea002b97-9bb8-11ec-b364-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-04 20:45:04.387', '2022-03-04 20:45:04.387', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('ea0115fa-9bb8-11ec-b364-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'ea002b97-9bb8-11ec-b364-60f262a4e51a', 'theTask', 'ea03fc2b-9bb8-11ec-b364-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-04 20:45:04.387', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('eb38d644-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d643-c22d-11ec-ad12-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-04-22 19:18:21.733', '2022-04-22 19:18:21.733', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('eb38d645-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d643-c22d-11ec-ad12-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 19:18:21.733', '2022-04-22 19:18:21.733', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('eb38fd56-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d643-c22d-11ec-ad12-60f262a4e51a', 'leaveTask', 'eb38fd57-c22d-11ec-ad12-60f262a4e51a', NULL, '学生提出问题', 'userTask', '1234', '2022-04-22 19:18:21.734', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('f07afa3b-bbc7-11ec-b56b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:53:14.913', '2022-04-14 15:53:14.916', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('f07be49c-bbc7-11ec-b56b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:53:14.918', '2022-04-14 15:53:14.918', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('f07be49d-bbc7-11ec-b56b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 'theTask', 'f07f18ee-bbc7-11ec-b56b-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:53:14.918', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('f07f4beb-a9bd-11ec-bd17-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 16:56:19.043', '2022-03-22 16:56:19.047', 1, 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('f080364c-a9bd-11ec-bd17-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 16:56:19.049', '2022-03-22 16:56:19.049', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('f080364d-a9bd-11ec-bd17-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 'theTask', 'f083b8be-a9bd-11ec-bd17-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 16:56:19.049', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('fdf40d3a-9f5c-11ec-acb5-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:57:08.808', '2022-03-09 11:57:08.812', 1, 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('fdf4d08b-9f5c-11ec-acb5-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:57:08.813', '2022-03-09 11:57:08.813', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('fdf4d08c-9f5c-11ec-acb5-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 'theTask', 'fdf7ddcd-9f5c-11ec-acb5-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:57:08.813', NULL, 3, NULL, NULL, '');

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(0) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_entitylink`;
CREATE TABLE `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_`, `ROOT_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
INSERT INTO `act_hi_identitylink` VALUES ('17a40683-a9d0-11ec-a709-60f262a4e51a', NULL, 'assignee', '18001020303', '17a3e072-a9d0-11ec-a709-60f262a4e51a', '2022-03-22 19:06:15.656', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('17a42d94-a9d0-11ec-a709-60f262a4e51a', NULL, 'participant', '18001020303', NULL, '2022-03-22 19:06:15.657', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('3687214c-a9d0-11ec-a709-60f262a4e51a', NULL, 'assignee', '18001020303', '3687214b-a9d0-11ec-a709-60f262a4e51a', '2022-03-22 19:07:07.476', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('3687214d-a9d0-11ec-a709-60f262a4e51a', NULL, 'participant', '18001020303', NULL, '2022-03-22 19:07:07.476', '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('720d6fa3-99eb-11ec-a283-60f262a4e51a', NULL, 'assignee', '18001020303', '720cfa72-99eb-11ec-a283-60f262a4e51a', '2022-03-02 13:41:45.149', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('720d6fa4-99eb-11ec-a283-60f262a4e51a', NULL, 'participant', '18001020303', NULL, '2022-03-02 13:41:45.149', '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('abc0f91b-c22d-11ec-ad12-60f262a4e51a', NULL, 'assignee', '111', 'abc05cda-c22d-11ec-ad12-60f262a4e51a', '2022-04-22 19:16:35.251', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('abc1202c-c22d-11ec-ad12-60f262a4e51a', NULL, 'participant', '111', NULL, '2022-04-22 19:16:35.252', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('e4c39617-99eb-11ec-a283-60f262a4e51a', NULL, 'assignee', '18001020303', 'e4c39616-99eb-11ec-a283-60f262a4e51a', '2022-03-02 13:44:57.603', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('e4c39618-99eb-11ec-a283-60f262a4e51a', NULL, 'participant', '18001020303', NULL, '2022-03-02 13:44:57.603', 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('eb38fd58-c22d-11ec-ad12-60f262a4e51a', NULL, 'assignee', '1234', 'eb38fd57-c22d-11ec-ad12-60f262a4e51a', '2022-04-22 19:18:21.734', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('eb38fd59-c22d-11ec-ad12-60f262a4e51a', NULL, 'participant', '1234', NULL, '2022-04-22 19:18:21.734', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(0) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
INSERT INTO `act_hi_procinst` VALUES ('0d4945b5-a9d0-11ec-a709-60f262a4e51a', 1, '0d4945b5-a9d0-11ec-a709-60f262a4e51a', NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '2022-03-22 19:05:58.284', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('17a3e06c-a9d0-11ec-a709-60f262a4e51a', 1, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '2022-03-22 19:06:15.655', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('1efe17d3-bbc6-11ec-9021-60f262a4e51a', 1, '1efe17d3-bbc6-11ec-9021-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-14 15:40:13.953', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('3686fa35-a9d0-11ec-a709-60f262a4e51a', 1, '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '2022-03-22 19:07:07.475', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('3ad5759d-99e9-11ec-95c9-60f262a4e51a', 1, '3ad5759d-99e9-11ec-95c9-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-02 13:25:53.514', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('44071dac-9d34-11ec-92ac-60f262a4e51a', 1, '44071dac-9d34-11ec-92ac-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-06 18:00:34.682', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('4716ce40-9f5b-11ec-8849-60f262a4e51a', 1, '4716ce40-9f5b-11ec-8849-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-09 11:44:52.516', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('4d70e096-99eb-11ec-a283-60f262a4e51a', 1, '4d70e096-99eb-11ec-a283-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-02 13:40:43.725', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('4e436cfc-c226-11ec-a685-60f262a4e51a', 1, '4e436cfc-c226-11ec-a685-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-22 18:23:51.923', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', 1, '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-14 15:27:50.236', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', 1, '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-22 22:21:46.046', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('7085fcec-bbd5-11ec-852a-60f262a4e51a', 1, '7085fcec-bbd5-11ec-852a-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-14 17:29:53.190', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('70d91f73-99e9-11ec-95c9-60f262a4e51a', 1, '70d91f73-99e9-11ec-95c9-60f262a4e51a', NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '2022-03-02 13:27:24.135', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('720cac4c-99eb-11ec-a283-60f262a4e51a', 1, '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '2022-03-02 13:41:45.144', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('789b64be-c229-11ec-ad12-60f262a4e51a', 1, '789b64be-c229-11ec-ad12-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-22 18:46:31.454', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('81c40d20-bbd5-11ec-ab5c-60f262a4e51a', 1, '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-14 17:30:22.118', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('8afe4604-9f5c-11ec-bf9b-60f262a4e51a', 1, '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-09 11:53:55.937', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('8ec5891f-a9ce-11ec-a709-60f262a4e51a', 1, '8ec5891f-a9ce-11ec-a709-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-22 18:55:16.531', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('9b5ffbba-ae78-11ec-95a7-60f262a4e51a', 1, '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-28 17:22:36.771', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 1, 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-02 13:28:54.663', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 1, 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-14 15:58:22.167', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 1, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', '2022-04-22 19:16:35.244', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 1, 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-14 15:23:01.838', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('ba841ccc-99ea-11ec-abc8-60f262a4e51a', 1, 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-02 13:36:37.226', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('c0e22f31-b1ad-11ec-a110-60f262a4e51a', 1, 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-01 19:20:36.514', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 1, 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-09 11:48:29.927', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('d3fd056c-9605-11ec-8832-60f262a4e51a', 1, 'd3fd056c-9605-11ec-8832-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-02-25 14:40:31.722', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('d4282baf-b1b2-11ec-8842-60f262a4e51a', 1, 'd4282baf-b1b2-11ec-8842-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-01 19:56:56.334', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 1, 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-02 13:30:24.330', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('de0c87e9-99eb-11ec-a283-60f262a4e51a', 1, 'de0c87e9-99eb-11ec-a283-60f262a4e51a', NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '2022-03-02 13:44:46.337', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 1, 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-09 11:56:16.663', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('e368b61c-99ea-11ec-a8f7-60f262a4e51a', 1, 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-02 13:37:45.833', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 1, 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-22 17:31:45.518', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('e4c39610-99eb-11ec-a283-60f262a4e51a', 1, 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '2022-03-02 13:44:57.603', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('e6344bf6-95ec-11ec-be38-60f262a4e51a', 1, 'e6344bf6-95ec-11ec-be38-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-02-25 11:42:04.865', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 1, 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-04 20:45:04.379', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('eb38d641-c22d-11ec-ad12-60f262a4e51a', 1, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', '2022-04-22 19:18:21.733', NULL, NULL, NULL, 'startLeave', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('f07aac19-bbc7-11ec-b56b-60f262a4e51a', 1, 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-04-14 15:53:14.910', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 1, 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-22 16:56:19.040', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 1, 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '2022-03-09 11:57:08.806', NULL, NULL, NULL, 'theStart', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(0) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(0) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------
INSERT INTO `act_hi_taskinst` VALUES ('0d49baeb-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d49bae7-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, NULL, NULL, '2022-03-22 19:05:58.287', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-22 19:05:58.287');
INSERT INTO `act_hi_taskinst` VALUES ('17a3e072-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06e-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, NULL, '18001020303', '2022-03-22 19:06:15.655', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-22 19:06:15.655');
INSERT INTO `act_hi_taskinst` VALUES ('1f025d98-bbc6-11ec-9021-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', '1efe65f4-bbc6-11ec-9021-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-14 15:40:13.962', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-14 15:40:13.984');
INSERT INTO `act_hi_taskinst` VALUES ('3687214b-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa37-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, NULL, '18001020303', '2022-03-22 19:07:07.476', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-22 19:07:07.476');
INSERT INTO `act_hi_taskinst` VALUES ('3ad881e2-99e9-11ec-95c9-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', '3ad59cae-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-02 13:25:53.520', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:25:53.534');
INSERT INTO `act_hi_taskinst` VALUES ('4409dcd1-9d34-11ec-92ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '44071dac-9d34-11ec-92ac-60f262a4e51a', '440744bd-9d34-11ec-92ac-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-06 18:00:34.687', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-06 18:00:34.701');
INSERT INTO `act_hi_taskinst` VALUES ('471b1405-9f5b-11ec-8849-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '4716ce40-9f5b-11ec-8849-60f262a4e51a', '47174371-9f5b-11ec-8849-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-09 11:44:52.524', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-09 11:44:52.545');
INSERT INTO `act_hi_taskinst` VALUES ('4d7378ab-99eb-11ec-a283-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '4d70e096-99eb-11ec-a283-60f262a4e51a', '4d7107a7-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-02 13:40:43.730', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:40:43.743');
INSERT INTO `act_hi_taskinst` VALUES ('4e487611-c226-11ec-a685-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '4e436cfc-c226-11ec-a685-60f262a4e51a', '4e43e22d-c226-11ec-a685-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-22 18:23:51.934', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-22 18:23:51.958');
INSERT INTO `act_hi_taskinst` VALUES ('63b87600-bbc4-11ec-8d5f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-14 15:27:50.246', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-14 15:27:50.268');
INSERT INTO `act_hi_taskinst` VALUES ('678216e2-a9eb-11ec-bd2b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-22 22:21:46.051', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-22 22:21:46.064');
INSERT INTO `act_hi_taskinst` VALUES ('7089a671-bbd5-11ec-852a-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '7085fcec-bbd5-11ec-852a-60f262a4e51a', '70864b0d-bbd5-11ec-852a-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-14 17:29:53.197', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-14 17:29:53.215');
INSERT INTO `act_hi_taskinst` VALUES ('70d96d99-99e9-11ec-95c9-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d94685-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, NULL, NULL, '2022-03-02 13:27:24.137', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:27:24.137');
INSERT INTO `act_hi_taskinst` VALUES ('720cfa72-99eb-11ec-a283-60f262a4e51a', 2, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, NULL, '18001020303', '2022-03-02 13:41:45.146', NULL, '2022-03-02 13:43:53.481', 128335, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:43:53.481');
INSERT INTO `act_hi_taskinst` VALUES ('789fd193-c229-11ec-ad12-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '789b64be-c229-11ec-ad12-60f262a4e51a', '789bd9ef-c229-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-22 18:46:31.464', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-22 18:46:31.486');
INSERT INTO `act_hi_taskinst` VALUES ('81c7ddb5-bbd5-11ec-ab5c-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-14 17:30:22.125', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-14 17:30:22.144');
INSERT INTO `act_hi_taskinst` VALUES ('8b023da9-9f5c-11ec-bf9b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-09 11:53:55.945', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-09 11:53:55.964');
INSERT INTO `act_hi_taskinst` VALUES ('8ecae054-a9ce-11ec-a709-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-22 18:55:16.544', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-22 18:55:16.567');
INSERT INTO `act_hi_taskinst` VALUES ('9b6504cf-ae78-11ec-95a7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', '9b6070eb-ae78-11ec-95a7-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-28 17:22:36.782', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-28 17:22:36.805');
INSERT INTO `act_hi_taskinst` VALUES ('a6d13241-99e9-11ec-aaa8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-02 13:28:54.668', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:28:54.681');
INSERT INTO `act_hi_taskinst` VALUES ('a7a515b3-bbc8-11ec-a3eb-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-14 15:58:22.178', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-14 15:58:22.213');
INSERT INTO `act_hi_taskinst` VALUES ('abc05cda-c22d-11ec-ad12-60f262a4e51a', 2, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, 'leaveTask', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '学生提出问题', NULL, NULL, NULL, '111', '2022-04-22 19:16:35.246', NULL, '2022-04-22 19:17:32.779', 57533, NULL, 50, NULL, NULL, NULL, '', '2022-04-22 19:17:32.779');
INSERT INTO `act_hi_taskinst` VALUES ('b7d355d0-bbc3-11ec-9743-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-14 15:23:01.849', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-14 15:23:01.875');
INSERT INTO `act_hi_taskinst` VALUES ('ba8db9c1-99ea-11ec-abc8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-02 13:36:37.250', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:36:37.292');
INSERT INTO `act_hi_taskinst` VALUES ('be8c1bb8-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'managerTask', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '经理审核', NULL, NULL, NULL, NULL, '2022-03-02 13:43:53.486', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:43:53.486');
INSERT INTO `act_hi_taskinst` VALUES ('c0e5d8b6-b1ad-11ec-a110-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'c0e25642-b1ad-11ec-a110-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-01 19:20:36.522', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-01 19:20:36.540');
INSERT INTO `act_hi_taskinst` VALUES ('c8b07355-9f5b-11ec-a901-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-09 11:48:29.934', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-09 11:48:29.950');
INSERT INTO `act_hi_taskinst` VALUES ('ce0c1e10-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, 'managerTask', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '工作人员处理', NULL, NULL, NULL, NULL, '2022-04-22 19:17:32.786', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-22 19:17:32.786');
INSERT INTO `act_hi_taskinst` VALUES ('d4040a51-9605-11ec-8832-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-02-25 14:40:31.736', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-02-25 14:40:31.769');
INSERT INTO `act_hi_taskinst` VALUES ('d42b8714-b1b2-11ec-8842-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'd42879d0-b1b2-11ec-8842-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-01 19:56:56.340', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-01 19:56:56.357');
INSERT INTO `act_hi_taskinst` VALUES ('dc4323d9-99e9-11ec-9d2f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-02 13:30:24.335', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:30:24.347');
INSERT INTO `act_hi_taskinst` VALUES ('de0caeff-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0caefb-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, NULL, NULL, '2022-03-02 13:44:46.338', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:44:46.338');
INSERT INTO `act_hi_taskinst` VALUES ('dee6aded-9f5c-11ec-91ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'dedff729-9f5c-11ec-91ac-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-09 11:56:16.680', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-09 11:56:16.713');
INSERT INTO `act_hi_taskinst` VALUES ('e36bc361-99ea-11ec-a8f7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-02 13:37:45.839', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:37:45.854');
INSERT INTO `act_hi_taskinst` VALUES ('e3feaa2a-a9c2-11ec-a27f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-22 17:31:45.528', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-22 17:31:45.553');
INSERT INTO `act_hi_taskinst` VALUES ('e4c39616-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39612-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, NULL, '18001020303', '2022-03-02 13:44:57.603', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-02 13:44:57.603');
INSERT INTO `act_hi_taskinst` VALUES ('e638439b-95ec-11ec-be38-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'e6349a17-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-02-25 11:42:04.873', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-02-25 11:42:04.892');
INSERT INTO `act_hi_taskinst` VALUES ('ea03fc2b-9bb8-11ec-b364-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'ea002b97-9bb8-11ec-b364-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-04 20:45:04.387', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-04 20:45:04.407');
INSERT INTO `act_hi_taskinst` VALUES ('eb38fd57-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, 'leaveTask', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d643-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, '学生提出问题', NULL, NULL, NULL, '1234', '2022-04-22 19:18:21.734', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-22 19:18:21.734');
INSERT INTO `act_hi_taskinst` VALUES ('f07f18ee-bbc7-11ec-b56b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-04-14 15:53:14.918', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-04-14 15:53:14.941');
INSERT INTO `act_hi_taskinst` VALUES ('f083b8be-a9bd-11ec-bd17-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-22 16:56:19.049', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-22 16:56:19.073');
INSERT INTO `act_hi_taskinst` VALUES ('fdf7ddcd-9f5c-11ec-acb5-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'theTask', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, NULL, NULL, '2022-03-09 11:57:08.813', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2022-03-09 11:57:08.834');

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_tsk_log`;
CREATE TABLE `act_hi_tsk_log`  (
  `ID_` bigint(0) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_tsk_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(0) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
INSERT INTO `act_hi_varinst` VALUES ('0d496cc6-a9d0-11ec-a709-60f262a4e51a', 0, '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', NULL, 'leaveTask', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-22 19:05:58.286', '2022-03-22 19:05:58.286');
INSERT INTO `act_hi_varinst` VALUES ('17a3e06d-a9d0-11ec-a709-60f262a4e51a', 0, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, 'leaveTask', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL, '2022-03-22 19:06:15.655', '2022-03-22 19:06:15.655');
INSERT INTO `act_hi_varinst` VALUES ('3686fa36-a9d0-11ec-a709-60f262a4e51a', 0, '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, 'leaveTask', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL, '2022-03-22 19:07:07.475', '2022-03-22 19:07:07.475');
INSERT INTO `act_hi_varinst` VALUES ('70d91f74-99e9-11ec-95c9-60f262a4e51a', 0, '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', NULL, 'leaveTask', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-02 13:27:24.136', '2022-03-02 13:27:24.136');
INSERT INTO `act_hi_varinst` VALUES ('720cd35d-99eb-11ec-a283-60f262a4e51a', 0, '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, 'leaveTask', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL, '2022-03-02 13:41:45.146', '2022-03-02 13:41:45.146');
INSERT INTO `act_hi_varinst` VALUES ('abbfe7a5-c22d-11ec-ad12-60f262a4e51a', 0, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, 'leaveTask', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '111', NULL, '2022-04-22 19:16:35.246', '2022-04-22 19:16:35.246');
INSERT INTO `act_hi_varinst` VALUES ('be8b5865-99eb-11ec-a283-60f262a4e51a', 0, '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, 'checkResult', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '驳回', NULL, '2022-03-02 13:43:53.481', '2022-03-02 13:43:53.481');
INSERT INTO `act_hi_varinst` VALUES ('ce0b0c9d-c22d-11ec-ad12-60f262a4e51a', 0, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, 'checkResult', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '驳回', NULL, '2022-04-22 19:17:32.779', '2022-04-22 19:17:32.779');
INSERT INTO `act_hi_varinst` VALUES ('de0c87ea-99eb-11ec-a283-60f262a4e51a', 0, 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', NULL, 'leaveTask', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-02 13:44:46.337', '2022-03-02 13:44:46.337');
INSERT INTO `act_hi_varinst` VALUES ('e4c39611-99eb-11ec-a283-60f262a4e51a', 0, 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, 'leaveTask', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL, '2022-03-02 13:44:57.603', '2022-03-02 13:44:57.603');
INSERT INTO `act_hi_varinst` VALUES ('eb38d642-c22d-11ec-ad12-60f262a4e51a', 0, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, 'leaveTask', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '1234', NULL, '2022-04-22 19:18:21.733', '2022-04-22 19:18:21.733');

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.6.0.0', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_token
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment` VALUES ('3a89eda9-99e9-11ec-95c9-60f262a4e51a', 'SpringBootAutoDeployment', NULL, NULL, '', '2022-03-02 13:25:53.013', NULL, NULL, '3a89eda9-99e9-11ec-95c9-60f262a4e51a', NULL);
INSERT INTO `act_re_deployment` VALUES ('673b97f9-a9eb-11ec-bd2b-60f262a4e51a', 'SpringBootAutoDeployment', NULL, NULL, '', '2022-03-22 22:21:45.596', NULL, NULL, '673b97f9-a9eb-11ec-bd2b-60f262a4e51a', NULL);
INSERT INTO `act_re_deployment` VALUES ('b71535e7-bbc3-11ec-9743-60f262a4e51a', 'SpringBootAutoDeployment', NULL, NULL, '', '2022-04-14 15:23:00.603', NULL, NULL, 'b71535e7-bbc3-11ec-9743-60f262a4e51a', NULL);
INSERT INTO `act_re_deployment` VALUES ('e613a493-95ec-11ec-be38-60f262a4e51a', 'SpringBootAutoDeployment', NULL, NULL, '', '2022-02-25 11:42:04.649', NULL, NULL, 'e613a493-95ec-11ec-be38-60f262a4e51a', NULL);

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(0) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(0) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(0) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(0) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(0) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `DERIVED_VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
INSERT INTO `act_re_procdef` VALUES ('Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 1, 'http://www.flowable.org/processdef', 'LeaveProcess', 'Leave', 1, '3a89eda9-99e9-11ec-95c9-60f262a4e51a', 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.Leave.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('Leave:2:677370dc-a9eb-11ec-bd2b-60f262a4e51a', 1, 'http://www.flowable.org/processdef', 'LeaveProcess', 'Leave', 2, '673b97f9-a9eb-11ec-bd2b-60f262a4e51a', 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.Leave.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 1, 'http://www.flowable.org/processdef', 'LeaveProcess', 'Leave', 3, 'b71535e7-bbc3-11ec-9743-60f262a4e51a', 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.Leave.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 1, 'Examples', 'The One Task Process', 'oneTaskProcess', 1, 'e613a493-95ec-11ec-be38-60f262a4e51a', 'C:\\AllFile\\HailinFile\\IdeaProject\\cisp-master\\target\\classes\\processes\\one-task-process.bpmn20.xml', NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_actinst`;
CREATE TABLE `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(0) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int(0) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------
INSERT INTO `act_ru_actinst` VALUES ('0d49bae8-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d49bae7-a9d0-11ec-a709-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-22 19:05:58.287', '2022-03-22 19:05:58.287', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('0d49bae9-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d49bae7-a9d0-11ec-a709-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 19:05:58.287', '2022-03-22 19:05:58.287', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('0d49baea-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d49bae7-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', '0d49baeb-a9d0-11ec-a709-60f262a4e51a', NULL, '请假', 'userTask', NULL, '2022-03-22 19:05:58.287', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('17a3e06f-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06e-a9d0-11ec-a709-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-22 19:06:15.655', '2022-03-22 19:06:15.655', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('17a3e070-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06e-a9d0-11ec-a709-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 19:06:15.655', '2022-03-22 19:06:15.655', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('17a3e071-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06e-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', '17a3e072-a9d0-11ec-a709-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-22 19:06:15.655', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('1efe8d05-bbc6-11ec-9021-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', '1efe65f4-bbc6-11ec-9021-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:40:13.956', '2022-04-14 15:40:13.959', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('1eff5056-bbc6-11ec-9021-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', '1efe65f4-bbc6-11ec-9021-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:40:13.961', '2022-04-14 15:40:13.961', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('1eff5057-bbc6-11ec-9021-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', '1efe65f4-bbc6-11ec-9021-60f262a4e51a', 'theTask', '1f025d98-bbc6-11ec-9021-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:40:13.961', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('3686fa38-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa37-a9d0-11ec-a709-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-22 19:07:07.475', '2022-03-22 19:07:07.476', 1, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('36872149-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa37-a9d0-11ec-a709-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 19:07:07.476', '2022-03-22 19:07:07.476', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('3687214a-a9d0-11ec-a709-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa37-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', '3687214b-a9d0-11ec-a709-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-22 19:07:07.476', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('3ad59caf-99e9-11ec-95c9-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', '3ad59cae-99e9-11ec-95c9-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:25:53.515', '2022-03-02 13:25:53.518', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('3ad637f0-99e9-11ec-95c9-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', '3ad59cae-99e9-11ec-95c9-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:25:53.519', '2022-03-02 13:25:53.519', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('3ad637f1-99e9-11ec-95c9-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', '3ad59cae-99e9-11ec-95c9-60f262a4e51a', 'theTask', '3ad881e2-99e9-11ec-95c9-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:25:53.520', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('440744be-9d34-11ec-92ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '44071dac-9d34-11ec-92ac-60f262a4e51a', '440744bd-9d34-11ec-92ac-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-06 18:00:34.683', '2022-03-06 18:00:34.686', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4407e0ff-9d34-11ec-92ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '44071dac-9d34-11ec-92ac-60f262a4e51a', '440744bd-9d34-11ec-92ac-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-06 18:00:34.687', '2022-03-06 18:00:34.687', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4407e100-9d34-11ec-92ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '44071dac-9d34-11ec-92ac-60f262a4e51a', '440744bd-9d34-11ec-92ac-60f262a4e51a', 'theTask', '4409dcd1-9d34-11ec-92ac-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-06 18:00:34.687', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('47174372-9f5b-11ec-8849-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4716ce40-9f5b-11ec-8849-60f262a4e51a', '47174371-9f5b-11ec-8849-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:44:52.519', '2022-03-09 11:44:52.522', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('471806c3-9f5b-11ec-8849-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4716ce40-9f5b-11ec-8849-60f262a4e51a', '47174371-9f5b-11ec-8849-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:44:52.524', '2022-03-09 11:44:52.524', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('471806c4-9f5b-11ec-8849-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4716ce40-9f5b-11ec-8849-60f262a4e51a', '47174371-9f5b-11ec-8849-60f262a4e51a', 'theTask', '471b1405-9f5b-11ec-8849-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:44:52.524', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4d7107a8-99eb-11ec-a283-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4d70e096-99eb-11ec-a283-60f262a4e51a', '4d7107a7-99eb-11ec-a283-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:40:43.726', '2022-03-02 13:40:43.728', 2, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4d71a3e9-99eb-11ec-a283-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4d70e096-99eb-11ec-a283-60f262a4e51a', '4d7107a7-99eb-11ec-a283-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:40:43.730', '2022-03-02 13:40:43.730', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4d71a3ea-99eb-11ec-a283-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4d70e096-99eb-11ec-a283-60f262a4e51a', '4d7107a7-99eb-11ec-a283-60f262a4e51a', 'theTask', '4d7378ab-99eb-11ec-a283-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:40:43.730', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4e43e22e-c226-11ec-a685-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4e436cfc-c226-11ec-a685-60f262a4e51a', '4e43e22d-c226-11ec-a685-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-22 18:23:51.926', '2022-04-22 18:23:51.931', 5, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4e44f39f-c226-11ec-a685-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4e436cfc-c226-11ec-a685-60f262a4e51a', '4e43e22d-c226-11ec-a685-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 18:23:51.933', '2022-04-22 18:23:51.933', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('4e44f3a0-c226-11ec-a685-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '4e436cfc-c226-11ec-a685-60f262a4e51a', '4e43e22d-c226-11ec-a685-60f262a4e51a', 'theTask', '4e487611-c226-11ec-a685-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-22 18:23:51.933', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('63b47e5d-bbc4-11ec-8d5f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:27:50.240', '2022-04-14 15:27:50.244', 4, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('63b568be-bbc4-11ec-8d5f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:27:50.246', '2022-04-14 15:27:50.246', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('63b568bf-bbc4-11ec-8d5f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', 'theTask', '63b87600-bbc4-11ec-8d5f-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:27:50.246', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('677fa5df-a9eb-11ec-bd2b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 22:21:46.047', '2022-03-22 22:21:46.049', 2, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('67801b10-a9eb-11ec-bd2b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 22:21:46.050', '2022-03-22 22:21:46.050', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('67804221-a9eb-11ec-bd2b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', 'theTask', '678216e2-a9eb-11ec-bd2b-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 22:21:46.051', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('70864b0e-bbd5-11ec-852a-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '7085fcec-bbd5-11ec-852a-60f262a4e51a', '70864b0d-bbd5-11ec-852a-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 17:29:53.192', '2022-04-14 17:29:53.195', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('70870e5f-bbd5-11ec-852a-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '7085fcec-bbd5-11ec-852a-60f262a4e51a', '70864b0d-bbd5-11ec-852a-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 17:29:53.197', '2022-04-14 17:29:53.197', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('70870e60-bbd5-11ec-852a-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '7085fcec-bbd5-11ec-852a-60f262a4e51a', '70864b0d-bbd5-11ec-852a-60f262a4e51a', 'theTask', '7089a671-bbd5-11ec-852a-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 17:29:53.197', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('70d96d96-99e9-11ec-95c9-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d94685-99e9-11ec-95c9-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:27:24.137', '2022-03-02 13:27:24.137', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('70d96d97-99e9-11ec-95c9-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d94685-99e9-11ec-95c9-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:27:24.137', '2022-03-02 13:27:24.137', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('70d96d98-99e9-11ec-95c9-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d94685-99e9-11ec-95c9-60f262a4e51a', 'leaveTask', '70d96d99-99e9-11ec-95c9-60f262a4e51a', NULL, '请假', 'userTask', NULL, '2022-03-02 13:27:24.137', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('720cfa6f-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:41:45.146', '2022-03-02 13:41:45.146', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('720cfa70-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:41:45.146', '2022-03-02 13:41:45.146', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('720cfa71-99eb-11ec-a283-60f262a4e51a', 2, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'leaveTask', '720cfa72-99eb-11ec-a283-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-02 13:41:45.146', '2022-03-02 13:43:53.485', 128339, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('789bd9f0-c229-11ec-ad12-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '789b64be-c229-11ec-ad12-60f262a4e51a', '789bd9ef-c229-11ec-ad12-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-22 18:46:31.457', '2022-04-22 18:46:31.461', 4, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('789cc451-c229-11ec-ad12-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '789b64be-c229-11ec-ad12-60f262a4e51a', '789bd9ef-c229-11ec-ad12-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 18:46:31.463', '2022-04-22 18:46:31.463', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('789ceb62-c229-11ec-ad12-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '789b64be-c229-11ec-ad12-60f262a4e51a', '789bd9ef-c229-11ec-ad12-60f262a4e51a', 'theTask', '789fd193-c229-11ec-ad12-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-22 18:46:31.464', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('81c45b42-bbd5-11ec-ab5c-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 17:30:22.120', '2022-04-14 17:30:22.123', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('81c51e93-bbd5-11ec-ab5c-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 17:30:22.125', '2022-04-14 17:30:22.125', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('81c51e94-bbd5-11ec-ab5c-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', 'theTask', '81c7ddb5-bbd5-11ec-ab5c-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 17:30:22.125', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('8afe9426-9f5c-11ec-bf9b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:53:55.939', '2022-03-09 11:53:55.942', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('8aff5777-9f5c-11ec-bf9b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:53:55.944', '2022-03-09 11:53:55.944', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('8aff7e88-9f5c-11ec-bf9b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', 'theTask', '8b023da9-9f5c-11ec-bf9b-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:53:55.945', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('8ec62561-a9ce-11ec-a709-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 18:55:16.535', '2022-03-22 18:55:16.541', 6, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('8ec784f2-a9ce-11ec-a709-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 18:55:16.544', '2022-03-22 18:55:16.544', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('8ec784f3-a9ce-11ec-a709-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', 'theTask', '8ecae054-a9ce-11ec-a709-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 18:55:16.544', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('9b6070ec-ae78-11ec-95a7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', '9b6070eb-ae78-11ec-95a7-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-28 17:22:36.774', '2022-03-28 17:22:36.779', 5, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('9b61825d-ae78-11ec-95a7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', '9b6070eb-ae78-11ec-95a7-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-28 17:22:36.781', '2022-03-28 17:22:36.781', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('9b61a96e-ae78-11ec-95a7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', '9b6070eb-ae78-11ec-95a7-60f262a4e51a', 'theTask', '9b6504cf-ae78-11ec-95a7-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-28 17:22:36.782', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('a6cee84e-99e9-11ec-aaa8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:28:54.665', '2022-03-02 13:28:54.667', 2, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('a6cf5d7f-99e9-11ec-aaa8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:28:54.668', '2022-03-02 13:28:54.668', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('a6cf5d80-99e9-11ec-aaa8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 'theTask', 'a6d13241-99e9-11ec-aaa8-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:28:54.668', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('a79ead10-bbc8-11ec-a3eb-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:58:22.169', '2022-04-14 15:58:22.174', 5, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('a7a00ca1-bbc8-11ec-a3eb-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:58:22.178', '2022-04-14 15:58:22.178', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('a7a00ca2-bbc8-11ec-a3eb-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 'theTask', 'a7a515b3-bbc8-11ec-a3eb-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:58:22.178', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('abc035c7-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-04-22 19:16:35.246', '2022-04-22 19:16:35.246', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('abc035c8-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 19:16:35.246', '2022-04-22 19:16:35.246', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('abc035c9-c22d-11ec-ad12-60f262a4e51a', 2, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'leaveTask', 'abc05cda-c22d-11ec-ad12-60f262a4e51a', NULL, '学生提出问题', 'userTask', '111', '2022-04-22 19:16:35.246', '2022-04-22 19:17:32.783', 57537, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('b7ce25ad-bbc3-11ec-9743-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:23:01.841', '2022-04-14 15:23:01.846', 5, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('b7cf853e-bbc3-11ec-9743-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:23:01.849', '2022-04-14 15:23:01.849', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('b7cf853f-bbc3-11ec-9743-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 'theTask', 'b7d355d0-bbc3-11ec-9743-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:23:01.849', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ba85072e-99ea-11ec-abc8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:36:37.232', '2022-03-02 13:36:37.239', 7, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ba879f3f-99ea-11ec-abc8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:36:37.249', '2022-03-02 13:36:37.249', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ba87c650-99ea-11ec-abc8-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', 'theTask', 'ba8db9c1-99ea-11ec-abc8-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:36:37.250', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('be8bf4a6-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'modeFlow', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:43:53.485', '2022-03-02 13:43:53.485', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('be8c1bb7-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cfa6e-99eb-11ec-a283-60f262a4e51a', 'managerTask', 'be8c1bb8-99eb-11ec-a283-60f262a4e51a', NULL, '经理审核', 'userTask', NULL, '2022-03-02 13:43:53.486', NULL, NULL, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('c0e25643-b1ad-11ec-a110-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'c0e25642-b1ad-11ec-a110-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-01 19:20:36.517', '2022-04-01 19:20:36.520', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('c0e31994-b1ad-11ec-a110-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'c0e25642-b1ad-11ec-a110-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-01 19:20:36.522', '2022-04-01 19:20:36.522', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('c0e340a5-b1ad-11ec-a110-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'c0e25642-b1ad-11ec-a110-60f262a4e51a', 'theTask', 'c0e5d8b6-b1ad-11ec-a110-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-01 19:20:36.522', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('c8ad6612-9f5b-11ec-a901-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:48:29.929', '2022-03-09 11:48:29.932', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('c8ae2963-9f5b-11ec-a901-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:48:29.934', '2022-03-09 11:48:29.934', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('c8ae2964-9f5b-11ec-a901-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', 'theTask', 'c8b07355-9f5b-11ec-a901-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:48:29.934', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ce0bf6fe-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'modeFlow', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 19:17:32.785', '2022-04-22 19:17:32.785', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ce0c1e0f-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'managerTask', 'ce0c1e10-c22d-11ec-ad12-60f262a4e51a', NULL, '工作人员处理', 'userTask', NULL, '2022-04-22 19:17:32.786', NULL, NULL, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('d3fd7a9e-9605-11ec-8832-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-02-25 14:40:31.725', '2022-02-25 14:40:31.730', 5, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('d3ff284f-9605-11ec-8832-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-02-25 14:40:31.736', '2022-02-25 14:40:31.736', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('d3ff2850-9605-11ec-8832-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', 'theTask', 'd4040a51-9605-11ec-8832-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-02-25 14:40:31.736', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('d42879d1-b1b2-11ec-8842-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'd42879d0-b1b2-11ec-8842-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-01 19:56:56.336', '2022-04-01 19:56:56.339', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('d4291612-b1b2-11ec-8842-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'd42879d0-b1b2-11ec-8842-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-01 19:56:56.340', '2022-04-01 19:56:56.340', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('d4291613-b1b2-11ec-8842-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'd42879d0-b1b2-11ec-8842-60f262a4e51a', 'theTask', 'd42b8714-b1b2-11ec-8842-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-01 19:56:56.340', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('dc40d9e6-99e9-11ec-9d2f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:30:24.331', '2022-03-02 13:30:24.333', 2, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('dc414f17-99e9-11ec-9d2f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:30:24.334', '2022-03-02 13:30:24.334', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('dc414f18-99e9-11ec-9d2f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 'theTask', 'dc4323d9-99e9-11ec-9d2f-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:30:24.334', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('de0caefc-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0caefb-99eb-11ec-a283-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:44:46.338', '2022-03-02 13:44:46.338', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('de0caefd-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0caefb-99eb-11ec-a283-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:44:46.338', '2022-03-02 13:44:46.338', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('de0caefe-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0caefb-99eb-11ec-a283-60f262a4e51a', 'leaveTask', 'de0caeff-99eb-11ec-a283-60f262a4e51a', NULL, '请假', 'userTask', NULL, '2022-03-02 13:44:46.338', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('dedff72a-9f5c-11ec-91ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'dedff729-9f5c-11ec-91ac-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:56:16.668', '2022-03-09 11:56:16.676', 8, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('dee1cbeb-9f5c-11ec-91ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'dedff729-9f5c-11ec-91ac-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:56:16.679', '2022-03-09 11:56:16.679', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('dee1f2fc-9f5c-11ec-91ac-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'dedff729-9f5c-11ec-91ac-60f262a4e51a', 'theTask', 'dee6aded-9f5c-11ec-91ac-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:56:16.680', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e368dd2e-99ea-11ec-a8f7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-02 13:37:45.834', '2022-03-02 13:37:45.837', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e369796f-99ea-11ec-a8f7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:37:45.839', '2022-03-02 13:37:45.839', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e369a080-99ea-11ec-a8f7-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 'theTask', 'e36bc361-99ea-11ec-a8f7-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-02 13:37:45.839', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e3fa1647-a9c2-11ec-a27f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 17:31:45.521', '2022-03-22 17:31:45.526', 5, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e3fb27b8-a9c2-11ec-a27f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 17:31:45.528', '2022-03-22 17:31:45.528', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e3fb27b9-a9c2-11ec-a27f-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 'theTask', 'e3feaa2a-a9c2-11ec-a27f-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 17:31:45.528', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e4c39613-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39612-99eb-11ec-a283-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-03-02 13:44:57.603', '2022-03-02 13:44:57.603', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e4c39614-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39612-99eb-11ec-a283-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-02 13:44:57.603', '2022-03-02 13:44:57.603', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e4c39615-99eb-11ec-a283-60f262a4e51a', 1, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39612-99eb-11ec-a283-60f262a4e51a', 'leaveTask', 'e4c39616-99eb-11ec-a283-60f262a4e51a', NULL, '请假', 'userTask', '18001020303', '2022-03-02 13:44:57.603', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e6349a18-95ec-11ec-be38-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'e6349a17-95ec-11ec-be38-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-02-25 11:42:04.867', '2022-02-25 11:42:04.870', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e6355d69-95ec-11ec-be38-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'e6349a17-95ec-11ec-be38-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-02-25 11:42:04.872', '2022-02-25 11:42:04.872', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('e6355d6a-95ec-11ec-be38-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'e6349a17-95ec-11ec-be38-60f262a4e51a', 'theTask', 'e638439b-95ec-11ec-be38-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-02-25 11:42:04.872', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ea002b98-9bb8-11ec-b364-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'ea002b97-9bb8-11ec-b364-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-04 20:45:04.381', '2022-03-04 20:45:04.385', 4, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ea0115f9-9bb8-11ec-b364-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'ea002b97-9bb8-11ec-b364-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-04 20:45:04.387', '2022-03-04 20:45:04.387', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('ea0115fa-9bb8-11ec-b364-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'ea002b97-9bb8-11ec-b364-60f262a4e51a', 'theTask', 'ea03fc2b-9bb8-11ec-b364-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-04 20:45:04.387', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('eb38d644-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d643-c22d-11ec-ad12-60f262a4e51a', 'startLeave', NULL, NULL, '开始', 'startEvent', NULL, '2022-04-22 19:18:21.733', '2022-04-22 19:18:21.733', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('eb38d645-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d643-c22d-11ec-ad12-60f262a4e51a', 'flowStart', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-22 19:18:21.733', '2022-04-22 19:18:21.733', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('eb38fd56-c22d-11ec-ad12-60f262a4e51a', 1, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d643-c22d-11ec-ad12-60f262a4e51a', 'leaveTask', 'eb38fd57-c22d-11ec-ad12-60f262a4e51a', NULL, '学生提出问题', 'userTask', '1234', '2022-04-22 19:18:21.734', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('f07afa3b-bbc7-11ec-b56b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-04-14 15:53:14.913', '2022-04-14 15:53:14.916', 3, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('f07be49c-bbc7-11ec-b56b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-04-14 15:53:14.918', '2022-04-14 15:53:14.918', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('f07be49d-bbc7-11ec-b56b-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 'theTask', 'f07f18ee-bbc7-11ec-b56b-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-04-14 15:53:14.918', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('f07f4beb-a9bd-11ec-bd17-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-22 16:56:19.043', '2022-03-22 16:56:19.047', 4, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('f080364c-a9bd-11ec-bd17-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-22 16:56:19.049', '2022-03-22 16:56:19.049', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('f080364d-a9bd-11ec-bd17-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 'theTask', 'f083b8be-a9bd-11ec-bd17-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-22 16:56:19.049', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('fdf40d3a-9f5c-11ec-acb5-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 'theStart', NULL, NULL, NULL, 'startEvent', NULL, '2022-03-09 11:57:08.808', '2022-03-09 11:57:08.812', 4, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('fdf4d08b-9f5c-11ec-acb5-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 'flow1', NULL, NULL, NULL, 'sequenceFlow', NULL, '2022-03-09 11:57:08.813', '2022-03-09 11:57:08.813', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('fdf4d08c-9f5c-11ec-acb5-60f262a4e51a', 1, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 'theTask', 'fdf7ddcd-9f5c-11ec-acb5-60f262a4e51a', NULL, 'my task', 'userTask', NULL, '2022-03-09 11:57:08.813', NULL, NULL, 3, NULL, '');

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_entitylink`;
CREATE TABLE `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_`, `ROOT_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(0) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(0) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(0) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(0) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(0) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(0) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(0) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(0) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(0) NULL DEFAULT NULL,
  `TASK_COUNT_` int(0) NULL DEFAULT NULL,
  `JOB_COUNT_` int(0) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(0) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(0) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(0) NULL DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int(0) NULL DEFAULT NULL,
  `VAR_COUNT_` int(0) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(0) NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------
INSERT INTO `act_ru_execution` VALUES ('0d4945b5-a9d0-11ec-a709-60f262a4e51a', 1, '0d4945b5-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '0d4945b5-a9d0-11ec-a709-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-03-22 19:05:58.284', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('0d49bae7-a9d0-11ec-a709-60f262a4e51a', 1, '0d4945b5-a9d0-11ec-a709-60f262a4e51a', NULL, '0d4945b5-a9d0-11ec-a709-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '0d4945b5-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-22 19:05:58.287', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('17a3e06c-a9d0-11ec-a709-60f262a4e51a', 1, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-03-22 19:06:15.655', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('17a3e06e-a9d0-11ec-a709-60f262a4e51a', 1, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-22 19:06:15.655', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('1efe17d3-bbc6-11ec-9021-60f262a4e51a', 1, '1efe17d3-bbc6-11ec-9021-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '1efe17d3-bbc6-11ec-9021-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-14 15:40:13.953', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('1efe65f4-bbc6-11ec-9021-60f262a4e51a', 1, '1efe17d3-bbc6-11ec-9021-60f262a4e51a', NULL, '1efe17d3-bbc6-11ec-9021-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '1efe17d3-bbc6-11ec-9021-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-14 15:40:13.955', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('3686fa35-a9d0-11ec-a709-60f262a4e51a', 1, '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-03-22 19:07:07.475', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('3686fa37-a9d0-11ec-a709-60f262a4e51a', 1, '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, '3686fa35-a9d0-11ec-a709-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '3686fa35-a9d0-11ec-a709-60f262a4e51a', 'leaveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-22 19:07:07.475', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('3ad5759d-99e9-11ec-95c9-60f262a4e51a', 1, '3ad5759d-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '3ad5759d-99e9-11ec-95c9-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-02 13:25:53.514', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('3ad59cae-99e9-11ec-95c9-60f262a4e51a', 1, '3ad5759d-99e9-11ec-95c9-60f262a4e51a', NULL, '3ad5759d-99e9-11ec-95c9-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '3ad5759d-99e9-11ec-95c9-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:25:53.515', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('44071dac-9d34-11ec-92ac-60f262a4e51a', 1, '44071dac-9d34-11ec-92ac-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '44071dac-9d34-11ec-92ac-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-06 18:00:34.682', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('440744bd-9d34-11ec-92ac-60f262a4e51a', 1, '44071dac-9d34-11ec-92ac-60f262a4e51a', NULL, '44071dac-9d34-11ec-92ac-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '44071dac-9d34-11ec-92ac-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-06 18:00:34.683', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('4716ce40-9f5b-11ec-8849-60f262a4e51a', 1, '4716ce40-9f5b-11ec-8849-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '4716ce40-9f5b-11ec-8849-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-09 11:44:52.516', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('47174371-9f5b-11ec-8849-60f262a4e51a', 1, '4716ce40-9f5b-11ec-8849-60f262a4e51a', NULL, '4716ce40-9f5b-11ec-8849-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '4716ce40-9f5b-11ec-8849-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-09 11:44:52.518', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('4d70e096-99eb-11ec-a283-60f262a4e51a', 1, '4d70e096-99eb-11ec-a283-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '4d70e096-99eb-11ec-a283-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-02 13:40:43.725', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('4d7107a7-99eb-11ec-a283-60f262a4e51a', 1, '4d70e096-99eb-11ec-a283-60f262a4e51a', NULL, '4d70e096-99eb-11ec-a283-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '4d70e096-99eb-11ec-a283-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:40:43.726', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('4e436cfc-c226-11ec-a685-60f262a4e51a', 1, '4e436cfc-c226-11ec-a685-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '4e436cfc-c226-11ec-a685-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-22 18:23:51.923', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('4e43e22d-c226-11ec-a685-60f262a4e51a', 1, '4e436cfc-c226-11ec-a685-60f262a4e51a', NULL, '4e436cfc-c226-11ec-a685-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '4e436cfc-c226-11ec-a685-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-22 18:23:51.926', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', 1, '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-14 15:27:50.236', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('63b4574c-bbc4-11ec-8d5f-60f262a4e51a', 1, '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', NULL, '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-14 15:27:50.239', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', 1, '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-22 22:21:46.046', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('677fa5de-a9eb-11ec-bd2b-60f262a4e51a', 1, '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', NULL, '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-22 22:21:46.047', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('7085fcec-bbd5-11ec-852a-60f262a4e51a', 1, '7085fcec-bbd5-11ec-852a-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '7085fcec-bbd5-11ec-852a-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-14 17:29:53.190', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('70864b0d-bbd5-11ec-852a-60f262a4e51a', 1, '7085fcec-bbd5-11ec-852a-60f262a4e51a', NULL, '7085fcec-bbd5-11ec-852a-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '7085fcec-bbd5-11ec-852a-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-14 17:29:53.192', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('70d91f73-99e9-11ec-95c9-60f262a4e51a', 1, '70d91f73-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '70d91f73-99e9-11ec-95c9-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-03-02 13:27:24.135', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('70d94685-99e9-11ec-95c9-60f262a4e51a', 1, '70d91f73-99e9-11ec-95c9-60f262a4e51a', NULL, '70d91f73-99e9-11ec-95c9-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '70d91f73-99e9-11ec-95c9-60f262a4e51a', 'leaveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:27:24.136', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('720cac4c-99eb-11ec-a283-60f262a4e51a', 1, '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-03-02 13:41:45.144', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('720cfa6e-99eb-11ec-a283-60f262a4e51a', 2, '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, '720cac4c-99eb-11ec-a283-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, '720cac4c-99eb-11ec-a283-60f262a4e51a', 'managerTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:41:45.146', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('789b64be-c229-11ec-ad12-60f262a4e51a', 1, '789b64be-c229-11ec-ad12-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '789b64be-c229-11ec-ad12-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-22 18:46:31.454', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('789bd9ef-c229-11ec-ad12-60f262a4e51a', 1, '789b64be-c229-11ec-ad12-60f262a4e51a', NULL, '789b64be-c229-11ec-ad12-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '789b64be-c229-11ec-ad12-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-22 18:46:31.457', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('81c40d20-bbd5-11ec-ab5c-60f262a4e51a', 1, '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-14 17:30:22.118', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('81c45b41-bbd5-11ec-ab5c-60f262a4e51a', 1, '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', NULL, '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-14 17:30:22.120', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('8afe4604-9f5c-11ec-bf9b-60f262a4e51a', 1, '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-09 11:53:55.937', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('8afe9425-9f5c-11ec-bf9b-60f262a4e51a', 1, '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', NULL, '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-09 11:53:55.939', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('8ec5891f-a9ce-11ec-a709-60f262a4e51a', 1, '8ec5891f-a9ce-11ec-a709-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '8ec5891f-a9ce-11ec-a709-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-22 18:55:16.531', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('8ec5fe50-a9ce-11ec-a709-60f262a4e51a', 1, '8ec5891f-a9ce-11ec-a709-60f262a4e51a', NULL, '8ec5891f-a9ce-11ec-a709-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '8ec5891f-a9ce-11ec-a709-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-22 18:55:16.534', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('9b5ffbba-ae78-11ec-95a7-60f262a4e51a', 1, '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-28 17:22:36.771', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('9b6070eb-ae78-11ec-95a7-60f262a4e51a', 1, '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', NULL, '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-28 17:22:36.774', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 1, 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-02 13:28:54.663', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 1, 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', NULL, 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:28:54.665', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 1, 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-14 15:58:22.167', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 1, 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', NULL, 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-14 15:58:22.169', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 1, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-04-22 19:16:35.244', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('abc035c6-c22d-11ec-ad12-60f262a4e51a', 2, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'managerTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-22 19:16:35.246', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 1, 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-14 15:23:01.838', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 1, 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', NULL, 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-14 15:23:01.840', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('ba841ccc-99ea-11ec-abc8-60f262a4e51a', 1, 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-02 13:36:37.226', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('ba84e01d-99ea-11ec-abc8-60f262a4e51a', 1, 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', NULL, 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:36:37.231', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('c0e22f31-b1ad-11ec-a110-60f262a4e51a', 1, 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-01 19:20:36.514', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('c0e25642-b1ad-11ec-a110-60f262a4e51a', 1, 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', NULL, 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-01 19:20:36.516', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 1, 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-09 11:48:29.927', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('c8ad6611-9f5b-11ec-a901-60f262a4e51a', 1, 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', NULL, 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-09 11:48:29.929', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('d3fd056c-9605-11ec-8832-60f262a4e51a', 1, 'd3fd056c-9605-11ec-8832-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'd3fd056c-9605-11ec-8832-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-02-25 14:40:31.722', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('d3fd7a9d-9605-11ec-8832-60f262a4e51a', 1, 'd3fd056c-9605-11ec-8832-60f262a4e51a', NULL, 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-02-25 14:40:31.725', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('d4282baf-b1b2-11ec-8842-60f262a4e51a', 1, 'd4282baf-b1b2-11ec-8842-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'd4282baf-b1b2-11ec-8842-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-01 19:56:56.334', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('d42879d0-b1b2-11ec-8842-60f262a4e51a', 1, 'd4282baf-b1b2-11ec-8842-60f262a4e51a', NULL, 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-01 19:56:56.336', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 1, 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-02 13:30:24.330', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 1, 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', NULL, 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:30:24.331', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('de0c87e9-99eb-11ec-a283-60f262a4e51a', 1, 'de0c87e9-99eb-11ec-a283-60f262a4e51a', NULL, NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'de0c87e9-99eb-11ec-a283-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-03-02 13:44:46.337', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('de0caefb-99eb-11ec-a283-60f262a4e51a', 1, 'de0c87e9-99eb-11ec-a283-60f262a4e51a', NULL, 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'leaveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:44:46.338', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 1, 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-09 11:56:16.663', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('dedff729-9f5c-11ec-91ac-60f262a4e51a', 1, 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', NULL, 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-09 11:56:16.667', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e368b61c-99ea-11ec-a8f7-60f262a4e51a', 1, 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-02 13:37:45.833', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 1, 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', NULL, 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:37:45.834', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 1, 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-22 17:31:45.518', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 1, 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', NULL, 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-22 17:31:45.521', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e4c39610-99eb-11ec-a283-60f262a4e51a', 1, 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, NULL, 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-03-02 13:44:57.603', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e4c39612-99eb-11ec-a283-60f262a4e51a', 1, 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'leaveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-02 13:44:57.603', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e6344bf6-95ec-11ec-be38-60f262a4e51a', 1, 'e6344bf6-95ec-11ec-be38-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e6344bf6-95ec-11ec-be38-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-02-25 11:42:04.865', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e6349a17-95ec-11ec-be38-60f262a4e51a', 1, 'e6344bf6-95ec-11ec-be38-60f262a4e51a', NULL, 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-02-25 11:42:04.866', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 1, 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-04 20:45:04.379', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('ea002b97-9bb8-11ec-b364-60f262a4e51a', 1, 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', NULL, 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-04 20:45:04.381', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('eb38d641-c22d-11ec-ad12-60f262a4e51a', 1, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'startLeave', '2022-04-22 19:18:21.733', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('eb38d643-c22d-11ec-ad12-60f262a4e51a', 1, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'leaveTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-22 19:18:21.733', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('f07aac19-bbc7-11ec-b56b-60f262a4e51a', 1, 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-04-14 15:53:14.910', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 1, 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', NULL, 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-04-14 15:53:14.912', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 1, 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-22 16:56:19.040', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 1, 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', NULL, 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-22 16:56:19.043', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 1, 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', NULL, NULL, 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'theStart', '2022-03-09 11:57:08.806', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 1, 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', NULL, 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'theTask', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2022-03-09 11:57:08.808', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_external_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_external_job`;
CREATE TABLE `act_ru_external_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(0) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_external_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(0) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_history_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------
INSERT INTO `act_ru_identitylink` VALUES ('17a42d94-a9d0-11ec-a709-60f262a4e51a', 1, NULL, 'participant', '18001020303', NULL, '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('3687214d-a9d0-11ec-a709-60f262a4e51a', 1, NULL, 'participant', '18001020303', NULL, '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('720d6fa4-99eb-11ec-a283-60f262a4e51a', 1, NULL, 'participant', '18001020303', NULL, '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('abc1202c-c22d-11ec-ad12-60f262a4e51a', 1, NULL, 'participant', '111', NULL, 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('e4c39618-99eb-11ec-a283-60f262a4e51a', 1, NULL, 'participant', '18001020303', NULL, 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('eb38fd59-c22d-11ec-ad12-60f262a4e51a', 1, NULL, 'participant', '1234', NULL, 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(0) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(0) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(0) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(0) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(0) NULL DEFAULT NULL,
  `VAR_COUNT_` int(0) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(0) NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------
INSERT INTO `act_ru_task` VALUES ('0d49baeb-a9d0-11ec-a709-60f262a4e51a', 1, '0d49bae7-a9d0-11ec-a709-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, 'leaveTask', NULL, NULL, NULL, 50, '2022-03-22 19:05:58.287', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('17a3e072-a9d0-11ec-a709-60f262a4e51a', 1, '17a3e06e-a9d0-11ec-a709-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, 'leaveTask', NULL, '18001020303', NULL, 50, '2022-03-22 19:06:15.655', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('1f025d98-bbc6-11ec-9021-60f262a4e51a', 1, '1efe65f4-bbc6-11ec-9021-60f262a4e51a', '1efe17d3-bbc6-11ec-9021-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-14 15:40:13.962', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('3687214b-a9d0-11ec-a709-60f262a4e51a', 1, '3686fa37-a9d0-11ec-a709-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, 'leaveTask', NULL, '18001020303', NULL, 50, '2022-03-22 19:07:07.476', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('3ad881e2-99e9-11ec-95c9-60f262a4e51a', 1, '3ad59cae-99e9-11ec-95c9-60f262a4e51a', '3ad5759d-99e9-11ec-95c9-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-02 13:25:53.520', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('4409dcd1-9d34-11ec-92ac-60f262a4e51a', 1, '440744bd-9d34-11ec-92ac-60f262a4e51a', '44071dac-9d34-11ec-92ac-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-06 18:00:34.687', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('471b1405-9f5b-11ec-8849-60f262a4e51a', 1, '47174371-9f5b-11ec-8849-60f262a4e51a', '4716ce40-9f5b-11ec-8849-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-09 11:44:52.524', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('4d7378ab-99eb-11ec-a283-60f262a4e51a', 1, '4d7107a7-99eb-11ec-a283-60f262a4e51a', '4d70e096-99eb-11ec-a283-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-02 13:40:43.730', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('4e487611-c226-11ec-a685-60f262a4e51a', 1, '4e43e22d-c226-11ec-a685-60f262a4e51a', '4e436cfc-c226-11ec-a685-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-22 18:23:51.934', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('63b87600-bbc4-11ec-8d5f-60f262a4e51a', 1, '63b4574c-bbc4-11ec-8d5f-60f262a4e51a', '63b3e21b-bbc4-11ec-8d5f-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-14 15:27:50.246', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('678216e2-a9eb-11ec-bd2b-60f262a4e51a', 1, '677fa5de-a9eb-11ec-bd2b-60f262a4e51a', '677f7ecd-a9eb-11ec-bd2b-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-22 22:21:46.051', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('7089a671-bbd5-11ec-852a-60f262a4e51a', 1, '70864b0d-bbd5-11ec-852a-60f262a4e51a', '7085fcec-bbd5-11ec-852a-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-14 17:29:53.197', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('70d96d99-99e9-11ec-95c9-60f262a4e51a', 1, '70d94685-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, 'leaveTask', NULL, NULL, NULL, 50, '2022-03-02 13:27:24.137', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('789fd193-c229-11ec-ad12-60f262a4e51a', 1, '789bd9ef-c229-11ec-ad12-60f262a4e51a', '789b64be-c229-11ec-ad12-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-22 18:46:31.464', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('81c7ddb5-bbd5-11ec-ab5c-60f262a4e51a', 1, '81c45b41-bbd5-11ec-ab5c-60f262a4e51a', '81c40d20-bbd5-11ec-ab5c-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-14 17:30:22.125', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('8b023da9-9f5c-11ec-bf9b-60f262a4e51a', 1, '8afe9425-9f5c-11ec-bf9b-60f262a4e51a', '8afe4604-9f5c-11ec-bf9b-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-09 11:53:55.945', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('8ecae054-a9ce-11ec-a709-60f262a4e51a', 1, '8ec5fe50-a9ce-11ec-a709-60f262a4e51a', '8ec5891f-a9ce-11ec-a709-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-22 18:55:16.544', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('9b6504cf-ae78-11ec-95a7-60f262a4e51a', 1, '9b6070eb-ae78-11ec-95a7-60f262a4e51a', '9b5ffbba-ae78-11ec-95a7-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-28 17:22:36.782', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('a6d13241-99e9-11ec-aaa8-60f262a4e51a', 1, 'a6cee84d-99e9-11ec-aaa8-60f262a4e51a', 'a6ce9a2c-99e9-11ec-aaa8-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-02 13:28:54.668', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('a7a515b3-bbc8-11ec-a3eb-60f262a4e51a', 1, 'a79ead0f-bbc8-11ec-a3eb-60f262a4e51a', 'a79e5eee-bbc8-11ec-a3eb-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-14 15:58:22.178', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('b7d355d0-bbc3-11ec-9743-60f262a4e51a', 1, 'b7ce25ac-bbc3-11ec-9743-60f262a4e51a', 'b7cdd78b-bbc3-11ec-9743-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-14 15:23:01.849', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('ba8db9c1-99ea-11ec-abc8-60f262a4e51a', 1, 'ba84e01d-99ea-11ec-abc8-60f262a4e51a', 'ba841ccc-99ea-11ec-abc8-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-02 13:36:37.250', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('be8c1bb8-99eb-11ec-a283-60f262a4e51a', 1, '720cfa6e-99eb-11ec-a283-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '经理审核', NULL, NULL, 'managerTask', NULL, NULL, NULL, 50, '2022-03-02 13:43:53.486', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('c0e5d8b6-b1ad-11ec-a110-60f262a4e51a', 1, 'c0e25642-b1ad-11ec-a110-60f262a4e51a', 'c0e22f31-b1ad-11ec-a110-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-01 19:20:36.522', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('c8b07355-9f5b-11ec-a901-60f262a4e51a', 1, 'c8ad6611-9f5b-11ec-a901-60f262a4e51a', 'c8ad17f0-9f5b-11ec-a901-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-09 11:48:29.934', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('ce0c1e10-c22d-11ec-ad12-60f262a4e51a', 1, 'abc035c6-c22d-11ec-ad12-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '工作人员处理', NULL, NULL, 'managerTask', NULL, NULL, NULL, 50, '2022-04-22 19:17:32.786', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('d4040a51-9605-11ec-8832-60f262a4e51a', 1, 'd3fd7a9d-9605-11ec-8832-60f262a4e51a', 'd3fd056c-9605-11ec-8832-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-02-25 14:40:31.736', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('d42b8714-b1b2-11ec-8842-60f262a4e51a', 1, 'd42879d0-b1b2-11ec-8842-60f262a4e51a', 'd4282baf-b1b2-11ec-8842-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-01 19:56:56.340', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('dc4323d9-99e9-11ec-9d2f-60f262a4e51a', 1, 'dc40d9e5-99e9-11ec-9d2f-60f262a4e51a', 'dc40b2d4-99e9-11ec-9d2f-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-02 13:30:24.335', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('de0caeff-99eb-11ec-a283-60f262a4e51a', 1, 'de0caefb-99eb-11ec-a283-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, 'leaveTask', NULL, NULL, NULL, 50, '2022-03-02 13:44:46.338', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('dee6aded-9f5c-11ec-91ac-60f262a4e51a', 1, 'dedff729-9f5c-11ec-91ac-60f262a4e51a', 'dedf5ae8-9f5c-11ec-91ac-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-09 11:56:16.680', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('e36bc361-99ea-11ec-a8f7-60f262a4e51a', 1, 'e368dd2d-99ea-11ec-a8f7-60f262a4e51a', 'e368b61c-99ea-11ec-a8f7-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-02 13:37:45.839', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('e3feaa2a-a9c2-11ec-a27f-60f262a4e51a', 1, 'e3fa1646-a9c2-11ec-a27f-60f262a4e51a', 'e3f9a115-a9c2-11ec-a27f-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-22 17:31:45.528', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('e4c39616-99eb-11ec-a283-60f262a4e51a', 1, 'e4c39612-99eb-11ec-a283-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'Leave:1:3ac8cb6c-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '请假', NULL, NULL, 'leaveTask', NULL, '18001020303', NULL, 50, '2022-03-02 13:44:57.603', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('e638439b-95ec-11ec-be38-60f262a4e51a', 1, 'e6349a17-95ec-11ec-be38-60f262a4e51a', 'e6344bf6-95ec-11ec-be38-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-02-25 11:42:04.873', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('ea03fc2b-9bb8-11ec-b364-60f262a4e51a', 1, 'ea002b97-9bb8-11ec-b364-60f262a4e51a', 'e9ffdd76-9bb8-11ec-b364-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-04 20:45:04.387', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('eb38fd57-c22d-11ec-ad12-60f262a4e51a', 1, 'eb38d643-c22d-11ec-ad12-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'Leave:3:b7b3e6ea-bbc3-11ec-9743-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, '学生提出问题', NULL, NULL, 'leaveTask', NULL, '1234', NULL, 50, '2022-04-22 19:18:21.734', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('f07f18ee-bbc7-11ec-b56b-60f262a4e51a', 1, 'f07afa3a-bbc7-11ec-b56b-60f262a4e51a', 'f07aac19-bbc7-11ec-b56b-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-04-14 15:53:14.918', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('f083b8be-a9bd-11ec-bd17-60f262a4e51a', 1, 'f07f4bea-a9bd-11ec-bd17-60f262a4e51a', 'f07ed6b9-a9bd-11ec-bd17-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-22 16:56:19.049', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('fdf7ddcd-9f5c-11ec-acb5-60f262a4e51a', 1, 'fdf40d39-9f5c-11ec-acb5-60f262a4e51a', 'fdf3bf18-9f5c-11ec-acb5-60f262a4e51a', 'oneTaskProcess:1:e62753a5-95ec-11ec-be38-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, 'my task', NULL, NULL, 'theTask', NULL, NULL, NULL, 50, '2022-03-09 11:57:08.813', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(0) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(0) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------
INSERT INTO `act_ru_variable` VALUES ('0d496cc6-a9d0-11ec-a709-60f262a4e51a', 1, 'null', 'leaveTask', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', '0d4945b5-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('17a3e06d-a9d0-11ec-a709-60f262a4e51a', 1, 'string', 'leaveTask', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', '17a3e06c-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL);
INSERT INTO `act_ru_variable` VALUES ('3686fa36-a9d0-11ec-a709-60f262a4e51a', 1, 'string', 'leaveTask', '3686fa35-a9d0-11ec-a709-60f262a4e51a', '3686fa35-a9d0-11ec-a709-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL);
INSERT INTO `act_ru_variable` VALUES ('70d91f74-99e9-11ec-95c9-60f262a4e51a', 1, 'null', 'leaveTask', '70d91f73-99e9-11ec-95c9-60f262a4e51a', '70d91f73-99e9-11ec-95c9-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('720cd35d-99eb-11ec-a283-60f262a4e51a', 1, 'string', 'leaveTask', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL);
INSERT INTO `act_ru_variable` VALUES ('abbfe7a5-c22d-11ec-ad12-60f262a4e51a', 1, 'string', 'leaveTask', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', NULL);
INSERT INTO `act_ru_variable` VALUES ('be8b5865-99eb-11ec-a283-60f262a4e51a', 1, 'string', 'checkResult', '720cac4c-99eb-11ec-a283-60f262a4e51a', '720cac4c-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '驳回', NULL);
INSERT INTO `act_ru_variable` VALUES ('ce0b0c9d-c22d-11ec-ad12-60f262a4e51a', 1, 'string', 'checkResult', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', 'abbfe7a4-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '驳回', NULL);
INSERT INTO `act_ru_variable` VALUES ('de0c87ea-99eb-11ec-a283-60f262a4e51a', 1, 'null', 'leaveTask', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', 'de0c87e9-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('e4c39611-99eb-11ec-a283-60f262a4e51a', 1, 'string', 'leaveTask', 'e4c39610-99eb-11ec-a283-60f262a4e51a', 'e4c39610-99eb-11ec-a283-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18001020303', NULL);
INSERT INTO `act_ru_variable` VALUES ('eb38d642-c22d-11ec-ad12-60f262a4e51a', 1, 'string', 'leaveTask', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', 'eb38d641-c22d-11ec-ad12-60f262a4e51a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234', NULL);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `category_id` int(0) NULL DEFAULT NULL,
  `top` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'false',
  `comment_count` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (35, '我是周海林', '我是来测试的啊啊啊啊啊啊啊啊啊', 27, '2021-11-20 22:41:30', 8, 'true', 1);
INSERT INTO `article` VALUES (36, '兰博基尼帅', '帅啊兰博基尼真的酷酷啊', 28, '2021-11-20 23:15:48', 9, 'false', 0);
INSERT INTO `article` VALUES (38, 'testtest', '<u>testtsettesttest</u>', 27, '2021-12-22 10:58:17', 8, 'false', 0);
INSERT INTO `article` VALUES (39, 'testtesttest', '<img src=\"http://cdn.iwzb.top/ad30f2e8-8081-411c-bf5a-3c9fc8bccf68.png\" alt=\"屏幕截图(1).png\">testtesttest', 27, '2021-12-22 10:58:50', 8, 'false', 0);
INSERT INTO `article` VALUES (40, 'testtesttest', '<p>testtesttesttesttesttesttesttesttest</p>', 27, '2022-01-18 19:55:24', 9, 'false', 2);
INSERT INTO `article` VALUES (41, '123123', 'etstesttesttesttes', 27, '2022-03-09 11:45:35', 8, 'true', 1);
INSERT INTO `article` VALUES (42, '啊啊啊aa', '<p>aaa啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>', 28, '2022-03-09 12:03:42', 11, 'true', 2);
INSERT INTO `article` VALUES (43, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>', 28, '2022-03-10 09:34:47', 8, 'false', 0);
INSERT INTO `article` VALUES (44, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>', 28, '2022-03-10 09:35:06', 9, 'false', 1);
INSERT INTO `article` VALUES (45, '周海林周海林周海林周海林周海林周海林周海林', '<p>周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林</p>', 28, '2022-03-10 09:36:05', 11, 'false', 3);
INSERT INTO `article` VALUES (46, '周海林周海林周海林周海林周海林周海林周海林', '<p>周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林周海林</p>', 28, '2022-03-10 09:36:20', 10, 'false', 0);
INSERT INTO `article` VALUES (47, '截取List查询结果分页截取List查询结果分页截取List查询结果分页截取List查询结果分页', '<p>截取List查询结果分页</p><p>截取List查询结果分页</p><p>截取List查询结果分页</p><p>截取List查询结果分页</p><h2>截取List查询结果分页</h2>', 28, '2022-03-10 10:08:35', 8, 'false', 0);
INSERT INTO `article` VALUES (50, 'ssssssssssssssssssssssssss', '<p><img src=\"http://localhost:8080/static/res/layui/images/face/4.gif\" alt=\"[可怜]\">‘规范化鸡飞狗叫发<a target=\"_self\" href=\"https://www.baidu.com\">https://www.baidu.com</a></p><p>sssssssssssssssss</p><p><br></p><p style=\"text-align: center; \"><i><b><u><strike>周海林</strike></u></b></i></p>', 28, '2022-04-22 18:31:12', 8, 'true', 2);
INSERT INTO `article` VALUES (52, '测试禁言测试禁言', '<p>测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言测试禁言</p>', 28, '2022-04-22 18:36:51', 9, 'false', 0);
INSERT INTO `article` VALUES (53, '1111111111111111111111111111111111111111111111111111111111111111111', '<p>11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>', 28, '2022-04-22 18:51:16', 10, 'false', 1);
INSERT INTO `article` VALUES (54, '1111111111111111111111111111111111111111111111111', '<p>11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>', 28, '2022-04-22 18:51:51', 8, 'false', 0);

-- ----------------------------
-- Table structure for article_to_category
-- ----------------------------
DROP TABLE IF EXISTS `article_to_category`;
CREATE TABLE `article_to_category`  (
  `id` int(0) NOT NULL,
  `category_id` int(0) NULL DEFAULT NULL,
  `article_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_to_category
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (8, '校园八卦', '2021-11-20 22:05:38');
INSERT INTO `category` VALUES (9, '汽车', '2021-11-20 22:05:43');
INSERT INTO `category` VALUES (10, '校园美女', '2021-11-20 22:05:52');
INSERT INTO `category` VALUES (11, '周海林', '2022-03-09 12:02:23');
INSERT INTO `category` VALUES (12, '校园暴力', '2022-04-14 16:34:44');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `article_id` int(0) NULL DEFAULT NULL,
  `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (31, 24, 34, 'dsssss', '2021-11-20 22:06:37');
INSERT INTO `comment` VALUES (32, 24, 34, 'ddd', '2021-11-20 22:06:43');
INSERT INTO `comment` VALUES (33, 27, 35, 'test', '2021-11-21 00:31:51');
INSERT INTO `comment` VALUES (34, 27, 40, '123', '2022-03-06 23:40:17');
INSERT INTO `comment` VALUES (35, 27, 40, '123', '2022-03-09 11:45:22');
INSERT INTO `comment` VALUES (36, 27, 41, '111', '2022-03-09 11:45:42');
INSERT INTO `comment` VALUES (37, 28, 42, '我是周海林', '2022-03-09 12:04:06');
INSERT INTO `comment` VALUES (38, 27, 45, '111', '2022-03-10 09:45:43');
INSERT INTO `comment` VALUES (39, 27, 45, '111', '2022-03-10 09:45:46');
INSERT INTO `comment` VALUES (40, 27, 45, '111', '2022-03-10 09:45:48');
INSERT INTO `comment` VALUES (41, 27, 44, '111', '2022-03-10 10:08:01');
INSERT INTO `comment` VALUES (42, 27, 42, '123456', '2022-04-01 19:26:04');
INSERT INTO `comment` VALUES (43, 28, 50, '1111', '2022-04-22 18:32:39');
INSERT INTO `comment` VALUES (44, 28, 50, '11111', '2022-04-22 18:32:41');
INSERT INTO `comment` VALUES (45, 27, 53, '111', '2022-04-22 18:51:24');

-- ----------------------------
-- Table structure for flw_channel_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_channel_definition`;
CREATE TABLE `flw_channel_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(0) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CHANNEL_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_channel_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ev_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
CREATE TABLE `flw_ev_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(0) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangelog
-- ----------------------------
INSERT INTO `flw_ev_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2022-02-25 11:27:28', 1, 'EXECUTED', '8:1b0c48c9cf7945be799d868a2626d687', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', NULL, '3.6.2', NULL, NULL, '5759648529');

-- ----------------------------
-- Table structure for flw_ev_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
CREATE TABLE `flw_ev_databasechangeloglock`  (
  `ID` int(0) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangeloglock
-- ----------------------------
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for flw_event_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_definition`;
CREATE TABLE `flw_event_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(0) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_EVENT_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_deployment
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_deployment`;
CREATE TABLE `flw_event_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_resource
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_resource`;
CREATE TABLE `flw_event_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_resource
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch`;
CREATE TABLE `flw_ru_batch`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch_part
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch_part`;
CREATE TABLE `flw_ru_batch_part`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(0) NULL DEFAULT NULL,
  `BATCH_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `FLW_IDX_BATCH_PART`(`BATCH_ID_`) USING BTREE,
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch_part
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reg_time` datetime(0) NULL DEFAULT NULL,
  `last_login_time` datetime(0) NULL DEFAULT NULL,
  `status` enum('正常','禁言') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '正常',
  `type` enum('管理员','普通用户') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '普通用户',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (27, '18001020303', '$2a$10$OyZVNMPyopbQRRV/8eDEZ.EFdHQBqSdqzBlRUM0K9f12kZIgcwchC', '2021-11-20 22:39:32', NULL, '正常', '普通用户', '海林啊', '男', '海林真帅啊', '/Users/zhouhailin/Desktop/All/周海林/照片/周海林.png');
INSERT INTO `user` VALUES (28, '18001020304', '$2a$10$YmMSM5y6nKZ746DZp5X4OeBa8hgXttLGgmbO37MCeIfviwYN1d8cK', '2021-11-20 23:06:15', NULL, '正常', '管理员', 'admin', '男', '我是超级管理员', '/static/res/images/avator/0.jpg');

SET FOREIGN_KEY_CHECKS = 1;
