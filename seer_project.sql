/*
 Navicat Premium Data Transfer

 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Schema         : seer_project

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 21/01/2024 22:40:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buff
-- ----------------------------
DROP TABLE IF EXISTS `buff`;
CREATE TABLE `buff`  (
  `id` int NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态名称',
  `property` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性',
  `object` tinyint NULL DEFAULT NULL COMMENT '属性选取对象（0：自己；1：对方）',
  `rate` int NULL DEFAULT NULL COMMENT '属性比例',
  `type` tinyint NOT NULL COMMENT '状态类型（1：增益；-1：负面）',
  `meaning` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态描述',
  `is_exclusive` tinyint NOT NULL COMMENT '是否专属状态（0：非专属；非0：专属角色id）',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段（0：存在；1：删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buff
-- ----------------------------
INSERT INTO `buff` VALUES (1, '攻击上升', 'attack', 0, 30, 1, '攻击值上升30%', 0, 0, '2023-10-06 11:22:16', '2023-10-06 13:02:26');
INSERT INTO `buff` VALUES (2, '防御上升', 'defense', 0, 30, 1, '防御值上升30%', 0, 0, '2023-10-06 11:23:13', '2023-10-06 13:03:18');
INSERT INTO `buff` VALUES (3, '速度上升', 'speed', 0, 15, 1, '速度值上升15%', 0, 0, '2023-10-06 11:24:16', '2023-10-06 13:10:16');
INSERT INTO `buff` VALUES (4, '攻击下降', 'attack', 0, 30, -1, '攻击值下降30%', 0, 0, '2023-10-06 11:25:13', '2023-10-06 13:02:59');
INSERT INTO `buff` VALUES (5, '防御下降', 'defense', 0, 50, -1, '防御值下降50%', 0, 0, '2023-10-06 11:26:02', '2023-10-06 13:03:02');
INSERT INTO `buff` VALUES (6, '速度下降', 'speed', 0, 15, -1, '速度值下降15%', 0, 0, '2023-10-06 11:26:51', '2023-10-06 13:03:04');
INSERT INTO `buff` VALUES (7, '冻伤', 'speed', 0, 10, -1, '生效时减少施加者攻击值5%的生命值，冻伤存在时减少10%速度值', 0, 0, '2023-10-06 11:34:08', '2023-10-06 13:03:06');
INSERT INTO `buff` VALUES (8, '烧伤', 'attack', 0, 15, -1, '生效时减少施加者攻击值5%的生命值，烧伤存在时减少15%攻击值', 0, 0, '2023-10-06 11:36:47', '2023-10-06 13:03:09');
INSERT INTO `buff` VALUES (9, '雷霆引渡', 'ltyd', 0, 0, -1, '雷伊专属，出手前根据雷伊攻击值比例提高受到的伤害，受到雷伊攻击有概率进入麻痹状态', 56, 0, '2023-10-06 11:42:34', '2023-10-06 13:03:11');
INSERT INTO `buff` VALUES (10, '百练一破', 'blyp', 0, 0, 1, '盖亚专属，百练一破状态下盖亚攻击值上升，可强化盖亚各项技能', 4, 0, '2023-10-09 15:35:11', '2023-10-09 15:35:14');
INSERT INTO `buff` VALUES (11, '此面朝上', 'cmcs', 0, 0, 1, '泰沃斯专属，此状态下泰沃斯攻击值与暴击伤害上升，可强化泰沃斯各项技能', 69, 0, '2023-11-03 16:08:35', '2023-11-03 16:09:18');

-- ----------------------------
-- Table structure for character_base
-- ----------------------------
DROP TABLE IF EXISTS `character_base`;
CREATE TABLE `character_base`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id，自增非空',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称，非空',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色图片，非空',
  `property` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性',
  `attack` int NOT NULL COMMENT '攻击',
  `defense` int NOT NULL COMMENT '防御',
  `life` int NOT NULL COMMENT '生命',
  `speed` int NOT NULL COMMENT '速度',
  `crit` int NOT NULL COMMENT '暴击',
  `critical_damage` int NOT NULL COMMENT '暴伤',
  `precision` int NOT NULL COMMENT '精准',
  `resistance` int NOT NULL COMMENT '抵抗',
  `position` tinyint NOT NULL COMMENT '0.进攻；1.防御；2.干扰；3.辅助',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段，0存在，1删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_base
-- ----------------------------
INSERT INTO `character_base` VALUES (1, '迪符特', 'image.colorcollision.cn/base/64d726da233c7974193e2ce4.png', 'dm', 424, 437, 841, 114, 10, 150, 0, 6, 1, 0, '2023-08-06 04:19:40', '2024-01-18 17:53:41');
INSERT INTO `character_base` VALUES (2, '托鲁克', 'image.colorcollision.cn/base/654503e900754b00aa9d0fb9.PNG', 'fx', 533, 267, 673, 130, 10, 150, 12, 0, 2, 0, '2023-08-06 06:06:18', '2024-01-18 17:53:44');
INSERT INTO `character_base` VALUES (3, '托鲁克', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'fx', 533, 267, 673, 130, 10, 150, 12, 0, 0, 1, '2023-08-06 06:07:31', '2024-01-18 17:53:46');
INSERT INTO `character_base` VALUES (4, '盖亚', 'image.colorcollision.cn/base/64d72721233c7974193e2ce9.png', 'zd', 577, 277, 636, 110, 20, 150, 0, 0, 0, 0, '2023-08-06 06:07:37', '2024-01-18 17:53:49');
INSERT INTO `character_base` VALUES (5, '蘑菇怪', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'c', 335, 225, 620, 102, 10, 150, 12, 0, 2, 0, '2023-08-06 07:07:09', '2024-01-18 17:53:51');
INSERT INTO `character_base` VALUES (6, '钢牙鲨', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 's', 496, 188, 483, 99, 20, 150, 0, 0, 0, 0, '2023-08-06 07:07:12', '2024-01-18 17:53:52');
INSERT INTO `character_base` VALUES (7, '灵翼蜂', 'image.colorcollision.cn/base/64d59a47980d44956b133886.png', 'fx', 456, 194, 520, 100, 20, 150, 0, 0, 0, 0, '2023-08-06 07:07:14', '2024-01-18 17:53:55');
INSERT INTO `character_base` VALUES (8, '吉尔', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'h', 489, 173, 492, 104, 20, 150, 0, 0, 0, 0, '2023-08-06 07:07:15', '2024-01-18 17:53:57');
INSERT INTO `character_base` VALUES (9, '伊娅丝', 'image.colorcollision.cn/base/64d59a59980d44956b133887.png', 'cn', 410, 329, 629, 84, 10, 150, 0, 6, 1, 0, '2023-08-06 07:07:16', '2024-01-18 17:54:01');
INSERT INTO `character_base` VALUES (10, '克拉肯', 'image.colorcollision.cn/base/64d59b39980d44956b133894.png', 's', 387, 192, 585, 112, 10, 150, 6, 12, 3, 0, '2023-08-06 07:07:18', '2024-01-18 17:54:05');
INSERT INTO `character_base` VALUES (11, '迪尔克', 'image.colorcollision.cn/base/64d59b20980d44956b133892.png', 'h', 400, 204, 582, 95, 10, 150, 6, 12, 3, 0, '2023-08-06 07:07:19', '2024-01-18 17:54:07');
INSERT INTO `character_base` VALUES (12, '鲁加斯', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'dm', 341, 346, 735, 71, 10, 150, 0, 6, 1, 0, '2023-08-06 07:07:21', '2024-01-18 17:54:09');
INSERT INTO `character_base` VALUES (13, '古力可可', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'c', 385, 208, 551, 109, 10, 150, 12, 0, 2, 0, '2023-08-07 07:28:13', '2024-01-18 17:54:12');
INSERT INTO `character_base` VALUES (14, '巴拉龟', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 's', 341, 340, 719, 82, 10, 150, 0, 6, 1, 0, '2023-08-06 07:09:17', '2024-01-18 17:54:13');
INSERT INTO `character_base` VALUES (15, '水晶鸭', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 's', 477, 229, 473, 89, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:19', '2024-01-18 17:54:15');
INSERT INTO `character_base` VALUES (16, '小豆芽', 'image.colorcollision.cn/base/64d59b08980d44956b133891.png', 'c', 424, 219, 563, 84, 10, 150, 6, 12, 3, 0, '2023-08-06 07:09:20', '2024-01-18 17:54:16');
INSERT INTO `character_base` VALUES (17, '文杰尔', 'image.colorcollision.cn/base/64d59b42980d44956b133895.png', 'g', 415, 229, 539, 98, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:21', '2024-01-18 17:54:23');
INSERT INTO `character_base` VALUES (18, '塔奇拉顿', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'dm', 331, 367, 701, 76, 10, 150, 0, 6, 1, 0, '2023-08-06 07:09:23', '2024-01-18 17:54:26');
INSERT INTO `character_base` VALUES (19, '索比拉特', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'a', 475, 188, 523, 94, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:24', '2024-01-20 00:49:29');
INSERT INTO `character_base` VALUES (20, '派拉比', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'g', 492, 186, 514, 94, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:25', '2024-01-18 18:00:17');
INSERT INTO `character_base` VALUES (21, '利利', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'd', 485, 173, 505, 101, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:26', '2024-01-18 17:54:46');
INSERT INTO `character_base` VALUES (22, '吉尼亚斯', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'd', 477, 200, 498, 99, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:28', '2024-01-18 17:54:47');
INSERT INTO `character_base` VALUES (23, '拂晓兔', 'image.colorcollision.cn/base/64d59b29980d44956b133893.png', 'cn', 489, 200, 632, 97, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:29', '2024-01-18 17:54:50');
INSERT INTO `character_base` VALUES (24, '杰西卡', 'image.colorcollision.cn/base/64d72717233c7974193e2ce8.png', 'zd', 456, 308, 722, 85, 10, 150, 0, 6, 1, 0, '2023-08-06 07:09:30', '2024-01-18 17:54:53');
INSERT INTO `character_base` VALUES (25, '火刃', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'h', 519, 177, 564, 115, 30, 150, 0, 0, 0, 0, '2023-08-06 07:09:32', '2024-01-18 17:54:56');
INSERT INTO `character_base` VALUES (26, '劳克蒙德', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'zd', 395, 313, 769, 99, 10, 150, 0, 6, 1, 0, '2023-08-06 07:09:33', '2024-01-18 17:54:57');
INSERT INTO `character_base` VALUES (27, '巴伯洛', 'image.colorcollision.cn/base/64d59a92980d44956b13388a.png', 's', 375, 240, 688, 103, 10, 150, 6, 12, 3, 0, '2023-08-06 07:09:34', '2024-01-18 17:55:01');
INSERT INTO `character_base` VALUES (28, '依希亚', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'g', 508, 188, 567, 110, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:35', '2024-01-18 18:00:20');
INSERT INTO `character_base` VALUES (29, '桑特诺娃', 'image.colorcollision.cn/base/64d59a69980d44956b133888.png', 'g', 431, 211, 660, 108, 10, 150, 6, 12, 3, 0, '2023-08-06 07:09:37', '2024-01-18 17:55:09');
INSERT INTO `character_base` VALUES (30, '灵灵', 'image.colorcollision.cn/base/64d59ad1980d44956b13388e.png', 'dm', 500, 200, 648, 98, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:38', '2024-01-18 17:55:11');
INSERT INTO `character_base` VALUES (31, '阿尔比零', 'image.colorcollision.cn/base/64d599d7980d44956b133882.png', 'cn', 416, 323, 716, 102, 10, 150, 0, 6, 1, 0, '2023-08-06 07:09:39', '2024-01-18 17:55:14');
INSERT INTO `character_base` VALUES (32, '魔狮迪露', 'image.colorcollision.cn/base/64d59a00980d44956b133883.png', 'sm', 350, 229, 804, 92, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:40', '2024-01-18 17:55:17');
INSERT INTO `character_base` VALUES (33, '尤纳斯', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'a', 466, 188, 586, 114, 10, 150, 12, 0, 2, 0, '2023-08-06 07:09:42', '2024-01-20 00:49:38');
INSERT INTO `character_base` VALUES (34, '提亚斯', 'image.colorcollision.cn/base/64d59ac0980d44956b13388d.png', 'fx', 452, 179, 664, 110, 20, 150, 0, 0, 1, 0, '2023-08-06 07:09:43', '2024-01-18 17:55:23');
INSERT INTO `character_base` VALUES (35, '皮皮', 'image.colorcollision.cn/base/64d59a85980d44956b133889.png', 'fx', 516, 204, 554, 104, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:44', '2024-01-18 17:55:26');
INSERT INTO `character_base` VALUES (36, '里奥斯', 'image.colorcollision.cn/base/654504b100754b00aa9d0fc2.PNG', 'h', 502, 225, 548, 104, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:46', '2024-01-18 17:55:28');
INSERT INTO `character_base` VALUES (37, '布鲁', 'image.colorcollision.cn/base/64d59aee980d44956b133890.png', 's', 472, 211, 573, 106, 10, 150, 12, 0, 2, 0, '2023-08-06 07:09:47', '2024-01-18 17:55:30');
INSERT INTO `character_base` VALUES (38, '艾尼塔', 'image.colorcollision.cn/base/64d59ae4980d44956b13388f.png', 'h', 504, 200, 554, 110, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:48', '2024-01-18 17:55:34');
INSERT INTO `character_base` VALUES (39, '艾斯菲亚', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'cn', 508, 219, 558, 97, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:50', '2024-01-18 17:55:37');
INSERT INTO `character_base` VALUES (40, '布布花', 'image.colorcollision.cn/base/64d726ce233c7974193e2ce3.png', 'c', 449, 227, 598, 99, 10, 150, 12, 0, 2, 0, '2023-08-06 07:09:51', '2024-01-18 17:55:39');
INSERT INTO `character_base` VALUES (41, '烈焰猩猩', 'image.colorcollision.cn/base/64d726f4233c7974193e2ce5.png', 'h', 496, 213, 539, 113, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:52', '2024-01-18 17:55:41');
INSERT INTO `character_base` VALUES (42, '巴鲁斯', 'image.colorcollision.cn/base/64d726fe233c7974193e2ce6.png', 's', 500, 219, 576, 96, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:53', '2024-01-18 17:55:47');
INSERT INTO `character_base` VALUES (43, '格林', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'dm', 402, 358, 707, 95, 10, 150, 0, 6, 1, 0, '2023-08-06 07:09:54', '2024-01-18 17:55:49');
INSERT INTO `character_base` VALUES (44, '炎魔', 'image.colorcollision.cn/base/6545044200754b00aa9d0fbc.PNG', 'h', 589, 285, 664, 97, 20, 150, 0, 0, 0, 0, '2023-08-06 07:09:56', '2024-01-18 17:55:51');
INSERT INTO `character_base` VALUES (45, '始祖灵兽', 'image.colorcollision.cn/base/64d72707233c7974193e2ce7.png', 'c', 535, 281, 685, 113, 10, 150, 6, 12, 3, 0, '2023-08-06 07:09:57', '2024-01-18 17:55:53');
INSERT INTO `character_base` VALUES (46, '阿克希亚', 'image.colorcollision.cn/base/64d59a9e980d44956b13388b.png', 'b', 512, 275, 692, 116, 10, 150, 12, 0, 2, 0, '2023-08-06 07:09:59', '2024-01-18 17:55:56');
INSERT INTO `character_base` VALUES (47, '罗德利斯', 'image.colorcollision.cn/base/64d59aae980d44956b13388c.png', 'h', 575, 279, 623, 113, 20, 150, 0, 0, 0, 0, '2023-08-06 07:10:00', '2024-01-18 17:55:58');
INSERT INTO `character_base` VALUES (48, '鱼龙王', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 's', 533, 288, 707, 103, 10, 150, 6, 12, 3, 0, '2023-08-06 07:10:01', '2024-01-18 17:56:01');
INSERT INTO `character_base` VALUES (49, '萨菲罗', 'image.colorcollision.cn/base/6545043000754b00aa9d0fbb.PNG', 'cn', 537, 267, 639, 123, 10, 150, 12, 0, 2, 0, '2023-08-06 07:10:03', '2024-01-18 17:56:03');
INSERT INTO `character_base` VALUES (50, '萨菲罗', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'cn', 537, 267, 639, 123, 10, 150, 12, 0, 0, 1, '2023-08-06 07:10:04', '2024-01-18 17:56:06');
INSERT INTO `character_base` VALUES (51, '卡修斯', 'image.colorcollision.cn/base/6545047400754b00aa9d0fbf.PNG', 'dm', 562, 298, 617, 106, 30, 150, 0, 0, 0, 0, '2023-08-06 07:10:05', '2024-01-18 17:56:08');
INSERT INTO `character_base` VALUES (52, '阿哆啦', 'image.colorcollision.cn/base/64d4afd5f30fff0a6afbdc59.png', 'fx', 589, 258, 626, 113, 20, 150, 0, 0, 0, 0, '2023-08-06 07:10:07', '2024-01-18 17:56:11');
INSERT INTO `character_base` VALUES (53, '布莱克', 'image.colorcollision.cn/base/6545046300754b00aa9d0fbe.PNG', 'a', 528, 273, 657, 117, 10, 150, 12, 0, 2, 0, '2023-08-06 07:10:08', '2024-01-20 00:49:33');
INSERT INTO `character_base` VALUES (54, '哈莫雷特', 'image.colorcollision.cn/base/6545040c00754b00aa9d0fba.PNG', 'l', 441, 412, 866, 106, 10, 150, 0, 6, 1, 0, '2023-08-06 07:10:09', '2024-01-18 17:56:16');
INSERT INTO `character_base` VALUES (55, '缪斯', 'image.colorcollision.cn/base/64d59a34980d44956b133885.png', 'cn', 550, 285, 651, 112, 20, 150, 0, 0, 0, 0, '2023-08-06 07:10:10', '2024-01-18 17:56:19');
INSERT INTO `character_base` VALUES (56, '雷伊', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'd', 554, 283, 636, 119, 20, 150, 0, 0, 0, 0, '2023-08-06 07:10:12', '2024-01-18 17:56:21');
INSERT INTO `character_base` VALUES (57, '斯嘉丽', 'image.colorcollision.cn/base/64d59a26980d44956b133884.png', 'g', 591, 267, 651, 116, 20, 150, 0, 0, 0, 0, '2023-08-08 11:40:10', '2024-01-18 17:56:23');
INSERT INTO `character_base` VALUES (58, '塔克林', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'l', 500, 219, 642, 90, 20, 150, 0, 0, 0, 0, '2023-08-10 08:49:46', '2024-01-18 17:56:25');
INSERT INTO `character_base` VALUES (59, '史密斯', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'zd', 469, 186, 533, 97, 20, 150, 0, 0, 0, 0, '2023-08-10 08:55:24', '2024-01-18 17:56:28');
INSERT INTO `character_base` VALUES (60, '天邪龙王', 'image.colorcollision.cn/base/6545044f00754b00aa9d0fbd.PNG', 'xl', 524, 277, 726, 119, 10, 150, 12, 0, 2, 0, '2023-08-31 05:58:23', '2024-01-18 17:56:32');
INSERT INTO `character_base` VALUES (61, '卡鲁耶克', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'sm', 568, 277, 670, 113, 20, 150, 0, 0, 0, 0, '2023-08-31 06:03:46', '2024-01-18 17:56:35');
INSERT INTO `character_base` VALUES (62, '扎夫特', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'a', 498, 200, 620, 106, 20, 150, 0, 0, 0, 0, '2023-08-31 06:08:14', '2024-01-20 00:49:36');
INSERT INTO `character_base` VALUES (63, '沙罗希瓦', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'a', 431, 173, 514, 112, 10, 150, 12, 0, 2, 0, '2023-08-31 06:09:14', '2024-01-20 00:49:39');
INSERT INTO `character_base` VALUES (64, '可泰勒', 'image.colorcollision.cn/base/6545048600754b00aa9d0fc0.PNG', 'b', 524, 277, 689, 120, 10, 150, 12, 0, 2, 0, '2023-09-21 15:40:52', '2024-01-18 17:56:45');
INSERT INTO `character_base` VALUES (65, '克莱芬', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'h', 504, 213, 620, 96, 20, 150, 0, 0, 0, 0, '2023-09-21 15:47:17', '2024-01-18 17:56:49');
INSERT INTO `character_base` VALUES (66, '贝特卡恩', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'zd', 479, 179, 542, 92, 20, 150, 0, 0, 0, 0, '2023-09-21 15:48:54', '2024-01-18 17:56:52');
INSERT INTO `character_base` VALUES (67, '艾恩斯', 'image.colorcollision.cn/base/6545049700754b00aa9d0fc1.PNG', 'h', 600, 275, 673, 115, 20, 150, 0, 0, 0, 0, '2023-10-12 07:11:06', '2024-01-18 17:56:55');
INSERT INTO `character_base` VALUES (68, '肯扎特', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'zd', 514, 219, 620, 101, 20, 150, 0, 0, 0, 0, '2023-10-12 07:16:10', '2024-01-18 17:56:57');
INSERT INTO `character_base` VALUES (69, '泰沃斯', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'h', 583, 281, 642, 113, 20, 150, 0, 0, 0, 0, '2023-11-03 07:11:00', '2024-01-18 17:57:00');
INSERT INTO `character_base` VALUES (70, '古斯特', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'a', 471, 186, 533, 97, 20, 150, 0, 0, 0, 0, '2023-11-03 07:36:43', '2024-01-20 00:49:41');
INSERT INTO `character_base` VALUES (71, '天蛇太祖', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'cn', 526, 283, 679, 123, 10, 150, 12, 0, 2, 0, '2023-11-24 12:44:26', '2024-01-18 17:57:07');
INSERT INTO `character_base` VALUES (72, '艾夏拉', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'zr', 562, 263, 717, 118, 20, 150, 0, 0, 0, 0, '2023-11-24 12:45:00', '2024-01-18 17:57:10');
INSERT INTO `character_base` VALUES (73, '耶里梅斯', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'zd', 593, 275, 626, 115, 20, 150, 0, 0, 0, 0, '2023-11-24 12:45:25', '2024-01-18 17:57:12');
INSERT INTO `character_base` VALUES (74, '塔西亚', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'l', 431, 223, 672, 101, 10, 150, 6, 12, 2, 0, '2023-11-24 12:46:01', '2024-01-18 17:57:14');
INSERT INTO `character_base` VALUES (75, '狄修斯', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'cn', 514, 296, 679, 122, 10, 150, 12, 0, 2, 0, '2023-12-21 09:32:53', '2024-01-18 17:57:17');
INSERT INTO `character_base` VALUES (76, '古尔扎迪', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'dm', 473, 213, 636, 96, 20, 150, 0, 0, 0, 0, '2023-12-21 09:33:27', '2024-01-18 17:57:22');
INSERT INTO `character_base` VALUES (77, '尤米娜', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'a', 539, 281, 682, 121, 10, 150, 12, 0, 2, 0, '2024-01-05 02:54:01', '2024-01-20 00:49:31');
INSERT INTO `character_base` VALUES (78, '吉米丽娅', 'image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg', 'h', 418, 352, 732, 102, 10, 150, 0, 6, 1, 0, '2024-01-05 02:58:27', '2024-01-18 17:57:29');

-- ----------------------------
-- Table structure for character_guide
-- ----------------------------
DROP TABLE IF EXISTS `character_guide`;
CREATE TABLE `character_guide`  (
  `id` int NOT NULL COMMENT '对应角色id',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `overall_evaluation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '整体评价',
  `recommended_star_level` int NULL DEFAULT NULL COMMENT '推荐星级',
  `additional_explanation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '额外说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_guide
-- ----------------------------
INSERT INTO `character_guide` VALUES (0, 'string', 'string', 0, 'string', '2024-01-17 11:58:32', '2024-01-17 12:50:04', 0);
INSERT INTO `character_guide` VALUES (2, '万能辅助角色，一速出手权的博弈关键点。', '流水的C位，铁打的托。说他T0吧，他还真没T0的强度，不需要ban，说他T1吧，高段位巅峰你敢不拿吗？对面拿了你能很好地处理掉吗？托鲁克就在T0和T1的强度之间，但由于他必练必选的特性，整体属于弱T0的梯度。', 5, '0命能用，1命启用，3命好用，5命完全体，6命满速', '2024-01-19 08:34:57', '2024-01-19 08:34:57', 0);
INSERT INTO `character_guide` VALUES (9, '三星辅助角色，常用于协同特训的伤害排名。', '独特的回能+增伤专属状态，使她在凹协同特训回合数中有着独特的作用，可惜3星角色数值太低，不建议练至满配。', 3, '上古版本曾在巅峰之战中有过出场机会。', '2024-01-19 09:23:15', '2024-01-19 09:23:15', 0);
INSERT INTO `character_guide` VALUES (24, '四星战神，真·战斗系五星。', '联防战场双功能，自带续航，高坦高伤，各类PvP玩法都是战神级表现，PvP必练角色。', 5, '0命启用，命数越高越好，四星角色追个满命不难吧？', '2024-01-20 10:22:20', '2024-01-20 10:22:20', 0);
INSERT INTO `character_guide` VALUES (29, '开服最佳奶妈，PVP、PVE双开花，首充的含金量。', '奶量比她高的功能没她多，功能比她多的奶量没她高，奶量功能比她强的坦度能耗没她好。并且，她好看啊！必练角色。', 5, '0命启用，5命能耗稳定', '2024-01-19 11:06:48', '2024-01-19 11:06:48', 0);
INSERT INTO `character_guide` VALUES (31, '解控与控速为一体。', '有效面对超能系控狗，可惜解除异常无法解除专属状态，因此被阿克希亚天克。在某些PVE关卡中也有奇效。', 4, '0命启用，命数收益不高，越高越好。', '2024-01-20 02:25:20', '2024-01-20 02:25:20', 0);
INSERT INTO `character_guide` VALUES (40, '御三家含金量最高的一位，PVE的神。', '新手速通D8的唯一解，简单副本逃课的最优解，低配社团战的神，或许补满输出配可乐后PVP也有出场机会？必练角色。', 5, '0命启用，PVP5命启用', '2024-01-20 11:16:17', '2024-01-20 11:16:17', 0);
INSERT INTO `character_guide` VALUES (43, '四星战神，真·地面系五星。', '最让人头疼的四星角色，有效压制群体伤害的角色，可以做控狗，也可以做输出，各种PvP玩法都有一定强度，还是低配刷矿E的关键角色。', 5, '0命启用，命数越高越好，四星角色追个满命不难吧？', '2024-01-20 10:39:39', '2024-01-20 10:39:39', 0);
INSERT INTO `character_guide` VALUES (45, '目前独一无二的恢复队友能量机制，PVE、PVP双开花，唯一五星奶爸的含金量。', '可惜属性不好，很容易被当成突破口，但是没有关系，他强的地方不是自己，而是对队友的加成，是队友连放三个大招的最稳解。', 5, '0命启用，命数收益不高，需要注意新的护盾会重置已有护盾。', '2024-01-20 09:30:56', '2024-01-20 09:30:56', 0);
INSERT INTO `character_guide` VALUES (46, '最稳定的挂异常角色。', '如果8次80%概率的挂异常你都挂不上，那我也没办法。相比于可泰勒，阿克希亚的特点是稳定挂异常。阿克希亚不怕后上场的杰西卡，23连招伤害大概为2500，配合队友伤害，能够秒杀杰西卡，以防杰西卡带涅槃，站场使用的阿克希亚最好点极限点Ⅲ。', 5, '0命启用，命数越高越适合做站场核心。', '2024-01-20 08:42:56', '2024-01-20 08:42:56', 0);
INSERT INTO `character_guide` VALUES (48, '群体免疫弱化的优越性，异常队亲妈。PVP、PVE两开花。', '可惜回复量不稳定，增益特性远高于恢复特性，但不重要，群体免疫弱化高于一切。也因为免疫弱化，鱼龙王不需要抵抗这一属性。稳定通关高难副本的最优解。必练角色。', 5, '0命启用，魂印提升不大，整体越高越好。', '2024-01-19 16:09:07', '2024-01-20 08:20:29', 0);
INSERT INTO `character_guide` VALUES (54, '第一个限时up角色，优越的机制，黑屋的常客，至今未能掉下T0宝座。', '属性值和机制都极其优越，养成方式多种多样，攻防一体，必练角色。', 5, '0命启用，3命完全体', '2024-01-19 11:49:27', '2024-01-19 12:27:12', 0);
INSERT INTO `character_guide` VALUES (56, '最全面的输出手。', '高速、高攻、有控制、有固伤、有穿防、有稳定群体伤害、有高额单体爆发，可以说是目前输出能力最全面的进攻位角色。', 5, '1命启用，3命完全体，5命最好。', '2024-01-20 13:30:05', '2024-01-20 13:30:05', 0);
INSERT INTO `character_guide` VALUES (60, '碎镜首席，第一个限定的含金量。', '最强的收割角色，能够做到非加时赛强行斩杀，同时因为收割能力极强，非常契合向光而行刻印，能够做到连续斩杀。', 5, '0命启用，3命完全体，最好5命。', '2024-01-20 09:00:51', '2024-01-20 09:00:51', 0);
INSERT INTO `character_guide` VALUES (72, '各种自然属性和强化机制角色的亲妈。', 'T0的意义就是，单个克制角色无法有效针对，至少2个天敌才会难打，所以艾夏拉在1ban位对局中很难面对天邪+天蛇的组合。由于目前奶妈角色多为自然属性，艾夏拉是续航角色的克星，在面对艾夏拉时，阿尔比零特别好用。', 5, '0命启用，3命完全体，最好5命。', '2024-01-20 09:54:28', '2024-01-20 09:54:28', 0);

-- ----------------------------
-- Table structure for character_max
-- ----------------------------
DROP TABLE IF EXISTS `character_max`;
CREATE TABLE `character_max`  (
  `id` int NOT NULL COMMENT '主键id，自增非空',
  `attack` int NOT NULL COMMENT '攻击',
  `defense` int NOT NULL COMMENT '防御',
  `life` int NOT NULL COMMENT '生命',
  `speed` int NOT NULL COMMENT '速度',
  `crit` int NOT NULL COMMENT '暴击',
  `critical_damage` int NOT NULL COMMENT '暴伤',
  `precision` int NOT NULL COMMENT '精准',
  `resistance` int NOT NULL COMMENT '抵抗',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段，0存在，1删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of character_max
-- ----------------------------
INSERT INTO `character_max` VALUES (1, 2377, 2044, 4347, 314, 150, 290, 265, 286, 0, '2023-08-06 04:19:40', '2023-12-21 09:38:55');
INSERT INTO `character_max` VALUES (2, 2774, 1405, 3574, 344, 145, 300, 322, 280, 0, '2023-08-06 06:06:18', '2023-12-21 09:38:56');
INSERT INTO `character_max` VALUES (4, 3071, 1440, 3440, 297, 160, 300, 280, 280, 0, '2023-08-06 06:07:37', '2023-12-21 09:38:56');
INSERT INTO `character_max` VALUES (5, 2074, 1270, 3475, 298, 145, 300, 332, 280, 0, '2023-08-06 07:07:09', '2023-12-21 09:38:57');
INSERT INTO `character_max` VALUES (6, 2747, 1129, 2842, 284, 160, 300, 290, 280, 0, '2023-08-06 07:07:12', '2023-12-21 09:38:57');
INSERT INTO `character_max` VALUES (7, 2601, 1150, 2970, 295, 160, 300, 290, 280, 0, '2023-08-06 07:07:14', '2023-12-21 09:38:57');
INSERT INTO `character_max` VALUES (8, 2721, 1077, 2873, 290, 160, 310, 280, 280, 0, '2023-08-06 07:07:15', '2023-12-21 09:38:57');
INSERT INTO `character_max` VALUES (9, 2350, 1655, 3541, 275, 150, 290, 265, 286, 0, '2023-08-06 07:07:16', '2023-12-21 09:38:58');
INSERT INTO `character_max` VALUES (10, 2290, 1153, 3344, 310, 145, 290, 286, 307, 0, '2023-08-06 07:07:18', '2023-12-21 09:38:58');
INSERT INTO `character_max` VALUES (11, 2335, 1195, 3304, 289, 145, 290, 286, 307, 0, '2023-08-06 07:07:19', '2023-12-21 09:38:58');
INSERT INTO `character_max` VALUES (12, 2129, 1751, 3944, 251, 150, 290, 265, 286, 0, '2023-08-06 07:07:21', '2023-12-21 09:38:59');
INSERT INTO `character_max` VALUES (13, 2244, 1199, 3190, 306, 145, 300, 342, 290, 0, '2023-08-07 07:28:13', '2023-12-21 09:38:59');
INSERT INTO `character_max` VALUES (14, 2095, 1711, 3883, 264, 150, 290, 285, 286, 0, '2023-08-06 07:09:17', '2023-12-21 09:38:59');
INSERT INTO `character_max` VALUES (15, 2677, 1272, 2807, 272, 160, 300, 290, 280, 0, '2023-08-06 07:09:19', '2023-12-21 09:39:00');
INSERT INTO `character_max` VALUES (16, 2462, 1248, 3178, 276, 145, 290, 286, 307, 0, '2023-08-06 07:09:20', '2023-12-21 09:39:00');
INSERT INTO `character_max` VALUES (17, 2450, 1272, 3037, 293, 160, 300, 290, 280, 0, '2023-08-06 07:09:21', '2023-12-21 09:39:00');
INSERT INTO `character_max` VALUES (18, 2077, 1811, 3850, 257, 150, 290, 265, 286, 0, '2023-08-06 07:09:23', '2023-12-21 09:39:01');
INSERT INTO `character_max` VALUES (19, 2669, 1129, 2982, 288, 160, 300, 280, 280, 0, '2023-08-06 07:09:24', '2023-12-21 09:39:01');
INSERT INTO `character_max` VALUES (20, 2732, 1122, 3027, 278, 165, 300, 280, 280, 0, '2023-08-06 07:09:25', '2023-12-21 09:39:01');
INSERT INTO `character_max` VALUES (21, 2706, 1077, 2918, 293, 170, 300, 280, 280, 0, '2023-08-06 07:09:26', '2023-12-21 09:39:01');
INSERT INTO `character_max` VALUES (22, 2701, 1170, 2894, 289, 160, 300, 290, 280, 0, '2023-08-06 07:09:28', '2023-12-21 09:39:02');
INSERT INTO `character_max` VALUES (23, 2721, 1170, 3363, 282, 160, 300, 290, 280, 0, '2023-08-06 07:09:29', '2023-12-21 09:39:02');
INSERT INTO `character_max` VALUES (24, 2509, 1595, 3822, 267, 150, 290, 265, 286, 0, '2023-08-06 07:09:30', '2023-12-21 09:39:02');
INSERT INTO `character_max` VALUES (25, 2830, 1090, 3125, 303, 175, 315, 280, 280, 0, '2023-08-06 07:09:32', '2023-12-21 09:39:03');
INSERT INTO `character_max` VALUES (26, 2298, 1598, 3996, 294, 150, 290, 275, 286, 0, '2023-08-06 07:09:33', '2023-12-21 09:39:03');
INSERT INTO `character_max` VALUES (27, 2248, 1322, 3696, 299, 145, 290, 286, 307, 0, '2023-08-06 07:09:34', '2023-12-21 09:39:03');
INSERT INTO `character_max` VALUES (28, 2790, 1129, 3135, 297, 160, 300, 290, 280, 0, '2023-08-06 07:09:35', '2023-12-21 09:39:03');
INSERT INTO `character_max` VALUES (29, 2445, 1220, 3592, 316, 145, 290, 286, 307, 0, '2023-08-06 07:09:37', '2023-12-21 09:39:04');
INSERT INTO `character_max` VALUES (30, 2785, 1170, 3419, 283, 160, 315, 280, 280, 0, '2023-08-06 07:09:38', '2023-12-21 09:39:04');
INSERT INTO `character_max` VALUES (31, 2350, 1650, 3871, 299, 150, 290, 265, 286, 0, '2023-08-06 07:09:39', '2023-12-21 09:39:04');
INSERT INTO `character_max` VALUES (32, 2213, 1272, 4045, 286, 160, 300, 280, 280, 0, '2023-08-06 07:09:40', '2023-12-21 09:39:05');
INSERT INTO `character_max` VALUES (33, 2520, 1138, 3349, 312, 145, 300, 322, 280, 0, '2023-08-06 07:09:42', '2023-12-21 09:39:05');
INSERT INTO `character_max` VALUES (34, 2472, 1124, 3708, 297, 160, 290, 265, 280, 0, '2023-08-06 07:09:43', '2023-12-21 09:39:05');
INSERT INTO `character_max` VALUES (35, 2820, 1185, 3173, 290, 160, 300, 280, 280, 0, '2023-08-06 07:09:44', '2023-12-21 09:39:06');
INSERT INTO `character_max` VALUES (36, 2768, 1258, 3069, 290, 160, 300, 290, 280, 0, '2023-08-06 07:09:46', '2023-12-21 09:39:06');
INSERT INTO `character_max` VALUES (37, 2540, 1210, 3214, 309, 145, 300, 332, 280, 0, '2023-08-06 07:09:47', '2023-12-21 09:39:06');
INSERT INTO `character_max` VALUES (38, 2800, 1170, 3090, 297, 165, 300, 290, 280, 0, '2023-08-06 07:09:48', '2023-12-21 09:39:07');
INSERT INTO `character_max` VALUES (39, 2790, 1237, 3104, 287, 160, 300, 280, 280, 0, '2023-08-06 07:09:50', '2023-12-21 09:39:07');
INSERT INTO `character_max` VALUES (40, 2462, 1277, 3304, 294, 145, 300, 332, 280, 0, '2023-08-06 07:09:51', '2023-12-21 09:39:07');
INSERT INTO `character_max` VALUES (41, 2771, 1217, 3037, 307, 160, 300, 290, 280, 0, '2023-08-06 07:09:52', '2023-12-21 09:39:07');
INSERT INTO `character_max` VALUES (42, 2760, 1237, 3173, 281, 160, 300, 280, 280, 0, '2023-08-06 07:09:53', '2023-12-21 09:39:08');
INSERT INTO `character_max` VALUES (43, 2342, 1778, 3767, 279, 150, 290, 275, 286, 0, '2023-08-06 07:09:54', '2023-12-21 09:39:08');
INSERT INTO `character_max` VALUES (44, 3086, 1468, 3541, 282, 160, 300, 280, 280, 0, '2023-08-06 07:09:56', '2023-12-21 09:39:08');
INSERT INTO `character_max` VALUES (45, 2835, 1455, 3685, 311, 145, 290, 286, 307, 0, '2023-08-06 07:09:57', '2023-12-21 09:39:09');
INSERT INTO `character_max` VALUES (46, 2676, 1433, 3642, 321, 145, 300, 332, 280, 0, '2023-08-06 07:09:59', '2023-12-21 09:39:09');
INSERT INTO `character_max` VALUES (47, 3034, 1447, 3332, 301, 165, 300, 280, 280, 0, '2023-08-06 07:10:00', '2023-12-21 09:39:09');
INSERT INTO `character_max` VALUES (48, 2802, 1479, 3767, 310, 145, 290, 286, 307, 0, '2023-08-06 07:10:01', '2023-12-21 09:39:10');
INSERT INTO `character_max` VALUES (49, 2761, 1405, 3451, 336, 150, 300, 332, 280, 0, '2023-08-06 07:10:03', '2023-12-21 09:39:10');
INSERT INTO `character_max` VALUES (51, 2987, 1514, 3310, 293, 175, 315, 280, 280, 0, '2023-08-06 07:10:05', '2023-12-21 09:39:11');
INSERT INTO `character_max` VALUES (52, 3056, 1374, 3342, 313, 160, 300, 290, 280, 0, '2023-08-06 07:10:07', '2023-12-21 09:39:11');
INSERT INTO `character_max` VALUES (53, 2783, 1427, 3516, 322, 145, 300, 322, 280, 0, '2023-08-06 07:10:08', '2023-12-21 09:39:11');
INSERT INTO `character_max` VALUES (54, 2457, 1954, 4485, 293, 150, 290, 265, 286, 0, '2023-08-06 07:10:09', '2023-12-21 09:39:11');
INSERT INTO `character_max` VALUES (55, 2943, 1468, 3495, 312, 160, 300, 280, 280, 0, '2023-08-06 07:10:10', '2023-12-21 09:39:12');
INSERT INTO `character_max` VALUES (56, 2958, 1462, 3377, 320, 160, 300, 280, 280, 0, '2023-08-06 07:10:12', '2023-12-21 09:39:12');
INSERT INTO `character_max` VALUES (57, 3093, 1405, 3430, 317, 160, 300, 280, 280, 0, '2023-08-08 11:40:10', '2023-12-21 09:39:12');
INSERT INTO `character_max` VALUES (58, 2760, 1237, 3495, 278, 160, 300, 280, 280, 0, '2023-08-10 08:49:46', '2023-12-21 09:39:13');
INSERT INTO `character_max` VALUES (59, 2694, 1122, 3017, 287, 160, 300, 280, 280, 0, '2023-08-10 08:55:24', '2023-12-21 09:39:13');
INSERT INTO `character_max` VALUES (60, 2743, 1440, 3874, 324, 145, 300, 322, 280, 0, '2023-08-31 05:58:23', '2023-12-21 09:39:13');
INSERT INTO `character_max` VALUES (61, 3009, 1440, 3495, 307, 160, 300, 300, 280, 0, '2023-08-31 06:03:46', '2023-12-21 09:39:14');
INSERT INTO `character_max` VALUES (62, 2754, 1170, 3320, 304, 160, 300, 290, 280, 0, '2023-08-31 06:08:14', '2023-12-21 09:39:14');
INSERT INTO `character_max` VALUES (63, 2401, 1077, 3052, 322, 145, 300, 332, 280, 0, '2023-08-31 06:09:14', '2023-12-21 09:39:14');
INSERT INTO `character_max` VALUES (64, 2743, 1440, 3631, 319, 145, 300, 332, 280, 0, '2023-09-21 15:40:52', '2023-12-21 09:39:14');
INSERT INTO `character_max` VALUES (65, 2775, 1217, 3382, 281, 160, 300, 300, 280, 0, '2023-09-21 15:47:17', '2023-12-21 09:39:15');
INSERT INTO `character_max` VALUES (66, 2732, 1097, 3048, 276, 165, 300, 280, 280, 0, '2023-09-21 15:48:54', '2023-12-21 09:39:15');
INSERT INTO `character_max` VALUES (67, 3155, 1433, 3574, 309, 160, 300, 280, 280, 0, '2023-10-12 07:11:06', '2023-12-21 09:39:15');
INSERT INTO `character_max` VALUES (68, 2812, 1237, 3382, 287, 160, 300, 280, 280, 0, '2023-10-12 07:16:10', '2023-12-21 09:39:16');
INSERT INTO `character_max` VALUES (69, 3064, 1455, 3398, 307, 160, 300, 280, 280, 0, '2023-11-03 07:11:00', '2023-12-21 09:39:16');
INSERT INTO `character_max` VALUES (70, 2679, 1122, 3070, 287, 160, 300, 280, 280, 0, '2023-11-03 07:36:43', '2023-12-21 09:39:17');
INSERT INTO `character_max` VALUES (71, 2776, 1462, 3663, 323, 145, 300, 332, 280, 0, '2023-11-24 12:44:26', '2023-12-21 09:39:17');
INSERT INTO `character_max` VALUES (72, 2959, 1392, 3768, 313, 160, 300, 280, 280, 0, '2023-11-24 12:45:00', '2023-12-21 09:39:17');
INSERT INTO `character_max` VALUES (73, 3100, 1433, 3342, 315, 160, 300, 290, 280, 0, '2023-11-24 12:45:25', '2023-12-21 09:39:17');
INSERT INTO `character_max` VALUES (74, 2401, 1252, 3570, 297, 145, 300, 316, 292, 0, '2023-11-24 12:46:01', '2023-12-21 09:39:18');
INSERT INTO `character_max` VALUES (75, 2709, 1507, 3663, 322, 145, 300, 342, 280, 0, '2023-12-21 09:32:53', '2023-12-21 09:39:18');
INSERT INTO `character_max` VALUES (76, 2662, 1217, 3440, 281, 160, 300, 280, 280, 0, '2023-12-21 09:33:27', '2023-12-21 09:39:18');
INSERT INTO `character_max` VALUES (77, 2768, 1469, 3674, 321, 145, 300, 322, 280, 0, '2024-01-05 02:54:01', '2024-01-05 03:00:12');
INSERT INTO `character_max` VALUES (78, 2357, 1738, 3859, 288, 150, 290, 265, 286, 0, '2024-01-05 02:58:27', '2024-01-05 02:59:32');

-- ----------------------------
-- Table structure for character_plus
-- ----------------------------
DROP TABLE IF EXISTS `character_plus`;
CREATE TABLE `character_plus`  (
  `id` int NOT NULL COMMENT '主键',
  `property` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色属性',
  `skill_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '键值对{技能id:技能等级}',
  `skill_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '键值对{技能id:技能等级}',
  `skill_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '键值对{技能id:技能等级}',
  `is_delete` tinyint(3) UNSIGNED ZEROFILL NOT NULL DEFAULT 000 COMMENT '逻辑删除字段（0：存在；1：删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_plus
-- ----------------------------
INSERT INTO `character_plus` VALUES (2, 'fx', '21', '22', '23', 000, '2023-10-28 11:51:28', NULL);
INSERT INTO `character_plus` VALUES (4, 'zd', '41', '42', '43', 000, '2023-10-09 07:50:40', NULL);
INSERT INTO `character_plus` VALUES (54, 'l', '541', '542', '543', 000, '2023-10-09 08:35:36', NULL);
INSERT INTO `character_plus` VALUES (56, 'd', '561', '562', '563', 000, '2023-09-17 06:28:39', '2023-09-17 14:29:42');
INSERT INTO `character_plus` VALUES (60, 'xl', '601', '602', '603', 000, '2023-10-28 10:12:54', NULL);
INSERT INTO `character_plus` VALUES (69, 'h', '691', '692', '693', 000, '2023-11-03 08:13:53', NULL);

-- ----------------------------
-- Table structure for character_scheme
-- ----------------------------
DROP TABLE IF EXISTS `character_scheme`;
CREATE TABLE `character_scheme`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `character_id` int NOT NULL COMMENT '角色id，非空',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方案名称，非空',
  `applicable_gameplay` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '适用玩法，PVE/PVP/ALL',
  `scheme_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方案说明',
  `recommended_engraving` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刻印套系推荐',
  `passable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '及格面板数值',
  `excellent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优良面板数值',
  `top` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '极品面板数值',
  `talent_points` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '天赋加点',
  `skill_points` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '技能加点',
  `engraving123` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刻印ⅠⅡⅢ',
  `engraving4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刻印Ⅳ',
  `engraving5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刻印Ⅴ',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除，0存在，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character_scheme
-- ----------------------------
INSERT INTO `character_scheme` VALUES (1, 0, 'test', NULL, NULL, NULL, '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', NULL, NULL, NULL, NULL, NULL, '2024-01-17 10:24:28', '2024-01-17 12:50:04', 0);
INSERT INTO `character_scheme` VALUES (2, 0, 'test', NULL, NULL, NULL, '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', NULL, NULL, NULL, NULL, NULL, '2024-01-17 10:30:42', '2024-01-17 12:50:04', 0);
INSERT INTO `character_scheme` VALUES (3, 0, 'test', NULL, NULL, NULL, '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', '{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0}', NULL, NULL, NULL, NULL, NULL, '2024-01-17 10:31:04', '2024-01-17 12:50:04', 0);
INSERT INTO `character_scheme` VALUES (4, 0, 'test', NULL, NULL, NULL, 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, '2024-01-17 11:58:32', '2024-01-17 11:58:32', 0);
INSERT INTO `character_scheme` VALUES (5, 0, 'test', NULL, NULL, NULL, 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, '2024-01-17 11:58:32', '2024-01-17 11:58:32', 0);
INSERT INTO `character_scheme` VALUES (6, 0, 'test', NULL, NULL, NULL, 'null', 'null', 'null', NULL, NULL, NULL, NULL, NULL, '2024-01-17 11:58:32', '2024-01-17 11:58:32', 0);
INSERT INTO `character_scheme` VALUES (7, 2, '满速', 'PVP', '一切为了确保一速出手权，为了满速，可以舍弃掉任意其他属性，在达成满速的情况下，往精准、攻击、生命方向去凑属性。', '3不变+2速度', '{\"attack\":1500,\"crit\":15,\"criticalDamage\":170,\"defense\":494,\"life\":1600,\"precision\":100,\"resistance\":30,\"speed\":314}', '{\"attack\":1700,\"crit\":50,\"criticalDamage\":170,\"defense\":500,\"life\":1800,\"precision\":100,\"resistance\":30,\"speed\":314}', '{\"attack\":1800,\"crit\":100,\"criticalDamage\":170,\"defense\":600,\"life\":2000,\"precision\":150,\"resistance\":30,\"speed\":314}', '潜力特质A；极限特质Ⅱ', '5+；6；6', '速度>攻击百分比≥生命百分比>精准；四号位没暴击大词条时不考虑凑百暴。', '大词条：暴击≥精准>攻击百分比≥生命百分比>暴伤>其它；小词条必须速度20。', '大词条：速度>精准>攻击百分比≥生命百分比>其它', '2024-01-19 08:34:57', '2024-01-19 08:34:57', 0);
INSERT INTO `character_scheme` VALUES (8, 2, '高速高伤', 'PVP', '舍弃一速出手权，尽可能提高伤害。', '3蜕变+2速度or3强者+2速度', '{\"attack\":1800,\"crit\":100,\"criticalDamage\":170,\"defense\":494,\"life\":1500,\"precision\":72,\"resistance\":30,\"speed\":295}', '{\"attack\":1900,\"crit\":100,\"criticalDamage\":220,\"defense\":494,\"life\":1500,\"precision\":100,\"resistance\":30,\"speed\":301}', '{\"attack\":2000,\"crit\":100,\"criticalDamage\":270,\"defense\":494,\"life\":1500,\"precision\":100,\"resistance\":30,\"speed\":301}', '潜力特质A；极限特质Ⅲ', '5+；6；6', '速度≥攻击百分比≥暴伤≥暴击>其它', '大词条：暴击≥暴伤>攻击百分比>其它', '大词条：速度>攻击百分比≥攻击>其它', '2024-01-19 08:34:57', '2024-01-19 08:34:57', 0);
INSERT INTO `character_scheme` VALUES (9, 2, '高速异常', 'PVP', '舍弃一速出手权，配合队友需要的异常状态。', '3异常+2速度', '{\"attack\":1500,\"crit\":15,\"criticalDamage\":170,\"defense\":600,\"life\":2000,\"precision\":130,\"resistance\":30,\"speed\":295}', '{\"attack\":1600,\"crit\":15,\"criticalDamage\":170,\"defense\":700,\"life\":2200,\"precision\":150,\"resistance\":30,\"speed\":301}', '{\"attack\":1700,\"crit\":15,\"criticalDamage\":170,\"defense\":800,\"life\":2400,\"precision\":200,\"resistance\":30,\"speed\":301}', '潜力特质A；极限特质Ⅱ', '5+；6；6', '速度>攻击百分比≥生命百分比>精准', '大词条：精准≥生命百分比>攻击百分比>其它', '大词条：速度>精准≥生命百分比>攻击百分比>其它', '2024-01-19 08:34:57', '2024-01-19 08:34:57', 0);
INSERT INTO `character_scheme` VALUES (10, 29, '高命高速', 'ALL', '桑特诺娃的魂印有10%速度，这使她的速度极快，高速可以在己方核心输出角色出手前为他附加增益状态，具有更高的容错。', '3指引/耀光+2速度/生命', '{\"attack\":831,\"crit\":10,\"criticalDamage\":160,\"defense\":700,\"life\":2600,\"precision\":36,\"resistance\":100,\"speed\":200}', '{\"attack\":831,\"crit\":10,\"criticalDamage\":160,\"defense\":800,\"life\":2800,\"precision\":36,\"resistance\":130,\"speed\":220}', '{\"attack\":875,\"crit\":15,\"criticalDamage\":160,\"defense\":900,\"life\":3000,\"precision\":36,\"resistance\":160,\"speed\":250}', '潜力特质A；极限特质Ⅲ', '6；4；4', '速度≥生命百分比>防御百分比>抵抗=生命=防御>其它', '大词条：生命百分比≥抵抗>防御百分比>其它', '大词条：速度≥生命百分比>其它', '2024-01-19 11:06:48', '2024-01-19 11:06:48', 0);
INSERT INTO `character_scheme` VALUES (11, 29, '高命底速', 'PVP', '用抵抗代替速度，后出手，会比高速的养成方案更硬。', '3虚空/指引/耀光+2抵抗/生命', '{\"attack\":831,\"crit\":10,\"criticalDamage\":160,\"defense\":700,\"life\":2800,\"precision\":36,\"resistance\":182,\"speed\":129}', '{\"attack\":831,\"crit\":10,\"criticalDamage\":160,\"defense\":800,\"life\":2900,\"precision\":36,\"resistance\":202,\"speed\":129}', '{\"attack\":875,\"crit\":10,\"criticalDamage\":160,\"defense\":900,\"life\":3000,\"precision\":36,\"resistance\":242,\"speed\":129}', '潜力特质B；极限特质Ⅲ', '6；4；4', '生命百分比≥防御百分比>抵抗=生命=防御>其它', '大词条：生命百分比≥抵抗>防御百分比>其它', '大词条：生命百分比≥抵抗>防御百分比>其它', '2024-01-19 11:06:48', '2024-01-19 11:06:48', 0);
INSERT INTO `character_scheme` VALUES (12, 54, '极致输出', 'ALL', '数值怪物，挥剑一次，平地人均1200伤害，务必在他挥剑前控住他！', '3跨越/3荣耀+2生命', '{\"attack\":1500,\"crit\":50,\"criticalDamage\":200,\"defense\":900,\"life\":3500,\"precision\":15,\"resistance\":36,\"speed\":116}', '{\"attack\":1600,\"crit\":100,\"criticalDamage\":200,\"defense\":1000,\"life\":3700,\"precision\":15,\"resistance\":50,\"speed\":116}', '{\"attack\":1700,\"crit\":100,\"criticalDamage\":200,\"defense\":1100,\"life\":3900,\"precision\":15,\"resistance\":80,\"speed\":116}', '潜力特质B；极限特质Ⅰ', '6；1；6', '生命百分比≥攻击百分比>防御百分比>暴伤≥暴击>其它', '大词条：生命百分比=暴击>攻击百分比>其它', '大词条：生命百分比≥攻击百分比>抵抗>其它', '2024-01-19 11:49:27', '2024-01-19 12:03:16', 0);
INSERT INTO `character_scheme` VALUES (13, 54, '高速控制', 'PVP', '更适合守阵的养成方案，社团战和竞技场的守阵战神，巅峰之战也有奇效。', '3火焰+2生命', '{\"attack\":864,\"crit\":20,\"criticalDamage\":160,\"defense\":1000,\"life\":3600,\"precision\":150,\"resistance\":36,\"speed\":180}', '{\"attack\":864,\"crit\":20,\"criticalDamage\":160,\"defense\":1100,\"life\":3700,\"precision\":170,\"resistance\":50,\"speed\":200}', '{\"attack\":864,\"crit\":20,\"criticalDamage\":160,\"defense\":1200,\"life\":3800,\"precision\":190,\"resistance\":50,\"speed\":220}', '潜力特质B；极限特质Ⅰ', '6；1；6', '速度>生命百分比≥防御百分比>精准>其它', '大词条：生命百分比=精准>其它', '大词条：速度≥精准>生命百分比>其它', '2024-01-19 11:49:27', '2024-01-19 12:03:16', 0);
INSERT INTO `character_scheme` VALUES (14, 54, '战坦双修', 'PVP', '最万金油的养成方案，意味着各方面都不突出，也意味着各方面都还可以', '3荣耀/跨越/虚空+2精准/抵抗', '{\"attack\":1300,\"crit\":70,\"criticalDamage\":160,\"defense\":800,\"life\":3400,\"precision\":100,\"resistance\":100,\"speed\":150}', '{\"attack\":1400,\"crit\":100,\"criticalDamage\":160,\"defense\":900,\"life\":3500,\"precision\":100,\"resistance\":100,\"speed\":150}', '{\"attack\":1500,\"crit\":100,\"criticalDamage\":160,\"defense\":1000,\"life\":3600,\"precision\":100,\"resistance\":100,\"speed\":150}', '潜力特质B；极限特质Ⅰ', '6；1；6', '生命百分比≥攻击百分比>防御百分比>其它；优先保证精准抵抗双100，然后凑百暴。', '大词条：生命百分比=暴击>其它', '大词条：生命百分比=精准=抵抗>其它', '2024-01-19 11:49:27', '2024-01-19 12:03:16', 0);
INSERT INTO `character_scheme` VALUES (15, 54, '底速联防', 'PVP', '不建议这么养，有点浪费，但这个方案养出来的哈莫是最硬的。', '3虚空+2抵抗', '{\"attack\":1000,\"crit\":20,\"criticalDamage\":160,\"defense\":1200,\"life\":3700,\"precision\":15,\"resistance\":180,\"speed\":106}', '{\"attack\":1100,\"crit\":20,\"criticalDamage\":160,\"defense\":1300,\"life\":3800,\"precision\":15,\"resistance\":200,\"speed\":106}', '{\"attack\":1200,\"crit\":20,\"criticalDamage\":160,\"defense\":1400,\"life\":3900,\"precision\":15,\"resistance\":220,\"speed\":106}', '潜力特质B；极限特质Ⅱ', '6；1；6', '生命百分比>防御百分比>抵抗>生命>防御其它', '大词条：生命百分比=抵抗>其它', '大词条：生命百分比=抵抗>其它', '2024-01-19 12:27:12', '2024-01-19 12:27:12', 0);
INSERT INTO `character_scheme` VALUES (16, 31, '低速解控', 'ALL', '配合两个速度更快的队友，队友的速度最好比对方的控狗快，因为阿尔比零需要的属性只有生命防御抵抗，低速可以更好的拉满数值。', '3指引/无悔/虚空+2生命/抵抗', '{\"attack\":816,\"crit\":10,\"criticalDamage\":150,\"defense\":1000,\"life\":2900,\"precision\":15,\"resistance\":180,\"speed\":123}', '{\"attack\":816,\"crit\":10,\"criticalDamage\":150,\"defense\":1100,\"life\":3100,\"precision\":15,\"resistance\":200,\"speed\":123}', '{\"attack\":816,\"crit\":20,\"criticalDamage\":160,\"defense\":1200,\"life\":3300,\"precision\":15,\"resistance\":220,\"speed\":123}', '潜力特质B；极限特质Ⅲ', '5；4；1', '生命百分比＞防御百分比>抵抗>生命>防御>其它', '大词条：抵抗≥生命百分比＞防御百分比>其它', '大词条：抵抗≥生命百分比防御百分比>其它', '2024-01-20 02:25:20', '2024-01-20 02:25:20', 0);
INSERT INTO `character_scheme` VALUES (17, 31, '中速出手', 'ALL', '配合两个速度更慢的队友，阿尔比零确保必要的时候队友稳定出手，舍弃些许数值，适当提升速度，速度不用硬追高速，比队友快即可。', '3指引/无悔/虚空+2生命/抵抗', '{\"attack\":816,\"crit\":10,\"criticalDamage\":150,\"defense\":1000,\"life\":2800,\"precision\":15,\"resistance\":130,\"speed\":168}', '{\"attack\":816,\"crit\":10,\"criticalDamage\":150,\"defense\":1000,\"life\":2900,\"precision\":15,\"resistance\":150,\"speed\":188}', '{\"attack\":816,\"crit\":20,\"criticalDamage\":160,\"defense\":1100,\"life\":3000,\"precision\":15,\"resistance\":170,\"speed\":208}', '潜力特质B；极限特质Ⅲ', '5；4；1', '生命百分比＞防御百分比>抵抗>生命>防御>其它', '大词条：抵抗≥生命百分比＞防御百分比>其它', '大词条：速度≥抵抗≥生命百分比防御百分比>其它', '2024-01-20 02:25:20', '2024-01-20 02:25:20', 0);
INSERT INTO `character_scheme` VALUES (18, 48, '高速先手', 'ALL', '因为鱼龙王自带免疫弱化，如果鱼龙王先于对方出手，则无需抵抗属性，同时一速出手的鱼龙王，大概率能稳定触发极限特质Ⅲ，很适合打爆发伤害。在保证速度的前提下，可以往攻击凑属性，也可以往生命凑属性，但不是很建议凑暴击，满爆鱼龙王至少需要3个暴击小词条，收益低于三维百分比。', '3不变+2速度/生命', '{\"attack\":1500,\"crit\":65,\"criticalDamage\":160,\"defense\":700,\"life\":2800,\"precision\":36,\"resistance\":57,\"speed\":240}', '{\"attack\":1600,\"crit\":65,\"criticalDamage\":160,\"defense\":800,\"life\":3000,\"precision\":36,\"resistance\":57,\"speed\":250}', '{\"attack\":1700,\"crit\":65,\"criticalDamage\":160,\"defense\":900,\"life\":3200,\"precision\":36,\"resistance\":57,\"speed\":260}', '潜力特质A；极限特质Ⅲ', '5+；3+；5+', '速度>生命百分比=攻击百分比>防御百分比>三维数值>其它', '大词条：暴击>生命百分比=攻击百分比>其它', '大词条：速度>生命百分比=攻击百分比>其它', '2024-01-20 08:20:29', '2024-01-20 08:20:29', 0);
INSERT INTO `character_scheme` VALUES (19, 48, '底速破空', 'PVP', '因为鱼龙王本身速度不算快，高速属性也不容易养，完全可以做底速角色，带破空刻印后手开大，能够保证鱼龙王必定开出一次大招，适合面对高速的控狗和异常队的时候。因为不再需要速度，潜力特质可以点B，也可以凑满爆属性了，1800攻击210暴伤的辅助角色也是很痛的。', '3破空+2生命/攻击', '{\"attack\":1600,\"crit\":65,\"criticalDamage\":160,\"defense\":700,\"life\":2800,\"precision\":36,\"resistance\":57,\"speed\":135}', '{\"attack\":1700,\"crit\":100,\"criticalDamage\":210,\"defense\":800,\"life\":3000,\"precision\":36,\"resistance\":57,\"speed\":135}', '{\"attack\":1800,\"crit\":100,\"criticalDamage\":210,\"defense\":900,\"life\":3200,\"precision\":36,\"resistance\":57,\"speed\":135}', '潜力特质B；极限特质Ⅰ', '5+；5+；5+', '生命百分比=攻击百分比>暴击>防御百分比>其它', '大词条：暴击>暴伤≥攻击百分比>生命百分比>其它', '大词条：生命百分比=攻击百分比>其它', '2024-01-20 08:20:29', '2024-01-20 08:20:29', 0);
INSERT INTO `character_scheme` VALUES (20, 48, '极致输出', 'PVE', '作为PVE的养成方案，这里面板数值的速度只做参考，实际速度值应该低于己方队友，高于敌方boss。如果需要鱼龙王的禁强特性，就需要把精准叠到100+，否则无需叠精准。', '3守护/强者+2攻击', '{\"attack\":1800,\"crit\":100,\"criticalDamage\":230,\"defense\":500,\"life\":2100,\"precision\":36,\"resistance\":57,\"speed\":190}', '{\"attack\":1900,\"crit\":100,\"criticalDamage\":250,\"defense\":500,\"life\":2300,\"precision\":36,\"resistance\":57,\"speed\":190}', '{\"attack\":2000,\"crit\":100,\"criticalDamage\":270,\"defense\":500,\"life\":2500,\"precision\":50,\"resistance\":57,\"speed\":190}', '潜力特质A；极限特质Ⅰ', '5+；5+；5+', '生命百分比=攻击百分比>暴击>精准>其它', '大词条：暴击>暴伤>精准≥攻击百分比>其它', '大词条：攻击百分比>速度>精准>其它', '2024-01-20 08:20:29', '2024-01-20 08:20:29', 0);
INSERT INTO `character_scheme` VALUES (21, 46, '站场核心', 'PVP', '作为站场核心时，可以适当舍弃一些速度和精准，潜力特质也可以点B，极限特质点Ⅲ时可以当作进攻型角色使用，不怕后上场的涅槃角色。', '3守护/强者+2攻击/精准', '{\"attack\":2000,\"crit\":100,\"criticalDamage\":220,\"defense\":500,\"life\":1700,\"precision\":100,\"resistance\":30,\"speed\":200}', '{\"attack\":2100,\"crit\":100,\"criticalDamage\":240,\"defense\":500,\"life\":1800,\"precision\":100,\"resistance\":30,\"speed\":220}', '{\"attack\":2200,\"crit\":100,\"criticalDamage\":260,\"defense\":600,\"life\":1900,\"precision\":100,\"resistance\":30,\"speed\":240}', '潜力特质B；极限特质Ⅲ', '3+；6；6', '攻击百分比>生命百分比=暴击>暴伤>精准>其它', '大词条：暴击>暴伤>精准≥攻击百分比>其它', '大词条：攻击百分比>速度>精准>其它', '2024-01-20 08:42:56', '2024-01-20 08:42:56', 0);
INSERT INTO `character_scheme` VALUES (22, 46, '高速辅助', 'PVP', '作为高速辅助时，速度优先，其次精准和生命，不再要求伤害能力。事实上用两个精准大词条把精准叠到182之后就可以选择更多的三维百分比小词条了。', '3不变/雪原+2速度/精准', '{\"attack\":1400,\"crit\":50,\"criticalDamage\":170,\"defense\":600,\"life\":1900,\"precision\":160,\"resistance\":30,\"speed\":260}', '{\"attack\":1500,\"crit\":65,\"criticalDamage\":170,\"defense\":700,\"life\":2100,\"precision\":180,\"resistance\":30,\"speed\":270}', '{\"attack\":1600,\"crit\":65,\"criticalDamage\":170,\"defense\":800,\"life\":2300,\"precision\":200,\"resistance\":30,\"speed\":280}', '潜力特质A；极限特质Ⅱ', '3+；5+；3+', '速度>攻击百分比=生命百分比=防御百分比>精准>其它', '大词条：精准≥暴击>生命百分比>攻击百分比>其它', '大词条：速度>精准>生命百分比=攻击百分比>其它', '2024-01-20 08:42:56', '2024-01-20 08:42:56', 0);
INSERT INTO `character_scheme` VALUES (23, 60, '向光而行', 'PVP', '天邪龙王只有先出手时才有伤害，所以暴击不是最重要的，速度、生命优先，其次精准过百', '3向光+2生命/精准/速度', '{\"attack\":1600,\"crit\":50,\"criticalDamage\":170,\"defense\":505,\"life\":2800,\"precision\":90,\"resistance\":30,\"speed\":240}', '{\"attack\":1700,\"crit\":65,\"criticalDamage\":170,\"defense\":600,\"life\":3000,\"precision\":100,\"resistance\":30,\"speed\":250}', '{\"attack\":1800,\"crit\":65,\"criticalDamage\":170,\"defense\":700,\"life\":3200,\"precision\":100,\"resistance\":30,\"speed\":260}', '潜力特质A；极限特质Ⅰ', '6；6；6', '速度≥生命百分比>攻击百分比>精准=防御百分比>其它', '大词条：暴击=生命百分比>暴伤>精准>攻击百分比>其它', '大词条：速度≥生命百分比>精准>攻击百分比>其它', '2024-01-20 09:00:51', '2024-01-20 09:00:51', 0);
INSERT INTO `character_scheme` VALUES (24, 60, '百暴', 'PVE', 'PVE时多半看重二技能的破防和禁强，一般是一二技能交替使用，暴击属性优先。其次精准和生命。凑不出百暴可以50暴极限开Ⅱ。', '3守护/强者+2生命/精准', '{\"attack\":1800,\"crit\":50,\"criticalDamage\":170,\"defense\":500,\"life\":2000,\"precision\":160,\"resistance\":30,\"speed\":180}', '{\"attack\":1900,\"crit\":100,\"criticalDamage\":170,\"defense\":500,\"life\":2200,\"precision\":180,\"resistance\":30,\"speed\":200}', '{\"attack\":2000,\"crit\":100,\"criticalDamage\":170,\"defense\":600,\"life\":2400,\"precision\":200,\"resistance\":30,\"speed\":220}', '潜力特质A；极限特质Ⅰ', '6；6；6', '生命百分比=攻击百分比>暴击=精准=速度=攻击>其它', '大词条：暴击>精准=生命百分比>攻击百分比>其它', '大词条：速度≥精准>生命百分比>攻击百分比>其它', '2024-01-20 09:00:51', '2024-01-20 09:00:51', 0);
INSERT INTO `character_scheme` VALUES (25, 45, '底速虚空', 'ALL', '将三维与抵抗拉满，底速出手，可站场可联防。', '3虚空+2抵抗/生命/攻击', '{\"attack\":1800,\"crit\":15,\"criticalDamage\":160,\"defense\":700,\"life\":2600,\"precision\":36,\"resistance\":160,\"speed\":123}', '{\"attack\":1900,\"crit\":15,\"criticalDamage\":160,\"defense\":800,\"life\":2800,\"precision\":36,\"resistance\":180,\"speed\":123}', '{\"attack\":2000,\"crit\":15,\"criticalDamage\":160,\"defense\":900,\"life\":3000,\"precision\":36,\"resistance\":200,\"speed\":123}', '潜力特质B；极限特质Ⅲ', '5+；3+；6', '抵抗>生命百分比=攻击百分比>防御百分比>攻击=生命=其它', '大词条：抵抗>生命百分比=攻击百分比>防御百分比>其它', '大词条：抵抗>生命百分比=攻击百分比>防御百分比>其它', '2024-01-20 09:30:56', '2024-01-20 09:30:56', 0);
INSERT INTO `character_scheme` VALUES (26, 45, '中速指引', 'PVP', '在对方的底速角色出手前来一口奶，一般作为替补角色联防上场。', '3指引+2抵抗/生命/攻击', '{\"attack\":1800,\"crit\":15,\"criticalDamage\":160,\"defense\":700,\"life\":2500,\"precision\":36,\"resistance\":160,\"speed\":150}', '{\"attack\":1900,\"crit\":15,\"criticalDamage\":160,\"defense\":800,\"life\":2700,\"precision\":36,\"resistance\":180,\"speed\":160}', '{\"attack\":2000,\"crit\":15,\"criticalDamage\":160,\"defense\":900,\"life\":2900,\"precision\":36,\"resistance\":200,\"speed\":170}', '潜力特质B；极限特质Ⅲ', '5+；3+；6', '抵抗>生命百分比=攻击百分比>防御百分比>速度>其它', '大词条：抵抗>生命百分比=攻击百分比>防御百分比>其它', '大词条：抵抗>生命百分比=攻击百分比>防御百分比>其它', '2024-01-20 09:30:56', '2024-01-20 09:30:56', 0);
INSERT INTO `character_scheme` VALUES (27, 45, '娱乐玩法', 'PVP', '使用异常刻印或者攻击刻印，主打一个出其不意，特别是面对对方双光的阵容时，如果带异常刻印，舍弃暴击暴伤换精准速度，如果带攻击刻印，舍弃精准换抵抗和防御。', '3异常/荣耀+2抵抗/生命/攻击', '{\"attack\":2200,\"crit\":50,\"criticalDamage\":210,\"defense\":510,\"life\":2100,\"precision\":50,\"resistance\":100,\"speed\":123}', '{\"attack\":2300,\"crit\":65,\"criticalDamage\":210,\"defense\":510,\"life\":2300,\"precision\":100,\"resistance\":100,\"speed\":123}', '{\"attack\":2400,\"crit\":100,\"criticalDamage\":210,\"defense\":510,\"life\":2500,\"precision\":100,\"resistance\":120,\"speed\":123}', '潜力特质B；极限特质Ⅲ', '5+；3+；6', '生命百分比=攻击百分比>暴击>抵抗>其它', '大词条：暴击>暴伤≥攻击百分比>其它', '大词条：生命百分比=攻击百分比>抵抗>其它', '2024-01-20 09:30:56', '2024-01-20 09:30:56', 0);
INSERT INTO `character_scheme` VALUES (28, 72, '高命高攻', 'ALL', '极限特质ⅠⅡⅢ都可以用，但是Ⅰ的收益最高。艾夏拉的数值极高，且机制极好，可以舍弃防御，所以在保证输出的情况下，拉满生命。', '3荣耀+2生命/攻击/抵抗', '{\"attack\":2300,\"crit\":100,\"criticalDamage\":240,\"defense\":490,\"life\":2600,\"precision\":30,\"resistance\":30,\"speed\":134}', '{\"attack\":2400,\"crit\":100,\"criticalDamage\":260,\"defense\":490,\"life\":2800,\"precision\":30,\"resistance\":30,\"speed\":134}', '{\"attack\":2500,\"crit\":100,\"criticalDamage\":280,\"defense\":490,\"life\":3000,\"precision\":30,\"resistance\":30,\"speed\":134}', '潜力特质B；极限特质Ⅰ', '6；5+；6', '生命百分比=攻击百分比>暴伤≥暴击>防御百分比>其它', '大词条：暴击>暴伤≥攻击百分比>抵抗>其它', '大词条：生命百分比=攻击百分比>抵抗>其它', '2024-01-20 09:54:28', '2024-01-20 09:54:28', 0);
INSERT INTO `character_scheme` VALUES (29, 72, '高速精准', 'PVP', '艾夏拉速度不慢。高速精准建议极限特质点Ⅱ，同时不再需要抵抗。作用是压制对方某些角色的机制，同时配合己方角色的机制。。', '3异常+2生命/攻击/精准', '{\"attack\":1900,\"crit\":80,\"criticalDamage\":170,\"defense\":490,\"life\":2100,\"precision\":160,\"resistance\":30,\"speed\":230}', '{\"attack\":2000,\"crit\":80,\"criticalDamage\":170,\"defense\":500,\"life\":2300,\"precision\":180,\"resistance\":30,\"speed\":240}', '{\"attack\":2100,\"crit\":80,\"criticalDamage\":170,\"defense\":600,\"life\":2500,\"precision\":200,\"resistance\":30,\"speed\":250}', '潜力特质B；极限特质Ⅱ', '6；6；6', '速度>生命百分比=攻击百分比>防御百分比=精准=攻击=生命>其它', '大词条：暴击>精准=攻击百分比>其它', '大词条：速度>攻击百分比=精准>其它', '2024-01-20 09:54:28', '2024-01-20 09:54:28', 0);
INSERT INTO `character_scheme` VALUES (30, 24, '虚空', 'PVP', '可站场可联防，非常灵活。可以舍弃部分生命和攻击的数值小词条凑百暴。', '3虚空+2抵抗', '{\"attack\":1700,\"crit\":70,\"criticalDamage\":160,\"defense\":800,\"life\":2900,\"precision\":15,\"resistance\":80,\"speed\":85}', '{\"attack\":1800,\"crit\":70,\"criticalDamage\":160,\"defense\":900,\"life\":3100,\"precision\":15,\"resistance\":100,\"speed\":85}', '{\"attack\":1900,\"crit\":70,\"criticalDamage\":160,\"defense\":1000,\"life\":3300,\"precision\":15,\"resistance\":100,\"speed\":85}', '潜力特质A；极限特质Ⅲ，不点速度', '6；5+；6', '生命百分比>攻击百分比>防御百分比>抵抗>其它', '大词条：暴击≥生命百分比>暴伤>攻击百分比>其它', '大词条：生命百分比>攻击百分比>抵抗>其它', '2024-01-20 10:22:20', '2024-01-20 10:22:20', 0);
INSERT INTO `character_scheme` VALUES (31, 24, '荣耀', 'PVP', '荣耀杰西卡最好作为站场角色一开始就上场，因为荣耀杰西卡很脆，替补上场很有可能被秒。优先凑百暴和百抗，追求极致攻击，可以舍弃防御。', '3荣耀+2抵抗', '{\"attack\":1800,\"crit\":50,\"criticalDamage\":160,\"defense\":586,\"life\":2600,\"precision\":15,\"resistance\":80,\"speed\":85}', '{\"attack\":1900,\"crit\":100,\"criticalDamage\":160,\"defense\":600,\"life\":2800,\"precision\":15,\"resistance\":100,\"speed\":85}', '{\"attack\":2000,\"crit\":100,\"criticalDamage\":210,\"defense\":600,\"life\":3000,\"precision\":15,\"resistance\":100,\"speed\":85}', '潜力特质A；极限特质Ⅲ，不点速度', '6；5+；6', '暴击≥生命百分比>攻击百分比>防御百分比>抵抗>其它', '大词条：暴击≥暴伤>生命百分比>攻击百分比>其它', '大词条：生命百分比>攻击百分比>抵抗>其它', '2024-01-20 10:22:20', '2024-01-20 10:22:20', 0);
INSERT INTO `character_scheme` VALUES (32, 24, '涅槃', 'PVP', '涅槃杰西卡一般作为联防角色替补上场，也是唯一能在加时赛使用的杰西卡养成方案，能够面对对方的高速干扰位收割手。潜力特质选择B，对抵抗的要求稍高，可以适当歪一点速度。', '3涅槃+2抵抗', '{\"attack\":1400,\"crit\":70,\"criticalDamage\":160,\"defense\":700,\"life\":2900,\"precision\":15,\"resistance\":120,\"speed\":85}', '{\"attack\":1500,\"crit\":70,\"criticalDamage\":160,\"defense\":800,\"life\":3100,\"precision\":15,\"resistance\":140,\"speed\":85}', '{\"attack\":1600,\"crit\":70,\"criticalDamage\":160,\"defense\":900,\"life\":3300,\"precision\":15,\"resistance\":160,\"speed\":85}', '潜力特质B；极限特质Ⅲ', '6；5+；6', '生命百分比>攻击百分比>防御百分比>抵抗>生命>其它', '大词条：暴击≥生命百分比>暴伤>攻击百分比>其它', '大词条：生命百分比>攻击百分比>抵抗>其它', '2024-01-20 10:22:20', '2024-01-20 10:22:20', 0);
INSERT INTO `character_scheme` VALUES (33, 43, '无悔虚空', 'PVP', '搅屎棍式的养成方案，适合开局站场，伤害不高，但侮辱性极强。使用无悔牺牲套可以适当歪些速度。', '3虚空/无悔+2精准', '{\"attack\":1000,\"crit\":20,\"criticalDamage\":170,\"defense\":800,\"life\":2400,\"precision\":120,\"resistance\":120,\"speed\":105}', '{\"attack\":1200,\"crit\":20,\"criticalDamage\":170,\"defense\":900,\"life\":2600,\"precision\":140,\"resistance\":140,\"speed\":105}', '{\"attack\":1400,\"crit\":20,\"criticalDamage\":170,\"defense\":1000,\"life\":2800,\"precision\":160,\"resistance\":160,\"speed\":105}', '潜力特质A；极限特质Ⅰ', '6；6；5+', '生命百分比=防御百分比>精准=抵抗>攻击百分比>其它', '大词条：生命百分比≥精准=抵抗>攻击百分比>其它', '大词条：生命百分比≥精准=抵抗>攻击百分比>其它', '2024-01-20 10:39:39', '2024-01-20 10:39:39', 0);
INSERT INTO `character_scheme` VALUES (34, 43, '荣耀', 'ALL', '媲美进攻位的伤害输出，适合开局站场，有效压制一切不致命的群体攻击。', '3荣耀+2抵抗', '{\"attack\":1700,\"crit\":50,\"criticalDamage\":210,\"defense\":648,\"life\":2000,\"precision\":25,\"resistance\":140,\"speed\":105}', '{\"attack\":1800,\"crit\":100,\"criticalDamage\":210,\"defense\":648,\"life\":2200,\"precision\":25,\"resistance\":160,\"speed\":105}', '{\"attack\":1900,\"crit\":100,\"criticalDamage\":210,\"defense\":648,\"life\":2400,\"precision\":25,\"resistance\":180,\"speed\":105}', '潜力特质A；极限特质Ⅰ', '6；6；5+', '生命百分比=攻击百分比>抵抗=暴击=攻击>暴伤', '大词条：暴击≥暴伤>攻击百分比>其它', '大词条：攻击百分比>抵抗>生命百分比>其它', '2024-01-20 10:39:39', '2024-01-20 10:39:39', 0);
INSERT INTO `character_scheme` VALUES (35, 40, '精准花神', 'PVE', '正统PVE养成方案，优先3虚空，其次拉满精准。', '3虚空+2精准', '{\"attack\":849,\"crit\":10,\"criticalDamage\":150,\"defense\":700,\"life\":2400,\"precision\":200,\"resistance\":60,\"speed\":99}', '{\"attack\":849,\"crit\":10,\"criticalDamage\":150,\"defense\":800,\"life\":2600,\"precision\":220,\"resistance\":80,\"speed\":99}', '{\"attack\":849,\"crit\":10,\"criticalDamage\":150,\"defense\":900,\"life\":2800,\"precision\":240,\"resistance\":100,\"speed\":99}', '潜力特质B；极限特质Ⅲ', '5+；1+；5+', '精准>生命百分比>防御百分比>抵抗=生命=防御>其它', '大词条：精准>生命百分比>其它', '大词条：精准>生命百分比>其它', '2024-01-20 11:16:17', '2024-01-20 11:16:17', 0);
INSERT INTO `character_scheme` VALUES (36, 40, '输出花神', 'PVP', '是否感受不到花神的伤害？你可能缺少一只与她配合的可泰勒。娱乐玩法，但可以一试，主要草系的属性太弱势了，只能用来打打光王。', '3蜕变/强者+2攻击', '{\"attack\":1800,\"crit\":100,\"criticalDamage\":220,\"defense\":462,\"life\":1600,\"precision\":82,\"resistance\":30,\"speed\":210}', '{\"attack\":1900,\"crit\":100,\"criticalDamage\":220,\"defense\":462,\"life\":1800,\"precision\":82,\"resistance\":30,\"speed\":220}', '{\"attack\":2000,\"crit\":100,\"criticalDamage\":240,\"defense\":462,\"life\":2000,\"precision\":82,\"resistance\":30,\"speed\":230}', '潜力特质A；极限特质Ⅲ', '5+；6；6', '速度>攻击百分比>暴击>暴伤>攻击>其它', '大词条：暴击>暴伤≥攻击百分比>其它', '大词条：攻击百分比>速度>其它', '2024-01-20 11:16:17', '2024-01-20 11:16:17', 0);
INSERT INTO `character_scheme` VALUES (37, 56, '高速高攻', 'ALL', '高速高攻就是雷伊最佳的养成方式，没有之一。优先凑百暴，如果不打极限Ⅱ的固伤，则舍弃精准换攻击，五号位大词条选择攻比速度，2件套选择攻击。怕暴毙可以适当拉一点生命和防御。', '3蜕变/守护+2精准/攻击', '{\"attack\":2200,\"crit\":100,\"criticalDamage\":240,\"defense\":512,\"life\":1200,\"precision\":100,\"resistance\":30,\"speed\":220}', '{\"attack\":2300,\"crit\":100,\"criticalDamage\":260,\"defense\":512,\"life\":1300,\"precision\":100,\"resistance\":30,\"speed\":240}', '{\"attack\":2400,\"crit\":100,\"criticalDamage\":280,\"defense\":512,\"life\":1500,\"precision\":115,\"resistance\":30,\"speed\":260}', '潜力特质A；极限特质Ⅱ', '5+；6；6', '速度=攻击百分比>暴伤>暴击>攻击>生命百分比>其它', '暴击>暴伤=攻击百分比>其它', '速度>精准>攻击百分比>其它', '2024-01-20 13:30:05', '2024-01-20 13:30:05', 0);
INSERT INTO `character_scheme` VALUES (38, 56, '高命高攻', 'ALL', '如果实在追不了速度，可以用生命和防御换速度。雷伊的生命数值极低，不是很建议堆生命，但是确实生命比防御有用。优先凑百暴，如果不打极限Ⅱ的固伤，则舍弃精准换生命，五号位大词条选择攻比生比，2件套选择生命。', '3蜕变/荣耀+2精准/生命', '{\"attack\":2200,\"crit\":100,\"criticalDamage\":240,\"defense\":512,\"life\":1700,\"precision\":100,\"resistance\":30,\"speed\":141}', '{\"attack\":2300,\"crit\":100,\"criticalDamage\":260,\"defense\":512,\"life\":1900,\"precision\":100,\"resistance\":30,\"speed\":161}', '{\"attack\":2400,\"crit\":100,\"criticalDamage\":280,\"defense\":600,\"life\":2100,\"precision\":115,\"resistance\":30,\"speed\":181}', '潜力特质B；极限特质Ⅱ', '5+；6；6', '速度=攻击百分比>暴伤>暴击>攻击>生命百分比>其它', '暴击>暴伤=攻击百分比>其它', '速度>精准>攻击百分比>其它', '2024-01-20 13:30:05', '2024-01-20 13:30:05', 0);

-- ----------------------------
-- Table structure for character_soul
-- ----------------------------
DROP TABLE IF EXISTS `character_soul`;
CREATE TABLE `character_soul`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id，自增非空',
  `attack` int NOT NULL COMMENT '攻击',
  `defense` int NOT NULL COMMENT '防御',
  `life` int NOT NULL COMMENT '生命',
  `speed` int NOT NULL COMMENT '速度',
  `crit` int NOT NULL COMMENT '暴击',
  `critical_damage` int NOT NULL COMMENT '暴伤',
  `precision` int NOT NULL COMMENT '精准',
  `resistance` int NOT NULL COMMENT '抵抗',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段，0存在，1删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of character_soul
-- ----------------------------
INSERT INTO `character_soul` VALUES (1, 0, 0, 10, 10, 0, 0, 0, 0, 0, '2023-08-06 04:19:41', '2023-08-07 15:56:07');
INSERT INTO `character_soul` VALUES (2, 5, 0, 0, 10, 0, 0, 0, 0, 0, '2023-08-06 06:06:24', '2023-08-07 15:56:11');
INSERT INTO `character_soul` VALUES (3, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2023-08-06 06:07:31', '2023-08-06 14:08:16');
INSERT INTO `character_soul` VALUES (4, 10, 0, 10, 0, 0, 0, 0, 0, 0, '2023-08-06 06:07:37', '2023-08-07 11:56:44');
INSERT INTO `character_soul` VALUES (5, 0, 5, 15, 0, 0, 0, 10, 0, 0, '2023-08-06 07:07:11', '2023-08-07 16:09:32');
INSERT INTO `character_soul` VALUES (6, 5, 0, 0, 0, 0, 0, 10, 0, 0, '2023-08-06 07:07:12', '2023-08-07 16:09:16');
INSERT INTO `character_soul` VALUES (7, 5, 0, 0, 10, 0, 0, 10, 0, 0, '2023-08-06 07:07:14', '2023-08-07 16:09:05');
INSERT INTO `character_soul` VALUES (8, 5, 0, 0, 0, 0, 10, 0, 0, 0, '2023-08-06 07:07:15', '2023-08-07 16:08:44');
INSERT INTO `character_soul` VALUES (9, 5, 0, 10, 10, 0, 0, 0, 0, 0, '2023-08-06 07:07:17', '2023-08-07 16:08:23');
INSERT INTO `character_soul` VALUES (10, 0, 5, 15, 0, 0, 0, 0, 0, 0, '2023-08-06 07:07:18', '2023-08-07 16:08:08');
INSERT INTO `character_soul` VALUES (11, 0, 5, 10, 0, 0, 0, 0, 0, 0, '2023-08-06 07:07:19', '2023-08-07 16:07:55');
INSERT INTO `character_soul` VALUES (12, 10, 10, 10, 0, 0, 0, 0, 0, 0, '2023-08-06 07:07:21', '2023-08-07 16:07:41');
INSERT INTO `character_soul` VALUES (13, 0, 0, 10, 0, 0, 0, 20, 10, 0, '2023-08-06 07:09:16', '2023-08-07 16:07:34');
INSERT INTO `character_soul` VALUES (14, 0, 5, 10, 0, 0, 0, 20, 0, 0, '2023-08-06 07:09:17', '2023-08-07 16:07:12');
INSERT INTO `character_soul` VALUES (15, 5, 0, 0, 0, 0, 0, 10, 0, 0, '2023-08-06 07:09:19', '2023-08-07 16:06:52');
INSERT INTO `character_soul` VALUES (16, 10, 5, 0, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:20', '2023-08-07 16:06:42');
INSERT INTO `character_soul` VALUES (17, 5, 0, 0, 10, 0, 0, 10, 0, 0, '2023-08-06 07:09:21', '2023-08-07 16:06:28');
INSERT INTO `character_soul` VALUES (18, 5, 5, 15, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:23', '2023-08-07 16:06:05');
INSERT INTO `character_soul` VALUES (19, 5, 0, 0, 10, 0, 0, 0, 0, 0, '2023-08-06 07:09:24', '2023-08-07 16:05:47');
INSERT INTO `character_soul` VALUES (20, 5, 0, 15, 0, 5, 0, 0, 0, 0, '2023-08-06 07:09:25', '2023-08-07 16:05:36');
INSERT INTO `character_soul` VALUES (21, 5, 0, 0, 5, 10, 0, 0, 0, 0, '2023-08-06 07:09:27', '2023-08-07 16:05:09');
INSERT INTO `character_soul` VALUES (22, 10, 0, 0, 5, 0, 0, 10, 0, 0, '2023-08-06 07:09:28', '2023-08-07 16:04:50');
INSERT INTO `character_soul` VALUES (23, 5, 0, 0, 0, 0, 0, 10, 0, 0, '2023-08-06 07:09:29', '2023-08-07 16:04:35');
INSERT INTO `character_soul` VALUES (24, 5, 5, 0, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:30', '2023-08-07 16:04:20');
INSERT INTO `character_soul` VALUES (25, 5, 0, 0, 0, 5, 15, 0, 0, 0, '2023-08-06 07:09:32', '2023-08-07 16:04:02');
INSERT INTO `character_soul` VALUES (26, 5, 0, 0, 10, 0, 0, 10, 0, 0, '2023-08-06 07:09:33', '2023-08-07 16:03:41');
INSERT INTO `character_soul` VALUES (27, 0, 5, 10, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:34', '2023-08-07 16:03:26');
INSERT INTO `character_soul` VALUES (28, 5, 0, 0, 0, 0, 0, 10, 0, 0, '2023-08-06 07:09:35', '2023-08-07 16:03:16');
INSERT INTO `character_soul` VALUES (29, 0, 5, 10, 10, 0, 0, 0, 0, 0, '2023-08-06 07:09:37', '2023-08-07 16:02:53');
INSERT INTO `character_soul` VALUES (30, 10, 0, 0, 0, 0, 15, 0, 0, 0, '2023-08-06 07:09:38', '2023-08-07 16:02:27');
INSERT INTO `character_soul` VALUES (31, 0, 5, 10, 10, 0, 0, 0, 0, 0, '2023-08-06 07:09:39', '2023-08-07 16:02:13');
INSERT INTO `character_soul` VALUES (32, 5, 0, 10, 10, 0, 0, 0, 0, 0, '2023-08-06 07:09:40', '2023-08-07 16:00:52');
INSERT INTO `character_soul` VALUES (33, 0, 5, 15, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:42', '2023-08-07 16:00:20');
INSERT INTO `character_soul` VALUES (34, 0, 5, 15, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:43', '2023-08-07 16:00:05');
INSERT INTO `character_soul` VALUES (35, 5, 0, 15, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:44', '2023-08-07 15:59:45');
INSERT INTO `character_soul` VALUES (36, 5, 0, 0, 0, 0, 0, 10, 0, 0, '2023-08-06 07:09:46', '2023-08-07 15:59:34');
INSERT INTO `character_soul` VALUES (37, 0, 0, 0, 5, 0, 0, 10, 0, 0, '2023-08-06 07:09:47', '2023-08-07 15:59:22');
INSERT INTO `character_soul` VALUES (38, 10, 0, 0, 0, 5, 0, 10, 0, 0, '2023-08-06 07:09:48', '2023-08-07 15:58:54');
INSERT INTO `character_soul` VALUES (39, 5, 0, 0, 5, 0, 0, 0, 0, 0, '2023-08-06 07:09:50', '2023-08-07 15:58:39');
INSERT INTO `character_soul` VALUES (40, 0, 5, 0, 0, 0, 0, 10, 0, 0, '2023-08-06 07:09:51', '2023-08-07 15:58:26');
INSERT INTO `character_soul` VALUES (41, 10, 0, 0, 5, 0, 0, 10, 0, 0, '2023-08-06 07:09:52', '2023-08-07 15:58:06');
INSERT INTO `character_soul` VALUES (42, 5, 0, 1, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:53', '2023-08-07 15:57:45');
INSERT INTO `character_soul` VALUES (43, 10, 5, 0, 0, 0, 0, 10, 0, 0, '2023-08-06 07:09:55', '2023-08-07 15:57:35');
INSERT INTO `character_soul` VALUES (44, 5, 0, 10, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:56', '2023-08-07 15:57:17');
INSERT INTO `character_soul` VALUES (45, 5, 0, 10, 0, 0, 0, 0, 0, 0, '2023-08-06 07:09:57', '2023-08-07 15:57:08');
INSERT INTO `character_soul` VALUES (46, 0, 0, 0, 5, 0, 0, 10, 0, 0, '2023-08-06 07:09:59', '2023-08-07 15:56:56');
INSERT INTO `character_soul` VALUES (47, 5, 0, 0, 0, 5, 0, 0, 0, 0, '2023-08-06 07:10:00', '2023-08-07 15:56:43');
INSERT INTO `character_soul` VALUES (48, 0, 0, 10, 10, 0, 0, 0, 0, 0, '2023-08-06 07:10:02', '2023-08-07 15:55:29');
INSERT INTO `character_soul` VALUES (49, 0, 0, 0, 10, 5, 0, 10, 0, 0, '2023-08-06 07:10:03', '2023-08-07 15:55:13');
INSERT INTO `character_soul` VALUES (50, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-06 07:10:04', '2023-08-06 07:10:04');
INSERT INTO `character_soul` VALUES (51, 5, 0, 0, 0, 5, 15, 0, 0, 0, '2023-08-06 07:10:05', '2023-08-07 15:54:38');
INSERT INTO `character_soul` VALUES (52, 0, 0, 0, 10, 0, 0, 10, 0, 0, '2023-08-06 07:10:07', '2023-08-07 15:54:19');
INSERT INTO `character_soul` VALUES (53, 10, 0, 0, 5, 0, 0, 0, 0, 0, '2023-08-06 07:10:08', '2023-08-07 15:54:02');
INSERT INTO `character_soul` VALUES (54, 5, 0, 15, 0, 0, 0, 0, 0, 0, '2023-08-06 07:10:09', '2023-08-07 15:53:46');
INSERT INTO `character_soul` VALUES (55, 5, 0, 10, 10, 0, 0, 0, 0, 0, '2023-08-06 07:10:11', '2023-08-07 15:53:33');
INSERT INTO `character_soul` VALUES (56, 5, 0, 0, 10, 0, 0, 0, 0, 0, '2023-08-06 07:10:12', '2023-08-07 11:57:45');
INSERT INTO `character_soul` VALUES (57, 5, 0, 0, 10, 0, 0, 0, 0, 0, '2023-08-08 11:41:09', '2023-08-08 11:41:11');
INSERT INTO `character_soul` VALUES (58, 5, 0, 15, 5, 0, 0, 0, 0, 0, '2023-08-10 08:49:46', '2023-08-10 08:57:49');
INSERT INTO `character_soul` VALUES (59, 15, 0, 0, 5, 0, 0, 0, 0, 0, '2023-08-10 08:55:24', '2023-08-10 08:58:27');
INSERT INTO `character_soul` VALUES (60, 5, 0, 15, 5, 0, 0, 0, 0, 0, '2023-08-31 05:58:24', '2023-08-31 06:12:16');
INSERT INTO `character_soul` VALUES (61, 5, 0, 0, 5, 0, 0, 20, 0, 0, '2023-08-31 06:04:02', '2023-08-31 06:12:46');
INSERT INTO `character_soul` VALUES (62, 5, 0, 0, 10, 0, 0, 10, 0, 0, '2023-08-31 06:08:29', '2023-08-31 06:13:32');
INSERT INTO `character_soul` VALUES (63, 0, 0, 10, 10, 0, 0, 10, 0, 0, '2023-08-31 06:09:15', '2023-08-31 06:14:06');
INSERT INTO `character_soul` VALUES (64, 5, 0, 0, 0, 0, 0, 10, 0, 0, '2023-09-21 15:40:53', '2023-09-21 15:45:28');
INSERT INTO `character_soul` VALUES (65, 5, 0, 10, 0, 0, 0, 20, 0, 0, '2023-09-21 15:47:18', '2023-09-21 15:47:59');
INSERT INTO `character_soul` VALUES (66, 15, 0, 0, 0, 5, 0, 0, 0, 0, '2023-09-21 15:48:54', '2023-09-21 15:50:15');
INSERT INTO `character_soul` VALUES (67, 10, 0, 10, 5, 0, 0, 0, 0, 0, '2023-10-12 07:11:17', '2023-10-12 07:13:26');
INSERT INTO `character_soul` VALUES (68, 5, 0, 10, 0, 0, 0, 0, 0, 0, '2023-10-12 07:16:10', '2023-10-12 07:16:34');
INSERT INTO `character_soul` VALUES (69, 5, 0, 0, 5, 0, 0, 0, 0, 0, '2023-11-03 07:11:02', '2023-11-03 07:35:25');
INSERT INTO `character_soul` VALUES (70, 10, 0, 10, 5, 0, 0, 0, 0, 0, '2023-11-03 07:36:45', '2023-11-03 07:38:01');
INSERT INTO `character_soul` VALUES (71, 10, 0, 10, 0, 0, 0, 10, 0, 0, '2023-11-24 12:44:28', '2023-11-24 12:47:45');
INSERT INTO `character_soul` VALUES (72, 0, 0, 15, 5, 0, 0, 0, 0, 0, '2023-11-24 12:45:01', '2023-11-24 12:49:21');
INSERT INTO `character_soul` VALUES (73, 5, 0, 0, 10, 0, 0, 10, 0, 0, '2023-11-24 12:45:26', '2023-11-24 12:48:57');
INSERT INTO `character_soul` VALUES (74, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-11-24 12:46:01', '2023-11-24 12:46:01');
INSERT INTO `character_soul` VALUES (75, 5, 0, 10, 0, 0, 0, 20, 0, 0, '2023-12-21 09:32:54', '2023-12-21 09:37:59');
INSERT INTO `character_soul` VALUES (76, 5, 0, 10, 0, 0, 0, 0, 0, 0, '2023-12-21 09:33:28', '2023-12-21 09:37:31');
INSERT INTO `character_soul` VALUES (77, 0, 5, 10, 0, 0, 0, 0, 0, 0, '2024-01-05 02:54:02', '2024-01-05 02:59:24');
INSERT INTO `character_soul` VALUES (78, 5, 0, 0, 0, 5, 0, 20, 0, 0, '2024-01-05 02:58:27', '2024-01-05 03:00:03');

-- ----------------------------
-- Table structure for character_talent
-- ----------------------------
DROP TABLE IF EXISTS `character_talent`;
CREATE TABLE `character_talent`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id，自增非空',
  `attack` int NOT NULL COMMENT '攻击',
  `defense` int NOT NULL COMMENT '防御',
  `life` int NOT NULL COMMENT '生命',
  `speed` int NOT NULL COMMENT '速度',
  `crit` int NOT NULL COMMENT '暴击',
  `critical_damage` int NOT NULL COMMENT '暴伤',
  `precision` int NOT NULL COMMENT '精准',
  `resistance` int NOT NULL COMMENT '抵抗',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段，0存在，1删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of character_talent
-- ----------------------------
INSERT INTO `character_talent` VALUES (1, 0, 88, 253, 10, 10, 10, 15, 30, 0, '2023-08-06 04:19:41', '2023-12-21 09:38:16');
INSERT INTO `character_talent` VALUES (2, 0, 27, 135, 20, 5, 20, 60, 30, 0, '2023-08-06 06:06:24', '2023-12-21 09:38:17');
INSERT INTO `character_talent` VALUES (3, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2023-08-06 06:07:31', '2023-08-06 14:08:23');
INSERT INTO `character_talent` VALUES (4, 116, 28, 64, 10, 10, 20, 30, 30, 0, '2023-08-06 06:07:37', '2023-12-21 09:38:17');
INSERT INTO `character_talent` VALUES (5, 0, 23, 124, 20, 5, 20, 60, 30, 0, '2023-08-06 07:07:11', '2023-12-21 09:38:18');
INSERT INTO `character_talent` VALUES (6, 100, 19, 49, 10, 10, 20, 30, 30, 0, '2023-08-06 07:07:12', '2023-12-21 09:38:18');
INSERT INTO `character_talent` VALUES (7, 92, 20, 52, 10, 10, 20, 30, 30, 0, '2023-08-06 07:07:14', '2023-12-21 09:38:19');
INSERT INTO `character_talent` VALUES (8, 98, 18, 50, 10, 10, 20, 30, 30, 0, '2023-08-06 07:07:15', '2023-12-21 09:38:19');
INSERT INTO `character_talent` VALUES (9, 0, 66, 189, 10, 10, 10, 15, 30, 0, '2023-08-06 07:07:17', '2023-12-21 09:38:20');
INSERT INTO `character_talent` VALUES (10, 39, 20, 117, 20, 5, 10, 30, 45, 0, '2023-08-06 07:07:18', '2023-12-21 09:38:20');
INSERT INTO `character_talent` VALUES (11, 40, 21, 117, 20, 5, 10, 30, 45, 0, '2023-08-06 07:07:20', '2023-12-21 09:38:21');
INSERT INTO `character_talent` VALUES (12, 0, 70, 221, 10, 10, 10, 15, 30, 0, '2023-08-06 07:07:21', '2023-12-21 09:38:21');
INSERT INTO `character_talent` VALUES (13, 0, 21, 111, 20, 5, 20, 60, 30, 0, '2023-08-07 07:35:13', '2023-12-21 09:38:22');
INSERT INTO `character_talent` VALUES (14, 0, 68, 216, 10, 10, 10, 15, 30, 0, '2023-08-06 07:09:17', '2023-12-21 09:38:22');
INSERT INTO `character_talent` VALUES (15, 96, 23, 48, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:19', '2023-12-21 09:38:23');
INSERT INTO `character_talent` VALUES (16, 43, 22, 113, 20, 5, 10, 30, 45, 0, '2023-08-06 07:09:20', '2023-12-21 09:38:23');
INSERT INTO `character_talent` VALUES (17, 83, 23, 54, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:21', '2023-12-21 09:38:23');
INSERT INTO `character_talent` VALUES (18, 0, 74, 211, 10, 10, 10, 15, 30, 0, '2023-08-06 07:09:23', '2023-12-21 09:38:24');
INSERT INTO `character_talent` VALUES (19, 95, 19, 53, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:24', '2023-12-21 09:38:24');
INSERT INTO `character_talent` VALUES (20, 99, 19, 52, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:25', '2023-12-21 09:38:24');
INSERT INTO `character_talent` VALUES (21, 97, 18, 51, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:27', '2023-12-21 09:38:25');
INSERT INTO `character_talent` VALUES (22, 96, 20, 50, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:28', '2023-12-21 09:38:25');
INSERT INTO `character_talent` VALUES (23, 98, 20, 64, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:29', '2023-12-21 09:38:26');
INSERT INTO `character_talent` VALUES (24, 0, 62, 217, 10, 10, 10, 15, 30, 0, '2023-08-06 07:09:30', '2023-12-21 09:38:26');
INSERT INTO `character_talent` VALUES (25, 104, 18, 57, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:32', '2023-12-21 09:38:26');
INSERT INTO `character_talent` VALUES (26, 0, 63, 231, 10, 10, 10, 15, 30, 0, '2023-08-06 07:09:33', '2023-12-21 09:38:27');
INSERT INTO `character_talent` VALUES (27, 38, 24, 138, 20, 5, 10, 30, 45, 0, '2023-08-06 07:09:34', '2023-12-21 09:38:27');
INSERT INTO `character_talent` VALUES (28, 102, 19, 57, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:35', '2023-12-21 09:38:27');
INSERT INTO `character_talent` VALUES (29, 44, 22, 132, 20, 5, 10, 30, 45, 0, '2023-08-06 07:09:37', '2023-12-21 09:38:28');
INSERT INTO `character_talent` VALUES (30, 100, 20, 65, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:38', '2023-12-21 09:38:28');
INSERT INTO `character_talent` VALUES (31, 0, 65, 215, 10, 10, 10, 15, 30, 0, '2023-08-06 07:09:39', '2023-12-21 09:38:29');
INSERT INTO `character_talent` VALUES (32, 70, 23, 81, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:41', '2023-12-21 09:38:29');
INSERT INTO `character_talent` VALUES (33, 0, 19, 118, 20, 5, 20, 60, 30, 0, '2023-08-06 07:09:42', '2023-12-21 09:38:30');
INSERT INTO `character_talent` VALUES (34, 0, 36, 200, 10, 10, 10, 15, 30, 0, '2023-08-06 07:09:43', '2023-12-21 09:38:30');
INSERT INTO `character_talent` VALUES (35, 104, 21, 56, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:44', '2023-12-21 09:38:30');
INSERT INTO `character_talent` VALUES (36, 101, 23, 55, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:46', '2023-12-21 09:38:31');
INSERT INTO `character_talent` VALUES (37, 0, 22, 115, 20, 5, 20, 60, 30, 0, '2023-08-06 07:09:47', '2023-12-21 09:38:31');
INSERT INTO `character_talent` VALUES (38, 101, 20, 56, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:48', '2023-12-21 09:38:31');
INSERT INTO `character_talent` VALUES (39, 102, 22, 56, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:50', '2023-12-21 09:38:32');
INSERT INTO `character_talent` VALUES (40, 0, 23, 120, 20, 5, 20, 60, 30, 0, '2023-08-06 07:09:51', '2023-12-21 09:38:32');
INSERT INTO `character_talent` VALUES (41, 100, 22, 54, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:52', '2023-12-21 09:38:33');
INSERT INTO `character_talent` VALUES (42, 100, 22, 58, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:53', '2023-12-21 09:38:33');
INSERT INTO `character_talent` VALUES (43, 0, 72, 213, 10, 10, 10, 15, 30, 0, '2023-08-06 07:09:55', '2023-12-21 09:38:34');
INSERT INTO `character_talent` VALUES (44, 118, 29, 67, 10, 10, 20, 30, 30, 0, '2023-08-06 07:09:56', '2023-12-21 09:38:34');
INSERT INTO `character_talent` VALUES (45, 54, 29, 137, 20, 5, 10, 30, 45, 0, '2023-08-06 07:09:57', '2023-12-21 09:38:35');
INSERT INTO `character_talent` VALUES (46, 0, 28, 139, 20, 5, 20, 60, 30, 0, '2023-08-06 07:09:59', '2023-12-21 09:38:35');
INSERT INTO `character_talent` VALUES (47, 115, 28, 63, 10, 10, 20, 30, 30, 0, '2023-08-06 07:10:00', '2023-12-21 09:38:36');
INSERT INTO `character_talent` VALUES (48, 54, 29, 142, 20, 5, 10, 30, 45, 0, '2023-08-06 07:10:02', '2023-12-21 09:38:36');
INSERT INTO `character_talent` VALUES (49, 0, 27, 128, 20, 5, 20, 60, 30, 0, '2023-08-06 07:10:03', '2023-12-21 09:38:36');
INSERT INTO `character_talent` VALUES (50, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-06 07:10:04', '2023-08-06 07:10:04');
INSERT INTO `character_talent` VALUES (51, 113, 30, 62, 10, 10, 20, 30, 30, 0, '2023-08-06 07:10:05', '2023-12-21 09:38:37');
INSERT INTO `character_talent` VALUES (52, 118, 26, 63, 10, 10, 20, 30, 30, 0, '2023-08-06 07:10:07', '2023-12-21 09:38:37');
INSERT INTO `character_talent` VALUES (53, 0, 28, 132, 20, 5, 20, 60, 30, 0, '2023-08-06 07:10:08', '2023-12-21 09:38:38');
INSERT INTO `character_talent` VALUES (54, 0, 83, 260, 10, 10, 10, 15, 30, 0, '2023-08-06 07:10:09', '2023-12-21 09:38:38');
INSERT INTO `character_talent` VALUES (55, 110, 29, 66, 10, 10, 20, 30, 30, 0, '2023-08-06 07:10:11', '2023-12-21 09:38:38');
INSERT INTO `character_talent` VALUES (56, 111, 29, 64, 10, 10, 20, 30, 30, 0, '2023-08-06 07:10:12', '2023-12-21 09:38:39');
INSERT INTO `character_talent` VALUES (57, 119, 27, 66, 10, 10, 20, 30, 30, 0, '2023-08-08 11:41:36', '2023-12-21 09:38:39');
INSERT INTO `character_talent` VALUES (58, 100, 22, 65, 10, 10, 20, 30, 30, 0, '2023-08-10 16:54:09', '2023-12-21 09:38:39');
INSERT INTO `character_talent` VALUES (59, 94, 19, 54, 10, 10, 20, 30, 30, 0, '2023-08-10 08:55:24', '2023-12-21 09:38:40');
INSERT INTO `character_talent` VALUES (60, 0, 28, 146, 20, 5, 20, 60, 30, 0, '2023-08-31 05:58:24', '2023-12-21 09:38:40');
INSERT INTO `character_talent` VALUES (61, 114, 28, 67, 10, 10, 20, 30, 30, 0, '2023-08-31 06:04:02', '2023-12-21 09:38:40');
INSERT INTO `character_talent` VALUES (62, 100, 20, 62, 10, 10, 20, 30, 30, 0, '2023-08-31 06:08:29', '2023-12-21 09:38:41');
INSERT INTO `character_talent` VALUES (63, 0, 18, 103, 20, 5, 20, 60, 30, 0, '2023-08-31 06:09:15', '2023-12-21 09:38:41');
INSERT INTO `character_talent` VALUES (64, 0, 28, 138, 20, 5, 20, 60, 30, 0, '2023-09-21 15:40:53', '2023-12-21 09:38:41');
INSERT INTO `character_talent` VALUES (65, 101, 22, 62, 10, 10, 20, 30, 30, 0, '2023-09-21 15:47:18', '2023-12-21 09:38:42');
INSERT INTO `character_talent` VALUES (66, 96, 18, 55, 10, 10, 20, 30, 30, 0, '2023-09-21 15:48:54', '2023-12-21 09:38:42');
INSERT INTO `character_talent` VALUES (67, 120, 28, 68, 10, 10, 20, 30, 30, 0, '2023-10-12 07:11:17', '2023-12-21 09:38:42');
INSERT INTO `character_talent` VALUES (68, 103, 22, 62, 10, 10, 20, 30, 30, 0, '2023-10-12 07:16:10', '2023-12-21 09:38:43');
INSERT INTO `character_talent` VALUES (69, 117, 29, 65, 10, 10, 20, 30, 30, 0, '2023-11-03 07:11:02', '2023-12-21 09:38:43');
INSERT INTO `character_talent` VALUES (70, 95, 19, 54, 10, 10, 20, 30, 30, 0, '2023-11-03 07:36:45', '2023-12-21 09:38:43');
INSERT INTO `character_talent` VALUES (71, 0, 29, 136, 20, 5, 20, 60, 30, 0, '2023-11-24 12:44:28', '2023-12-21 09:38:44');
INSERT INTO `character_talent` VALUES (72, 113, 27, 72, 10, 10, 20, 30, 30, 0, '2023-11-24 12:45:01', '2023-12-21 09:38:44');
INSERT INTO `character_talent` VALUES (73, 119, 28, 63, 10, 10, 20, 30, 30, 0, '2023-11-24 12:45:26', '2023-12-21 09:38:44');
INSERT INTO `character_talent` VALUES (74, 0, 23, 135, 20, 5, 20, 60, 30, 0, '2023-11-24 12:46:02', '2023-12-21 09:38:45');
INSERT INTO `character_talent` VALUES (75, 0, 30, 136, 20, 5, 20, 60, 30, 0, '2023-12-21 09:32:55', '2023-12-21 09:38:45');
INSERT INTO `character_talent` VALUES (76, 95, 22, 64, 10, 10, 20, 30, 30, 0, '2023-12-21 09:33:28', '2023-12-21 09:38:45');
INSERT INTO `character_talent` VALUES (77, 0, 29, 137, 20, 5, 20, 60, 30, 0, '2024-01-05 02:54:02', '2024-01-05 02:54:02');
INSERT INTO `character_talent` VALUES (78, 0, 71, 220, 10, 10, 10, 15, 30, 0, '2024-01-05 02:58:27', '2024-01-05 02:58:27');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '&#x22;&#x3c;h2 class=\\&#x22;ql-align-center\\&#x22;&#x3e;关于此网站&#x3c;/h2&#x3e;&#x3c;ol&#x3e;&#x3c;li&#x3e;本网站作者为崔慕玄，网站内容由作者个人提供，若有网站相关的Bug反馈、内容侵权、个人建议等，请私信崔慕玄(https://space.bilibili.com/589465087)，或发送邮件至colorcollision@colorcollision.ac.cn&#x3c;/li&#x3e;&#x3c;li&#x3e;网站作者为赛尔计划玩家，提供内容与游戏实际不符时以游戏为准。&#x3c;/li&#x3e;&#x3c;li&#x3e;如果角色图片是火柴人，不要怀疑，作者把默认角色图片设为火柴人，这不是bug。此情况发生时满足以下两条件之一：1.作者没有此角色。2.作者没有上传此角色图片。&#x3c;/li&#x3e;&#x3c;li&#x3e;角色极限数值的计算公式如下：&#x3c;/li&#x3e;&#x3c;/ol&#x3e;&#x3c;ul&#x3e;&#x3c;li&#x3e;攻击//小词条135+200*大词条数值点+基础数值+天赋+（基础*（命座+25*刻印套系点+50*大词条百分比点+30*小词条百分比点）/100）&#x3c;/li&#x3e;&#x3c;li&#x3e;防御//小词条70+100*大词条数值点+基础数值+天赋+（基础*（命座+25*刻印套系点+50*大词条百分比点+30*小词条百分比点）/100）&#x3c;/li&#x3e;&#x3c;li&#x3e;生命//小词条150+250*大词条数值点+基础数值+天赋+（基础*（命座+25*刻印套系点+50*大词条百分比点+30*小词条百分比点）/100）&#x3c;/li&#x3e;&#x3c;li&#x3e;速度//小词条20*4+大词条点*45+基础数值+天赋数值+（基础*（命座+刻印套系点*10）/100）+套系效果10*（2+刻印套系点）&#x3c;/li&#x3e;&#x3c;li&#x3e;暴击//10*刻印套系点 + 15*小词条点 + 50大词条点 + 基础数值 +天赋+命座&#x3c;/li&#x3e;&#x3c;li&#x3e;暴伤/小词条20*4 + 50*大词条点 + 基础数值 +天赋+命座&#x3c;/li&#x3e;&#x3c;li&#x3e;精准//35*刻印套系点+20*小词条点+50*大词条点+基础数值+天赋+命座&#x3c;/li&#x3e;&#x3c;li&#x3e;抵抗//35*刻印套系点+20*小词条点+50*大词条点+基础数值+天赋+命座&#x3c;/li&#x3e;&#x3c;/ul&#x3e;&#x3c;h2 class=\\&#x22;ql-align-center\\&#x22;&#x3e;关于网站后续&#x3c;/h2&#x3e;&#x3c;ol&#x3e;&#x3c;li&#x3e;作者尽可能维护网站正常运行。&#x3c;/li&#x3e;&#x3c;li&#x3e;如果对网站后续运营有建议，可以B站私信作者。&#x3c;/li&#x3e;&#x3c;li&#x3e;目前作者考虑从以下几点完善网站：&#x3c;/li&#x3e;&#x3c;/ol&#x3e;&#x3c;ul&#x3e;&#x3c;li&#x3e;角色竞技梯度排行&#x3c;/li&#x3e;&#x3c;li&#x3e;角色攻略解析&#x3c;/li&#x3e;&#x3c;li&#x3e;pvp玩法攻略&#x3c;/li&#x3e;&#x3c;li&#x3e;角色加点建议&#x3c;/li&#x3e;&#x3c;li&#x3e;此网站是如何实现的（代码教程）&#x3c;/li&#x3e;&#x3c;/ul&#x3e;&#x3c;p class=\\&#x22;ql-align-center\\&#x22;&#x3e;以上网站后续内容未必实现，取决于网站运营效果，详细进度请B站关注作者。&#x3c;/p&#x3e;&#x3c;h1 class=\\&#x22;ql-align-center\\&#x22;&#x3e;免责声明&#x3c;/h1&#x3e;&#x3c;p&#x3e;\\t\\t访问者在接受本⽹站服务之前，请务必仔细阅读本条款并同意本声明。访问者访问本⽹站的⾏为以及通过各类⽅&#x3c;/p&#x3e;&#x3c;p&#x3e;式利⽤本⽹站的⾏为，都将被视作是对本声明全部内容的⽆异议的认可;如有异议，请⽴即跟本⽹站协商，并取得本⽹&#x3c;/p&#x3e;&#x3c;p&#x3e;站的书⾯同意意见。&#x3c;/p&#x3e;&#x3c;p&#x3e;第⼀条、访问者在从事与本⽹站相关的所有⾏为(包括但不限于访问浏览、利⽤、转载、宣传介绍)时，必须以善意&#x3c;/p&#x3e;&#x3c;p&#x3e;且谨慎的态度⾏事;访问者不得故意或者过失的损害或者弱化本⽹站的各类合法权利与利益，不得利⽤本⽹站以任何⽅&#x3c;/p&#x3e;&#x3c;p&#x3e;式直接或者间接的从事违反中国法律、国际公约以及社会公德的⾏为，且访问者应当恪守下述承诺：&#x3c;/p&#x3e;&#x3c;p&#x3e;1、传输和利⽤信息符合中国法律、国际公约的规定、符合公序良俗;&#x3c;/p&#x3e;&#x3c;p&#x3e;2、不将本⽹站以及与之相关的⽹络服务⽤作⾮法⽤途以及⾮正当⽤途;&#x3c;/p&#x3e;&#x3c;p&#x3e;3、不⼲扰和扰乱本⽹站以及与之相关的⽹络服务;&#x3c;/p&#x3e;&#x3c;p&#x3e;4、遵守与本⽹站以及与之相关的⽹络服务的协议、规定、程序和惯例等。&#x3c;/p&#x3e;&#x3c;p&#x3e;第⼆条、本⽹站郑重提醒访问者：请在转载、上载或者下载有关作品时务必尊重该作品的版权、著作权;如果您发现&#x3c;/p&#x3e;&#x3c;p&#x3e;有您未署名的作品，请⽴即和我们联系，我们会在第⼀时间加上您的署名或作相关处理。&#x3c;/p&#x3e;&#x3c;p&#x3e;第三条、除我们另有明确说明或者中国法律有强制性规定外，本⽹站⽤户原创的作品，本⽹站及作者共同享有版&#x3c;/p&#x3e;&#x3c;p&#x3e;权，其他⽹站及传统媒体如需使⽤，须取得本⽹站的书⾯授权，未经授权严禁转载或⽤于其它商业⽤途。&#x3c;/p&#x3e;&#x3c;p&#x3e;第四条、本⽹站内容仅代表作者本⼈的观点，不代表本⽹站的观点和看法，与本⽹站⽴场⽆关，相关责任作者⾃&#x3c;/p&#x3e;&#x3c;p&#x3e;负。&#x3c;/p&#x3e;&#x3c;p&#x3e;第五条、本⽹站有权将在本⽹站内发表的作品⽤于其他⽤途，包括⽹站、电⼦杂志等，作品有附带版权声明者除&#x3c;/p&#x3e;&#x3c;p&#x3e;外。&#x3c;/p&#x3e;&#x3c;p&#x3e;第六条、未经常本⽹站和作者共同同意，其他任何机构不得以任何形式侵犯其作品著作权，包括但不限于：擅⾃复&#x3c;/p&#x3e;&#x3c;p&#x3e;制、链接、⾮法使⽤或转载，或以任何⽅式建⽴作品镜像。&#x3c;/p&#x3e;&#x3c;p&#x3e;第七条、本⽹站所刊载的各类形式(包括但不仅限于⽂字、图⽚、图表)的作品仅供参考使⽤，并不代表本⽹站同意&#x3c;/p&#x3e;&#x3c;p&#x3e;其说法或描述，仅为提供更多信息，也不构成任何投资建议。对于访问者根据本⽹站提供的信息所做出的⼀切⾏为，&#x3c;/p&#x3e;&#x3c;p&#x3e;除⾮另有明确的书⾯承诺⽂件，否则本⽹站不承担任何形式的责任。&#x3c;/p&#x3e;&#x3c;p&#x3e;第⼋条、当本⽹站以链接形式推荐其他⽹站内容时，本⽹站并不对这些⽹站或资源的可⽤性负责，且不保证从这些&#x3c;/p&#x3e;&#x3c;p&#x3e;⽹站获取的任何内容、产品、服务或其他材料的真实性、合法性，对于任何因使⽤或信赖从此类⽹站或资源上获取的&#x3c;/p&#x3e;&#x3c;p&#x3e;内容、产品、服务或其他材料⽽造成(或声称造成)的任何直接或间接损失，本⽹站均不承担任何责任。&#x3c;/p&#x3e;&#x3c;p&#x3e;第九条、访问者在本⽹站注册时提供的⼀些个⼈资料，本⽹站除您本⼈同意及第⼗条规定外不会将⽤户的任何资料&#x3c;/p&#x3e;&#x3c;p&#x3e;以任何⽅式泄露给任何⼀⽅。&#x3c;/p&#x3e;&#x3c;p&#x3e;第⼗条、当政府部门、司法机关等依照法定程序要求本⽹站披露个⼈资料时，本⽹站将根据执法单位之要求或为公&#x3c;/p&#x3e;&#x3c;p&#x3e;共安全之⽬的提供个⼈资料。在此情况下之任何披露，本⽹站均得免责。&#x3c;/p&#x3e;&#x3c;p&#x3e;第⼗⼀条、由于⽤户将个⼈密码告知他⼈或与他⼈共享注册账户，由此导致的任何个⼈资料泄露，本⽹站不负任何&#x3c;/p&#x3e;&#x3c;p&#x3e;责任。&#x3c;/p&#x3e;&#x3c;p&#x3e;第⼗⼆条、本⽹站有部分内容来⾃互联⽹，如⽆意中侵犯了哪个媒体、公司、企业或个⼈等的知识产权，请来电或&#x3c;/p&#x3e;&#x3c;p&#x3e;致函告之，本⽹站将在规定时间内给予删除等相关处理，若有涉及版权费等问题，请及时提供相关证明等材料并与我&#x3c;/p&#x3e;&#x3c;p&#x3e;们联系，通过友好协商公平公正原则处理纠纷。&#x3c;/p&#x3e;&#x3c;p class=\\&#x22;ql-align-center\\&#x22;&#x3e;以上声明内容的最终解释权归colorcollision.cn⽹站所有。&#x3c;/p&#x3e;&#x22;', '2023-08-13 21:16:11', 0);
INSERT INTO `notice` VALUES (2, '&#x22;&#x3c;h2 class=\\&#x22;ql-align-center\\&#x22;&#x3e;网站v0.0.2版本更新&#x3c;/h2&#x3e;&#x3c;p class=\\&#x22;ql-align-center\\&#x22;&#x3e;&#x3c;span style=\\&#x22;color: rgb(187, 187, 187);\\&#x22;&#x3e;管它是什么版本呢，我就这么叫它了&#x3c;/span&#x3e;&#x3c;/p&#x3e;&#x3c;p&#x3e;&#x3c;strong&#x3e;2023/10/09第一阶段更新&#x3c;/strong&#x3e;&#x3c;/p&#x3e;&#x3c;p&#x3e;增加伤害模拟计算功能，并提供初始攻击方角色：雷伊、盖亚、哈莫雷特。&#x3c;/p&#x3e;&#x3c;p&#x3e;功能说明：&#x3c;/p&#x3e;&#x3c;p&#x3e;选择我方（攻击方）角色与被敌方（攻击方角色）&#x2019;=&#x26;gt;调整双方角色数值=&#x26;gt;调整双方角色刻印、状态=&#x26;gt;选择使用的技能&#x3c;/p&#x3e;&#x3c;p&#x3e;=&#x26;gt;点击计算按钮，显示造成的伤害&#x3c;/p&#x3e;&#x3c;p&#x3e;注意：每个技能含有隐藏系数，公式参考：https://www.bilibili.com/read/cv24668389/?from=search&#x26;amp;spm_id_from=333.337.0.0&#x3c;/p&#x3e;&#x3c;p&#x3e;该网页未测出的技能隐藏系数，一律按照0.99计算（我是不可能测的），若你测出正确的隐藏系数，联系本网站作者以更改。&#x3c;/p&#x3e;&#x3c;p&#x3e;&#x3c;span style=\\&#x22;color: rgb(161, 0, 0);\\&#x22;&#x3e;伤害模拟计算结果预计与实际结果存在10以内的误差（隐藏系数正确的情况下），一切以游戏实际为准。&#x3c;/span&#x3e;&#x3c;/p&#x3e;&#x3c;p&#x3e;&#x3c;strong&#x3e;2023/10/28第二阶段更新&#x3c;/strong&#x3e;&#x3c;/p&#x3e;&#x3c;ol&#x3e;&#x3c;li&#x3e;排行页面提供面板极限速度的显示。&#x3c;/li&#x3e;&#x3c;li&#x3e;角色培养页面增加的角色三维小词条百分比的表格。&#x3c;/li&#x3e;&#x3c;li&#x3e;伤害计算页面增加角色：托鲁克、天邪龙王。&#x3c;/li&#x3e;&#x3c;li&#x3e;伤害计算页面增加战场狂热的计算。&#x3c;/li&#x3e;&#x3c;li&#x3e;伤害计算页面修复结果中出现浮点数的bug&#x3c;/li&#x3e;&#x3c;li&#x3e;伤害计算页面更改角色时重置状态栏&#x3c;/li&#x3e;&#x3c;li&#x3e;伤害计算页面显示技能的隐藏系数&#x3c;/li&#x3e;&#x3c;li&#x3e;增加了部分加载中动画（有时候真的不是代码的问题，是我服务器慢，加载的时间较长的问题，如果加载时间超过1分钟，建议刷新页面）&#x3c;/li&#x3e;&#x3c;/ol&#x3e;&#x3c;p&#x3e;&#x3c;br&#x3e;&#x3c;/p&#x3e;&#x3c;p&#x3e;&#x3c;br&#x3e;&#x3c;/p&#x3e;&#x3c;p&#x3e;联系网站作者：B站搜索 崔慕玄，或：https://space.bilibili.com/589465087&#x3c;/p&#x3e;&#x22;', '2023-10-28 21:58:53', 0);

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill`  (
  `id` int NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '技能名称',
  `pow` float NOT NULL DEFAULT 0.99 COMMENT '独立系数',
  `is_aoe` tinyint NULL DEFAULT NULL COMMENT '是否群体（0：单体；1：群体）',
  `is_active` tinyint NULL DEFAULT NULL COMMENT '是否主动技能（0：被动；1：主动）',
  `map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '效果对应',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段（0：存在；1：删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skill
-- ----------------------------
INSERT INTO `skill` VALUES (21, '滑板连击', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克展示滑板绝技，有25%概率为对手附加2回合的防御下降状态，攻击本回合未使用技能的对手时概率翻倍\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":60,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克展示滑板绝技，有25%概率为对手附加2回合的防御下降状态，攻击本回合未使用技能的对手时概率翻倍\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克展示滑板绝技，有35%概率为对手附加2回合的防御下降状态，攻击本回合未使用技能的对手时概率翻倍\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克展示滑板绝技，有35%概率为对手附加2回合的防御下降状态，攻击本回合未使用技能的对手时概率翻倍\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克展示滑板绝技，有50%概率为对手附加2回合的防御下降状态，攻击本回合未使用技能的对手时概率翻倍\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克展示滑板绝技，有50%概率为对手附加2回合的防御下降状态，攻击本回合未使用技能的对手时概率翻倍\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":80,\"powerIncrease\":{}}]', 0, '2023-10-28 12:45:41', '2023-10-28 12:45:41');
INSERT INTO `skill` VALUES (22, '你的快递', 0.99, 1, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克送出危险的快递，获得2回合速度上升状态，对每个对手各有65%概率附加1回合速度下降状态，攻击本回合未使用技能的对手时无视对手抵抗值的30%\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":80,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克送出危险的快递，获得2回合速度上升状态，对每个对手各有65%概率附加1回合速度下降状态，攻击本回合未使用技能的对手时无视对手抵抗值的30%\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":85,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克送出危险的快递，获得2回合速度上升状态，对每个对手各有65%概率附加2回合速度下降状态，攻击本回合未使用技能的对手时无视对手抵抗值的30%\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":85,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克送出危险的快递，获得2回合速度上升状态，对每个对手各有65%概率附加2回合速度下降状态，攻击本回合未使用技能的对手时无视对手抵抗值的30%\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":95,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克送出危险的快递，获得2回合速度上升状态，对每个对手各有80%概率附加2回合速度下降状态，攻击本回合未使用技能的对手时无视对手抵抗值的30%\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":95,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克送出危险的快递，获得2回合速度上升状态，对每个对手各有80%概率附加2回合速度下降状态，攻击本回合未使用技能的对手时无视对手抵抗值的30%\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":110,\"powerIncrease\":{}}]', 0, '2023-10-28 12:46:00', '2023-10-28 12:46:00');
INSERT INTO `skill` VALUES (23, '请签收', 0.99, 1, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克全速前进，根据自身速度值的35%附加固定伤害，对手处于弱化状态时固定伤害翻倍\",\"extra\":{\"property\":\"speed\",\"rate\":0.7,\"object\":0,\"condition\":[\"base\"],\"isLimit\":\"enemy#buff_debuffExist=>0\",\"limitObject\":0,\"limitProperty\":\"speed\",\"limitRate\":0.35},\"level\":1,\"penetrate\":{},\"power\":120,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克全速前进，根据自身速度值的35%附加固定伤害，对手处于弱化状态时固定伤害翻倍\",\"extra\":{\"property\":\"speed\",\"rate\":0.7,\"object\":0,\"condition\":[\"base\"],\"isLimit\":\"enemy#buff_debuffExist=>0\",\"limitObject\":0,\"limitProperty\":\"speed\",\"limitRate\":0.35},\"level\":2,\"penetrate\":{},\"power\":125,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克全速前进，根据自身速度值的40%附加固定伤害，对手处于弱化状态时固定伤害翻倍\",\"extra\":{\"property\":\"speed\",\"rate\":0.8,\"object\":0,\"condition\":[\"base\"],\"isLimit\":\"enemy#buff_debuffExist=>0\",\"limitObject\":0,\"limitProperty\":\"speed\",\"limitRate\":0.4},\"level\":3,\"penetrate\":{},\"power\":125,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克全速前进，根据自身速度值的40%附加固定伤害，对手处于弱化状态时固定伤害翻倍\",\"extra\":{\"property\":\"speed\",\"rate\":0.8,\"object\":0,\"condition\":[\"base\"],\"isLimit\":\"enemy#buff_debuffExist=>0\",\"limitObject\":0,\"limitProperty\":\"speed\",\"limitRate\":0.4},\"level\":4,\"penetrate\":{},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克全速前进，根据自身速度值的50%附加固定伤害，对手处于弱化状态时固定伤害翻倍\",\"extra\":{\"property\":\"speed\",\"rate\":1,\"object\":0,\"condition\":[\"base\"],\"isLimit\":\"enemy#buff_debuffExist=>0\",\"limitObject\":0,\"limitProperty\":\"speed\",\"limitRate\":0.5},\"level\":5,\"penetrate\":{},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"托鲁克全速前进，根据自身速度值的50%附加固定伤害，对手处于弱化状态时固定伤害翻倍\",\"extra\":{\"property\":\"speed\",\"rate\":1,\"object\":0,\"condition\":[\"base\"],\"isLimit\":\"enemy#buff_debuffExist=>0\",\"limitObject\":0,\"limitProperty\":\"speed\",\"limitRate\":0.5},\"level\":6,\"penetrate\":{},\"power\":150,\"powerIncrease\":{}}]', 0, '2023-10-28 12:46:14', '2023-10-28 12:46:14');
INSERT INTO `skill` VALUES (41, '破元闪', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚向对方快速冲拳攻击，有70%概率为对手附加2回合攻击下降状态，自身处于百练一破状态时贯穿对手防御值的20%，武技值+10\",\"extra\":{},\"level\":1,\"penetrate\":{\"self#buff_id=>10\":0.2},\"power\":60,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚向对方快速冲拳攻击，有70%概率为对手附加2回合攻击下降状态，自身处于百练一破状态时贯穿对手防御值的20%，武技值+10\",\"extra\":{},\"level\":2,\"penetrate\":{\"self#buff_id=>10\":0.2},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚向对方快速冲拳攻击，有80%概率为对手附加2回合攻击下降状态，自身处于百练一破状态时贯穿对手防御值的20%，武技值+10\",\"extra\":{},\"level\":3,\"penetrate\":{\"self#buff_id=>10\":0.2},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚向对方快速冲拳攻击，有80%概率为对手附加2回合攻击下降状态，自身处于百练一破状态时贯穿对手防御值的20%，武技值+10\",\"extra\":{},\"level\":4,\"penetrate\":{\"self#buff_id=>10\":0.2},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚向对方快速冲拳攻击，有80%概率为对手附加2回合攻击下降状态，自身处于百练一破状态时贯穿对手防御值的30%，武技值+10\",\"extra\":{},\"level\":5,\"penetrate\":{\"self#buff_id=>10\":0.3},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚向对方快速冲拳攻击，有80%概率为对手附加2回合攻击下降状态，自身处于百练一破状态时贯穿对手防御值的30%，武技值+10\",\"extra\":{},\"level\":6,\"penetrate\":{\"self#buff_id=>10\":0.3},\"power\":80,\"powerIncrease\":{}}]', 0, '2023-10-09 07:52:03', '2023-10-09 07:52:03');
INSERT INTO `skill` VALUES (42, '无尽战意', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚积攒能量挥动拳套击打对方，有60%概率为对手附加2回合防御下降状态，自身处于百练一破状态时无视对手抵抗，武技值+20\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":90,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚积攒能量挥动拳套击打对方，有60%概率为对手附加2回合防御下降状态，自身处于百练一破状态时无视对手抵抗，武技值+20\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":95,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚积攒能量挥动拳套击打对方，有80%概率为对手附加2回合防御下降状态，自身处于百练一破状态时无视对手抵抗，武技值+20\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":95,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚积攒能量挥动拳套击打对方，有80%概率为对手附加2回合防御下降状态，自身处于百练一破状态时无视对手抵抗，武技值+20\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":105,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚积攒能量挥动拳套击打对方，有80%概率为对手附加2回合防御下降状态，自身处于百练一破状态时无视对手抵抗，武技值+30\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":105,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚积攒能量挥动拳套击打对方，有80%概率为对手附加2回合防御下降状态，自身处于百练一破状态时无视对手抵抗，武技值+30\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":120,\"powerIncrease\":{}}]', 0, '2023-10-09 07:52:22', '2023-10-09 07:52:22');
INSERT INTO `skill` VALUES (43, '石破天惊', 1.1, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚领悟武道意志，蓄力重击对方，获得2回合攻击上升状态，击败对手时自身处于百练一破状态则立即恢复1点能量，武技值+50\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":130,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚领悟武道意志，蓄力重击对方，获得2回合攻击上升状态，击败对手时自身处于百练一破状态则立即恢复1点能量，武技值+50\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":140,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚领悟武道意志，蓄力重击对方，获得2回合攻击上升状态，击败对手时自身处于百练一破状态则立即恢复2点能量，武技值+50\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":140,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚领悟武道意志，蓄力重击对方，获得2回合攻击上升状态，击败对手时自身处于百练一破状态则立即恢复2点能量，武技值+50\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":155,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚领悟武道意志，蓄力重击对方，获得2回合攻击上升状态，击败对手时自身处于百练一破状态则立即恢复2点能量，武技值+50\",\"extra\":{\"attack\":0},\"level\":5,\"penetrate\":{},\"power\":155,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"盖亚领悟武道意志，蓄力重击对方，获得2回合攻击上升状态，击败对手时自身处于百练一破状态则立即恢复2点能量，武技值+70\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":180,\"powerIncrease\":{}}]', 0, '2023-10-09 07:52:44', '2023-10-09 07:52:44');
INSERT INTO `skill` VALUES (541, '天龙破', 0.958, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"哈莫雷特使用王剑攻击，有60%概率为对手附加2回合防御下降状态\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":60,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"哈莫雷特使用王剑攻击，有60%概率为对手附加2回合防御下降状态\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"哈莫雷特使用王剑攻击，有70%概率为对手附加2回合防御下降状态\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"哈莫雷特使用王剑攻击，有70%概率为对手附加2回合防御下降状态\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":75,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"哈莫雷特使用王剑攻击，有80%概率为对手附加2回合防御下降状态\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":75,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"哈莫雷特使用王剑攻击，有80%概率为对手附加2回合防御下降状态\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":90,\"powerIncrease\":{}}]', 0, '2023-10-09 08:37:04', '2023-10-09 08:37:04');
INSERT INTO `skill` VALUES (542, '龙之意志', 0, 1, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"哈莫雷特凝聚王的意志，为己方全体角色附加2回合攻击上升状态和1次伤害免疫状态\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":0,\"powerIncrease\":{}}]', 0, '2023-10-09 08:37:20', '2023-10-09 08:37:20');
INSERT INTO `skill` VALUES (543, '龙王灭碎阵', 1.36, 1, 1, '[{\"addition\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"base\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"哈莫雷特背负王者之名，携带王冠召唤龙神，对每个对方角色各有35%概率附加2回合嘲讽状态，同时根据哈莫雷特最大生命值10%提高攻击伤害\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":130,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"base\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"哈莫雷特背负王者之名，携带王冠召唤龙神，对每个对方角色各有35%概率附加2回合嘲讽状态，同时根据哈莫雷特最大生命值10%提高攻击伤害\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"base\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"哈莫雷特背负王者之名，携带王冠召唤龙神，对每个对方角色各有50%概率附加2回合嘲讽状态，同时根据哈莫雷特最大生命值10%提高攻击伤害\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"base\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"哈莫雷特背负王者之名，携带王冠召唤龙神，对每个对方角色各有50%概率附加2回合嘲讽状态，同时根据哈莫雷特最大生命值10%提高攻击伤害\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":145,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.2,\"object\":0,\"condition\":[\"base\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"哈莫雷特背负王者之名，携带王冠召唤龙神，对每个对方角色各有50%概率附加2回合嘲讽状态，同时根据哈莫雷特最大生命值20%提高攻击伤害\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":145,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.2,\"object\":0,\"condition\":[\"base\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"哈莫雷特背负王者之名，携带王冠召唤龙神，对每个对方角色各有50%概率附加2回合嘲讽状态，同时根据哈莫雷特最大生命值20%提高攻击伤害\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":160,\"powerIncrease\":{}}]', 0, '2023-10-28 12:49:58', '2023-10-28 12:49:58');
INSERT INTO `skill` VALUES (561, '极光刃', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊快速挥动极光刃攻击对方，造成伤害和有65%概率消除一个强化状态，对手处于雷霆引渡状态时，触发提高10%\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":60,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊快速挥动极光刃攻击对方，造成伤害和有65%概率消除一个强化状态，对手处于雷霆引渡状态时，触发提高10%\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊快速挥动极光刃攻击对方，造成伤害和有65%概率消除一个强化状态，对手处于雷霆引渡状态时，触发提高20%\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊快速挥动极光刃攻击对方，造成伤害和有65%概率消除一个强化状态，对手处于雷霆引渡状态时，触发提高20%\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊快速挥动极光刃攻击对方，造成伤害和有80%概率消除一个强化状态，对手处于雷霆引渡状态时，触发提高20%\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊快速挥动极光刃攻击对方，造成伤害和有80%概率消除一个强化状态，对手处于雷霆引渡状态时，触发提高20%\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":80,\"powerIncrease\":{}}]', 0, '2023-10-08 15:35:46', '2023-10-08 15:35:46');
INSERT INTO `skill` VALUES (562, '雷祭', 0.99, 1, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊释放异能召唤雷电攻击对方全体角色，对每个对方角色有75%概率附加3回合雷霆引渡状态\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊释放异能召唤雷电攻击对方全体角色，对每个对方角色有75%概率附加3回合雷霆引渡状态\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":75,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊释放异能召唤雷电攻击对方全体角色，对每个对方角色有85%概率附加3回合雷霆引渡状态\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":75,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊释放异能召唤雷电攻击对方全体角色，对每个对方角色有85%概率附加3回合雷霆引渡状态\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":85,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊释放异能召唤雷电攻击对方全体角色，对每个对方角色附加3回合雷霆引渡状态\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":85,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊释放异能召唤雷电攻击对方全体角色，对每个对方角色附加3回合雷霆引渡状态\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":100,\"powerIncrease\":{}}]', 0, '2023-10-08 15:36:05', '2023-10-08 15:36:05');
INSERT INTO `skill` VALUES (563, '瞬雷天闪', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊将雷电异能缠绕在极光刃上攻击对手，攻击贯穿对手防御值的15%，并有5%的几率造成双倍伤害，若对手处于雷霆引渡状态，则贯穿防御比例提高25%，双倍伤害的触发概率提高10%\",\"extra\":{},\"level\":1,\"penetrate\":{\"base\":0.15,\"enemy#buff_id=>9\":0.4},\"power\":130,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊将雷电异能缠绕在极光刃上攻击对手，攻击贯穿对手防御值的15%，并有5%的几率造成双倍伤害，若对手处于雷霆引渡状态，则贯穿防御比例提高25%，双倍伤害的触发概率提高10%\",\"extra\":{},\"level\":2,\"penetrate\":{\"base\":0.15,\"enemy#buff_id=>9\":0.4},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊将雷电异能缠绕在极光刃上攻击对手，攻击贯穿对手防御值的25%，并有5%的几率造成双倍伤害，若对手处于雷霆引渡状态，则贯穿防御比例提高25%，双倍伤害的触发概率提高10%\",\"extra\":{},\"level\":3,\"penetrate\":{\"base\":0.25,\"enemy#buff_id=>9\":0.5},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊将雷电异能缠绕在极光刃上攻击对手，攻击贯穿对手防御值的25%，并有5%的几率造成双倍伤害，若对手处于雷霆引渡状态，则贯穿防御比例提高25%，双倍伤害的触发概率提高10%\",\"extra\":{},\"level\":4,\"penetrate\":{\"base\":0.25,\"enemy#buff_id=>9\":0.5},\"power\":145,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊将雷电异能缠绕在极光刃上攻击对手，攻击贯穿对手防御值的25%，并有10%的几率造成双倍伤害，若对手处于雷霆引渡状态，则贯穿防御比例提高25%，双倍伤害的触发概率提高20%\",\"extra\":{\"attack\":0},\"level\":5,\"penetrate\":{\"base\":0.25,\"enemy#buff_id=>9\":0.5},\"power\":145,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"雷伊将雷电异能缠绕在极光刃上攻击对手，攻击贯穿对手防御值的25%，并有10%的几率造成双倍伤害，若对手处于雷霆引渡状态，则贯穿防御比例提高25%，双倍伤害的触发概率提高20%\",\"extra\":{},\"level\":6,\"penetrate\":{\"base\":0.25,\"enemy#buff_id=>9\":0.5},\"power\":160,\"powerIncrease\":{}}]', 0, '2023-10-08 15:36:21', '2023-10-09 10:45:11');
INSERT INTO `skill` VALUES (601, '寂灭之握', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王带来毁灭，有60%概率为对手附加2回合速度下降状态\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":60,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王带来毁灭，有60%概率为对手附加2回合速度下降状态\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王带来毁灭，有70%概率为对手附加2回合速度下降状态\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王带来毁灭，有70%概率为对手附加2回合速度下降状态\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王带来毁灭，有80%概率为对手附加2回合速度下降状态\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王带来毁灭，有80%概率为对手附加2回合速度下降状态\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":80,\"powerIncrease\":{}}]', 0, '2023-10-28 10:14:45', '2023-10-28 10:14:45');
INSERT INTO `skill` VALUES (602, '恶兆绝念', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王召唤棋子，斩杀对手，80%概率为对手附加2回合防御下降状态，造成暴击时80%概率为对手附加2回合无法强化状态\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":100,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王召唤棋子，斩杀对手，80%概率为对手附加2回合防御下降状态，造成暴击时80%概率为对手附加2回合无法强化状态\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":105,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王召唤棋子，斩杀对手，为对手附加2回合防御下降状态，造成暴击时80%概率为对手附加2回合无法强化状态\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":105,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王召唤棋子，斩杀对手，为对手附加2回合防御下降状态，造成暴击时80%概率为对手附加2回合无法强化状态\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":115,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王召唤棋子，斩杀对手，为对手附加2回合防御下降状态，造成暴击时为对手附加2回合无法强化状态\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":115,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"天邪龙王召唤棋子，斩杀对手，为对手附加2回合防御下降状态，造成暴击时为对手附加2回合无法强化状态\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":130,\"powerIncrease\":{}}]', 0, '2023-10-28 10:17:39', '2023-10-28 10:17:39');
INSERT INTO `skill` VALUES (603, '天命已至', 0.99, 1, 1, '[{\"addition\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"status#=>false\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"天邪龙王于王座之上降下裁决，对本回合未使用技能的对方角色根据自身最大生命值10%提高攻击伤害，根据对手已损生命值的10%附加固定伤害，最高不超过自身最大生命值的25%\",\"extra\":{\"property\":\"lostLife\",\"rate\":0.1,\"object\":1,\"condition\":[\"base\"],\"isLimit\":true,\"limitObject\":0,\"limitProperty\":\"totalLife\",\"limitRate\":0.25},\"level\":1,\"penetrate\":{},\"power\":120,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"status#=>false\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"天邪龙王于王座之上降下裁决，对本回合未使用技能的对方角色根据自身最大生命值10%提高攻击伤害，根据对手已损生命值的10%附加固定伤害，最高不超过自身最大生命值的25%\",\"extra\":{\"property\":\"lostLife\",\"rate\":0.1,\"object\":1,\"condition\":[\"base\"],\"isLimit\":true,\"limitObject\":0,\"limitProperty\":\"totalLife\",\"limitRate\":0.25},\"level\":2,\"penetrate\":{},\"power\":125,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.15,\"object\":0,\"condition\":[\"status#=>false\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"天邪龙王于王座之上降下裁决，对本回合未使用技能的对方角色根据自身最大生命值15%提高攻击伤害，根据对手已损生命值的10%附加固定伤害，最高不超过自身最大生命值的25%\",\"extra\":{\"property\":\"lostLife\",\"rate\":0.1,\"object\":1,\"condition\":[\"base\"],\"isLimit\":true,\"limitObject\":0,\"limitProperty\":\"totalLife\",\"limitRate\":0.25},\"level\":3,\"penetrate\":{},\"power\":125,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.15,\"object\":0,\"condition\":[\"status#=>false\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"天邪龙王于王座之上降下裁决，对本回合未使用技能的对方角色根据自身最大生命值15%提高攻击伤害，根据对手已损生命值的10%附加固定伤害，最高不超过自身最大生命值的25%\",\"extra\":{\"property\":\"lostLife\",\"rate\":0.1,\"object\":1,\"condition\":[\"base\"],\"isLimit\":true,\"limitObject\":0,\"limitProperty\":\"totalLife\",\"limitRate\":0.25},\"level\":4,\"penetrate\":{},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.15,\"object\":0,\"condition\":[\"status#=>false\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"天邪龙王于王座之上降下裁决，对本回合未使用技能的对方角色根据自身最大生命值15%提高攻击伤害，根据对手已损生命值的20%附加固定伤害，最高不超过自身最大生命值的25%\",\"extra\":{\"property\":\"lostLife\",\"rate\":0.2,\"object\":1,\"condition\":[\"base\"],\"isLimit\":true,\"limitObject\":0,\"limitProperty\":\"totalLife\",\"limitRate\":0.25},\"level\":5,\"penetrate\":{},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{\"property\":\"totalLife\",\"rate\":0.15,\"object\":0,\"condition\":[\"status#=>false\"],\"isLimit\":false},\"damageIncrease\":{},\"description\":\"天邪龙王于王座之上降下裁决，对本回合未使用技能的对方角色根据自身最大生命值15%提高攻击伤害，根据对手已损生命值的20%附加固定伤害，最高不超过自身最大生命值的25%\",\"extra\":{\"property\":\"lostLife\",\"rate\":0.2,\"object\":1,\"condition\":[\"base\"],\"isLimit\":true,\"limitObject\":0,\"limitProperty\":\"totalLife\",\"limitRate\":0.25},\"level\":6,\"penetrate\":{},\"power\":150,\"powerIncrease\":{}}]', 0, '2023-10-28 11:04:16', '2023-10-28 11:04:16');
INSERT INTO `skill` VALUES (691, '恶魔之炎', 0.99, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯挥出恶魔的火焰，有50%概率对目标附加2回合无法恢复状态，自身处于此面朝上状态时自身获得2回合攻击上升状态，自身处于此面朝下状态时，对目标附加2回合防御下降状态\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":60,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯挥出恶魔的火焰，有50%概率对目标附加2回合无法恢复状态，自身处于此面朝上状态时自身获得2回合攻击上升状态，自身处于此面朝下状态时，对目标附加2回合防御下降状态\",\"extra\":{},\"level\":2,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯挥出恶魔的火焰，有60%概率对目标附加2回合无法恢复状态，自身处于此面朝上状态时自身获得2回合攻击上升状态，自身处于此面朝下状态时，对目标附加2回合防御下降状态\",\"extra\":{},\"level\":3,\"penetrate\":{},\"power\":65,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯挥出恶魔的火焰，有60%概率对目标附加2回合无法恢复状态，自身处于此面朝上状态时自身获得2回合攻击上升状态，自身处于此面朝下状态时，对目标附加2回合防御下降状态\",\"extra\":{},\"level\":4,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯挥出恶魔的火焰，有70%概率对目标附加2回合无法恢复状态，自身处于此面朝上状态时自身获得2回合攻击上升状态，自身处于此面朝下状态时，对目标附加2回合防御下降状态\",\"extra\":{},\"level\":5,\"penetrate\":{},\"power\":70,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯挥出恶魔的火焰，有70%概率对目标附加2回合无法恢复状态，自身处于此面朝上状态时自身获得2回合攻击上升状态，自身处于此面朝下状态时，对目标附加2回合防御下降状态\",\"extra\":{},\"level\":6,\"penetrate\":{},\"power\":80,\"powerIncrease\":{}}]', 0, '2023-11-03 08:15:26', '2023-11-03 08:15:26');
INSERT INTO `skill` VALUES (692, '命运', 0, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯操弄命运的抉择，获得2回合暴击率上升状态并随即获得此面朝上或此面朝下状态，持续2回合，有15%概率同时获得此面朝上和此面朝下两种状态，使用技能前自身已处于其中任意状态时则同时获得两种状态持续2回合\",\"extra\":{},\"level\":1,\"penetrate\":{},\"power\":0,\"powerIncrease\":{}}]', 0, '2023-11-03 08:15:40', '2023-11-03 08:15:40');
INSERT INTO `skill` VALUES (693, '炼狱火海', 1.1, 0, 1, '[{\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯用邪念的火焰燃尽一切，解除自身全部弱化状态，自身处于此面朝上状态时，贯穿对手防御值的20%，自身处于此面朝下状态时，以80%概率对目标附加3次烧伤状态，持续2回合\",\"extra\":{},\"level\":1,\"penetrate\":{\"self#buff_id=>11\":0.2},\"power\":130,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯用邪念的火焰燃尽一切，解除自身全部弱化状态，自身处于此面朝上状态时，贯穿对手防御值的20%，自身处于此面朝下状态时，以80%概率对目标附加3次烧伤状态，持续2回合\",\"extra\":{},\"level\":2,\"penetrate\":{\"self#buff_id=>11\":0.2},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯用邪念的火焰燃尽一切，解除自身全部弱化状态，自身处于此面朝上状态时，贯穿对手防御值的30%，自身处于此面朝下状态时，以80%概率对目标附加3次烧伤状态，持续2回合\",\"extra\":{},\"level\":3,\"penetrate\":{\"self#buff_id=>11\":0.3},\"power\":135,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯用邪念的火焰燃尽一切，解除自身全部弱化状态，自身处于此面朝上状态时，贯穿对手防御值的30%，自身处于此面朝下状态时，以80%概率对目标附加3次烧伤状态，持续2回合\",\"extra\":{},\"level\":4,\"penetrate\":{\"self#buff_id=>11\":0.3},\"power\":145,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯用邪念的火焰燃尽一切，解除自身全部弱化状态，自身处于此面朝上状态时，贯穿对手防御值的30%，自身处于此面朝下状态时，以80%概率对目标附加4次烧伤状态，持续2回合\",\"extra\":{},\"level\":5,\"penetrate\":{\"self#buff_id=>11\":0.3},\"power\":145,\"powerIncrease\":{}}, {\"addition\":{},\"damageIncrease\":{},\"description\":\"泰沃斯用邪念的火焰燃尽一切，解除自身全部弱化状态，自身处于此面朝上状态时，贯穿对手防御值的30%，自身处于此面朝下状态时，以80%概率对目标附加4次烧伤状态，持续2回合\",\"extra\":{},\"level\":6,\"penetrate\":{\"self#buff_id=>11\":0.3},\"power\":160,\"powerIncrease\":{}}]', 0, '2023-11-03 08:16:09', '2023-11-03 08:16:09');

-- ----------------------------
-- Table structure for soul
-- ----------------------------
DROP TABLE IF EXISTS `soul`;
CREATE TABLE `soul`  (
  `id` int NOT NULL COMMENT '主键',
  `map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '命座效果对应',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段（0：存在；1：删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soul
-- ----------------------------
INSERT INTO `soul` VALUES (2, '[{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":1,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":2,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":3,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{\"enemy#buff_debuffExist=>1\":0.05},\"extra\":{},\"level\":4,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{\"enemy#buff_debuffExist=>1\":0.05},\"extra\":{},\"level\":5,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":10},\"damageIncrease\":{\"enemy#buff_debuffExist=>1\":0.05},\"extra\":{},\"level\":6,\"penetrate\":{},\"powerIncrease\":{}}]', 0, '2023-10-28 11:51:56', '2023-10-28 11:51:56');
INSERT INTO `soul` VALUES (4, '[{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":1,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":10,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":2,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":10,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{\"skill#isAoe=>0\":0.05},\"extra\":{},\"level\":3,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":10,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{\"skill#isAoe=>0\":0.05},\"extra\":{},\"level\":4,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":10,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{\"skill#isAoe=>0\":0.05},\"extra\":{},\"level\":5,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":10,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":10,\"precision\":0,\"resistance\":0,\"speed\":10},\"damageIncrease\":{\"skill#isAoe=>0\":0.05},\"extra\":{},\"level\":6,\"penetrate\":{},\"powerIncrease\":{}}]', 0, '2023-10-09 07:51:33', '2023-10-09 07:51:33');
INSERT INTO `soul` VALUES (54, '[{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":1,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":2,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":3,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":4,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":5,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":15,\"precision\":0,\"resistance\":0,\"speed\":10},\"damageIncrease\":{},\"extra\":{},\"level\":6,\"penetrate\":{},\"powerIncrease\":{}}]', 0, '2023-10-09 08:36:42', '2023-10-09 08:36:42');
INSERT INTO `soul` VALUES (56, '[{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{\"property\":\"attack\",\"rate\":0.1,\"object\":0,\"condition\":[\"enemy#buff_id=>9\",\"skill#id=>561_or_skill#id=>563\"],\"isLimit\":false},\"level\":1,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{\"property\":\"attack\",\"rate\":0.1,\"object\":0,\"condition\":[\"enemy#buff_id=>9\",\"skill#id=>561_or_skill#id=>563\"],\"isLimit\":false},\"level\":2,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{\"property\":\"attack\",\"rate\":0.2,\"object\":0,\"condition\":[\"enemy#buff_id=>9\",\"skill#id=>561_or_skill#id=>563\"],\"isLimit\":false},\"level\":3,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{\"enemy#buff_debuffExist=>1\":0.05},\"extra\":{\"property\":\"attack\",\"rate\":0.2,\"object\":0,\"condition\":[\"enemy#buff_id=>9\",\"skill#id=>561_or_skill#id=>563\"],\"isLimit\":false},\"level\":4,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{\"enemy#buff_debuffExist=>1\":0.05},\"extra\":{\"property\":\"attack\",\"rate\":0.25,\"object\":0,\"condition\":[\"enemy#buff_id=>9\",\"skill#id=>561_or_skill#id=>563\"],\"isLimit\":false},\"level\":5,\"penetrate\":{},\"powerIncrease\":{}}, {\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":10},\"damageIncrease\":{\"enemy#buff_debuffExist=>1\":0.05},\"extra\":{\"property\":\"attack\",\"rate\":0.25,\"object\":0,\"condition\":[\"enemy#buff_id=>9\",\"skill#id=>561_or_skill#id=>563\"],\"isLimit\":false},\"level\":6,\"penetrate\":{},\"powerIncrease\":{}}]', 0, '2023-10-08 15:35:29', '2023-10-09 15:22:59');
INSERT INTO `soul` VALUES (60, '[{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"enemy#buff_debuffExist=>1\"],\"isLimit\":false},\"level\":1,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{},\"extra\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"enemy#buff_debuffExist=>1\"],\"isLimit\":false},\"level\":2,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{},\"extra\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"enemy#buff_debuffExist=>1\"],\"isLimit\":false},\"level\":3,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{},\"extra\":{\"property\":\"totalLife\",\"rate\":0.1,\"object\":0,\"condition\":[\"enemy#buff_debuffExist=>1\"],\"isLimit\":false},\"level\":4,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{},\"extra\":{\"property\":\"totalLife\",\"rate\":0.15,\"object\":0,\"condition\":[\"enemy#buff_debuffExist=>1\"],\"isLimit\":false},\"level\":5,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":15,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{},\"extra\":{\"property\":\"totalLife\",\"rate\":0.15,\"object\":0,\"condition\":[\"enemy#buff_debuffExist=>1\"],\"isLimit\":false},\"level\":6,\"penetrate\":{},\"powerIncrease\":{}}]', 0, '2023-10-28 10:14:00', '2023-10-28 10:14:00');
INSERT INTO `soul` VALUES (69, '[{\"addition\":{},\"characterSoulDTO\":{\"attack\":0,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":1,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":2,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":0},\"damageIncrease\":{},\"extra\":{},\"level\":3,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{},\"extra\":{},\"level\":4,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{},\"extra\":{},\"level\":5,\"penetrate\":{},\"powerIncrease\":{}},{\"addition\":{},\"characterSoulDTO\":{\"attack\":5,\"crit\":0,\"criticalDamage\":0,\"defense\":0,\"life\":0,\"precision\":0,\"resistance\":0,\"speed\":5},\"damageIncrease\":{\"skill#isAoe=>0\":0.1},\"extra\":{},\"level\":6,\"penetrate\":{},\"powerIncrease\":{}}]', 0, '2023-11-03 08:14:53', '2023-11-03 08:14:53');

-- ----------------------------
-- Table structure for special_status
-- ----------------------------
DROP TABLE IF EXISTS `special_status`;
CREATE TABLE `special_status`  (
  `id` int NOT NULL COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态类型（buff/skill/status）',
  `subject_id` int NOT NULL COMMENT '主体id/所有者id',
  `rely_id` int NOT NULL COMMENT '直属依赖id',
  `layers` int NOT NULL DEFAULT 1 COMMENT '层数',
  `map` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对应map',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of special_status
-- ----------------------------
INSERT INTO `special_status` VALUES (1, '百练一破', 'buff', 4, 10, 1, '[{\"attack\":35,\"critDamage\":0,\"damageIncrease\":0,\"defense\":0,\"level\":1,\"speed\":0},{\"attack\":35,\"critDamage\":0,\"damageIncrease\":0,\"defense\":0,\"level\":2,\"speed\":0},{\"attack\":40,\"critDamage\":0,\"damageIncrease\":0,\"defense\":0,\"level\":3,\"speed\":0},{\"attack\":40,\"critDamage\":0,\"damageIncrease\":0,\"defense\":0,\"level\":4,\"speed\":0},{\"attack\":50,\"critDamage\":0,\"damageIncrease\":0,\"defense\":0,\"level\":5,\"speed\":0},{\"attack\":50,\"critDamage\":0,\"damageIncrease\":0,\"defense\":0,\"level\":6,\"speed\":0}]');
INSERT INTO `special_status` VALUES (2, '此面朝上', 'buff', 69, 11, 1, '[{\"attack\":15,\"critDamage\":30,\"damageIncrease\":0,\"defense\":0,\"level\":1,\"speed\":0},{\"attack\":15,\"critDamage\":30,\"damageIncrease\":0,\"defense\":0,\"level\":2,\"speed\":0},{\"attack\":20,\"critDamage\":40,\"damageIncrease\":0,\"defense\":0,\"level\":3,\"speed\":0},{\"attack\":20,\"critDamage\":40,\"damageIncrease\":0,\"defense\":0,\"level\":4,\"speed\":0},{\"attack\":30,\"critDamage\":50,\"damageIncrease\":0,\"defense\":0,\"level\":5,\"speed\":0},{\"attack\":30,\"critDamage\":50,\"damageIncrease\":0,\"defense\":0,\"level\":6,\"speed\":0}]');

-- ----------------------------
-- Table structure for talent
-- ----------------------------
DROP TABLE IF EXISTS `talent`;
CREATE TABLE `talent`  (
  `position` int NOT NULL COMMENT '主键',
  `decrease_power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '威力降低',
  `increase_damage` tinyint NULL DEFAULT NULL COMMENT '伤害增加',
  `is_delete` tinyint NOT NULL COMMENT '逻辑删除字段（0：存在；1：删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`position`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of talent
-- ----------------------------
INSERT INTO `talent` VALUES (0, '0', 5, 0, '2023-09-16 12:18:50', '2023-09-16 12:20:52');
INSERT INTO `talent` VALUES (1, '5', 0, 0, '2023-09-16 12:18:50', '2023-09-16 12:20:54');
INSERT INTO `talent` VALUES (2, '5', 0, 0, '2023-09-16 12:18:50', '2023-09-16 12:20:55');
INSERT INTO `talent` VALUES (3, '5', 0, 0, '2023-09-16 12:18:50', '2023-09-16 12:21:01');

-- ----------------------------
-- Table structure for talent_map
-- ----------------------------
DROP TABLE IF EXISTS `talent_map`;
CREATE TABLE `talent_map`  (
  `id` int NOT NULL,
  `position` tinyint NOT NULL COMMENT '0.进攻；1.防御；2.干扰；3.辅助',
  `attack` tinyint NOT NULL,
  `defense` tinyint NOT NULL,
  `life` tinyint NOT NULL,
  `speed` tinyint NOT NULL,
  `crit` tinyint NOT NULL,
  `critical_damage` tinyint NOT NULL,
  `precision` tinyint NOT NULL,
  `resistance` tinyint NOT NULL,
  `is_delete` tinyint NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of talent_map
-- ----------------------------
INSERT INTO `talent_map` VALUES (1, 0, 20, 10, 10, 10, 10, 20, 30, 30, 0, '2023-08-07 12:49:22', '2023-08-07 12:49:25');
INSERT INTO `talent_map` VALUES (2, 1, 0, 20, 30, 10, 10, 10, 15, 30, 0, '2023-08-07 12:54:28', '2023-08-07 12:54:31');
INSERT INTO `talent_map` VALUES (3, 2, 0, 10, 20, 20, 5, 20, 60, 30, 0, '2023-08-07 12:56:11', '2023-08-07 12:56:13');
INSERT INTO `talent_map` VALUES (4, 3, 10, 10, 20, 20, 5, 10, 30, 45, 0, '2023-08-07 12:57:26', '2023-08-07 12:57:28');

SET FOREIGN_KEY_CHECKS = 1;
