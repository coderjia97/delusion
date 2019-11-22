/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost:3306
 Source Schema         : myweb

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 29/06/2019 17:57:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yzm_advert
-- ----------------------------
DROP TABLE IF EXISTS `yzm_advert`;
CREATE TABLE `yzm_advert`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pos` tinyint(4) NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_delete` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0：未删除，1：已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_advert
-- ----------------------------
INSERT INTO `yzm_advert` VALUES (25, '第1章', 'http://upload.myshop15.com/20190610\\41d7c2a02183377780670e9d230a6ac0.jpg', 1, 'http://taobao.com', 0);
INSERT INTO `yzm_advert` VALUES (26, '第2章', 'http://upload.myshop15.com/20190610\\06cb33e672205ae9ed2daaabccbc1560.jpg', 2, 'http://jd.com', 0);
INSERT INTO `yzm_advert` VALUES (27, '第3章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 3, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (28, '第4章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 4, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (29, '第5章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 5, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (30, '第6章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 6, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (31, '第7章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 7, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (32, '第8章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 8, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (33, '第9章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 9, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (34, '第10章', 'http://upload.myshop15.com/20190602\\c8b6ec305c0dbeac1b6578d9aa18fc95.jpg', 10, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (35, '第11章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 11, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (36, '第12章', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 12, 'http://baidu.com', 0);
INSERT INTO `yzm_advert` VALUES (37, '第13章', 'http://upload.myshop15.com/20190601\\67df0acc2af91d54e43cc240cf474332.jpg', 13, 'http://baidu.com', 0);

-- ----------------------------
-- Table structure for yzm_cart
-- ----------------------------
DROP TABLE IF EXISTS `yzm_cart`;
CREATE TABLE `yzm_cart`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) UNSIGNED NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `name` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(11) UNSIGNED NOT NULL,
  `sell_price` decimal(10, 2) NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_cart
-- ----------------------------
INSERT INTO `yzm_cart` VALUES (6, 31, 6, 7, 'phone华为手机-3', 'http://upload.myshop15.com/20190601/67df0acc2af91d54e43cc240cf474332.jpg', 1, 5000.00, 1560614339);
INSERT INTO `yzm_cart` VALUES (7, 54, 12, 7, '华为手机配件-1', 'http://upload.myshop15.com/20190601/67df0acc2af91d54e43cc240cf474332.jpg', 1, 20.00, 1560614358);

-- ----------------------------
-- Table structure for yzm_class
-- ----------------------------
DROP TABLE IF EXISTS `yzm_class`;
CREATE TABLE `yzm_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_delete` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0：未删除，1：已删除',
  `create_time` int(11) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_class
-- ----------------------------
INSERT INTO `yzm_class` VALUES (1, '电脑', 0, 1560172100, 0);
INSERT INTO `yzm_class` VALUES (4, '手机', 0, 1560172100, 0);
INSERT INTO `yzm_class` VALUES (6, '华为手机', 0, 1560172100, 4);
INSERT INTO `yzm_class` VALUES (7, '联想电脑', 0, 1560172100, 1);
INSERT INTO `yzm_class` VALUES (8, '联想手机', 0, 1560172100, 4);
INSERT INTO `yzm_class` VALUES (9, '苹果电脑', 0, 1560172100, 1);
INSERT INTO `yzm_class` VALUES (10, '苹果手机', 0, 1560172100, 4);
INSERT INTO `yzm_class` VALUES (11, '华为电脑', 0, 1560172100, 1);
INSERT INTO `yzm_class` VALUES (12, '华为手机配件', 0, 1560172100, 6);
INSERT INTO `yzm_class` VALUES (13, '联想手机配件', 0, 1560172100, 8);
INSERT INTO `yzm_class` VALUES (14, '联想电脑配件', 0, 1560172100, 7);
INSERT INTO `yzm_class` VALUES (15, '苹果电脑配件', 0, 1560172100, 9);
INSERT INTO `yzm_class` VALUES (16, '苹果手机配件', 0, 1560172100, 10);
INSERT INTO `yzm_class` VALUES (17, '华为电脑配件', 0, 1560172100, 11);
INSERT INTO `yzm_class` VALUES (18, '三星电脑', 0, 1560172100, 1);
INSERT INTO `yzm_class` VALUES (19, '三星电脑配件', 0, 1560172136, 18);
INSERT INTO `yzm_class` VALUES (20, '三星手机', 0, 1560172162, 4);
INSERT INTO `yzm_class` VALUES (21, '三星手机配件', 0, 1560172181, 20);
INSERT INTO `yzm_class` VALUES (22, 'DELL电脑', 0, 1560172522, 1);
INSERT INTO `yzm_class` VALUES (23, 'DELL手机', 0, 1560172534, 4);
INSERT INTO `yzm_class` VALUES (24, 'DELL手机配件', 0, 1560172565, 23);
INSERT INTO `yzm_class` VALUES (25, 'DELL电脑配件', 0, 1560172580, 22);

-- ----------------------------
-- Table structure for yzm_comment
-- ----------------------------
DROP TABLE IF EXISTS `yzm_comment`;
CREATE TABLE `yzm_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  `is_delete` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_comment
-- ----------------------------
INSERT INTO `yzm_comment` VALUES (1, 4, 6, 'i love you!', 1512703077, 0);
INSERT INTO `yzm_comment` VALUES (2, 4, 6, '商品太差.', 1512703077, 0);
INSERT INTO `yzm_comment` VALUES (3, 15, 3, 'sadfasdasdfasdfsadfsadf', 1513312020, 0);
INSERT INTO `yzm_comment` VALUES (4, 15, 3, 'aaaaaaaaaaaaaa', 1513312052, 0);
INSERT INTO `yzm_comment` VALUES (5, 15, 3, '苹果真好吃!', 1513312071, 0);
INSERT INTO `yzm_comment` VALUES (12, 4, 30, '好', 1560958693, 0);
INSERT INTO `yzm_comment` VALUES (13, 4, 29, '好', 1560958693, 0);
INSERT INTO `yzm_comment` VALUES (14, 4, 31, '阿U盾八十八对比uasidasabsid', 1561211858, 0);
INSERT INTO `yzm_comment` VALUES (15, 4, 23, '按时拨打被司法不必把手', 1561213213, 0);
INSERT INTO `yzm_comment` VALUES (16, 4, 34, '按时拨打被司法不必把手', 1561213213, 0);
INSERT INTO `yzm_comment` VALUES (17, 4, 29, '按时拨打被司法不必把手', 1561213213, 0);
INSERT INTO `yzm_comment` VALUES (18, 4, 29, '这个商品很好', 1561271124, 0);
INSERT INTO `yzm_comment` VALUES (19, 4, 25, '这个商品很好', 1561275569, 0);
INSERT INTO `yzm_comment` VALUES (20, 4, 11, '这个商品很好', 1561275569, 0);
INSERT INTO `yzm_comment` VALUES (21, 4, 29, '这个商品很好玩', 1561293577, 0);
INSERT INTO `yzm_comment` VALUES (22, 4, 31, '这个商品质量很好', 1561293972, 0);

-- ----------------------------
-- Table structure for yzm_contact
-- ----------------------------
DROP TABLE IF EXISTS `yzm_contact`;
CREATE TABLE `yzm_contact`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_contact
-- ----------------------------
INSERT INTO `yzm_contact` VALUES (1, '小明', '太原', '110', '110@qq.com', 4, 0, 1);
INSERT INTO `yzm_contact` VALUES (5, '小黑', '火星', '110', '110@qq.com', 15, 0, 0);
INSERT INTO `yzm_contact` VALUES (6, '杀不得不爱思', '阿达', '18011112222', '123@163.com', 4, 0, 0);
INSERT INTO `yzm_contact` VALUES (7, '小杨过', '月球', '1119', '119@qq.com', 15, 0, 0);
INSERT INTO `yzm_contact` VALUES (8, '型买家', '太原', '18244445555', '123@178.com', 4, 0, 0);

-- ----------------------------
-- Table structure for yzm_order
-- ----------------------------
DROP TABLE IF EXISTS `yzm_order`;
CREATE TABLE `yzm_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_goods` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单商品',
  `affirm` tinyint(4) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL,
  `is_pay` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1：未付款，2：已付款',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '1：未发货，2：待收货，3：待评价，4：已完成，5：已取消',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_order
-- ----------------------------
INSERT INTO `yzm_order` VALUES (17, 'YZM15133202071766372492', 15, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"mobile\":110,\"email\":\"110@qq.com\"}', '[{\"shop_id\":9,\"name\":\"\\u8054\\u60f3-1\",\"sell_price\":\"200.00\",\"cate\":\"\\u82f9\\u679c\\u7535\\u8111\",\"num\":10,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"},{\"shop_id\":15,\"name\":\"\\u534e\\u4e3a-3\",\"sell_price\":\"3330.00\",\"cate\":\"\\u82f9\\u679c\\u624b\\u673a\",\"num\":11,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 0, 1513320207, 1, 2, 0);
INSERT INTO `yzm_order` VALUES (18, 'YZM1513320233517050082', 15, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"mobile\":110,\"email\":\"110@qq.com\"}', '[{\"shop_id\":9,\"name\":\"\\u8054\\u60f3-1\",\"sell_price\":\"200.00\",\"cate\":\"\\u82f9\\u679c\\u7535\\u8111\",\"num\":5,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 0, 1513320233, 1, 2, 0);
INSERT INTO `yzm_order` VALUES (19, 'YZM1513320444268885908', 15, '{\"name\":\"\\u5c0f\\u9ed1\",\"address\":\"\\u706b\\u661f\",\"mobile\":110,\"email\":\"110@qq.com\"}', '[{\"shop_id\":6,\"name\":\"DELL-2\",\"sell_price\":\"120.00\",\"cate\":\"\\u8054\\u60f3\\u624b\\u673a\",\"num\":5,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"},{\"shop_id\":13,\"name\":\"\\u534e\\u4e3a-1\",\"sell_price\":\"420.00\",\"cate\":\"\\u82f9\\u679c\\u624b\\u673a\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1513320444, 1, 3, 0);
INSERT INTO `yzm_order` VALUES (20, 'YZM1513320891667008864', 16, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"mobile\":110,\"email\":\"110@qq.com\"}', '[{\"shop_id\":6,\"name\":\"DELL-2\",\"sell_price\":\"120.00\",\"cate\":\"\\u8054\\u60f3\\u624b\\u673a\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1513320891, 1, 5, 0);
INSERT INTO `yzm_order` VALUES (21, 'YZM129509154715606813984', 4, '{\"name\":\"sadlf\",\"address\":\"alsfdj\",\"email\":\"aldsfj\",\"mobile\":0}', '[{\"shop_id\":31,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-3\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":\"1\",\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 0, 1560681398, 1, 1, 0);
INSERT INTO `yzm_order` VALUES (22, 'YZM205063585015606814274', 4, '{\"name\":\"sadlf\",\"address\":\"alsfdj\",\"email\":\"aldsfj\",\"mobile\":0}', '[{\"shop_id\":31,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-3\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":\"1\",\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 0, 1560681427, 1, 1, 0);
INSERT INTO `yzm_order` VALUES (23, 'YZM68460120415606815424', 4, '{\"name\":\"sadlf\",\"address\":\"alsfdj\",\"email\":\"aldsfj\",\"mobile\":0}', '[{\"shop_id\":31,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-3\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":\"1\",\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1560681542, 2, 5, 0);
INSERT INTO `yzm_order` VALUES (24, 'YZM209821949915606821484', 4, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"email\":\"110@qq.com\",\"mobile\":110}', '[{\"shop_id\":30,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-2\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"},{\"shop_id\":29,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":1,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1560682148, 1, 6, 0);
INSERT INTO `yzm_order` VALUES (25, 'YZM10053983815606826124', 4, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"email\":\"110@qq.com\",\"mobile\":110}', '[{\"shop_id\":30,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-2\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"},{\"shop_id\":29,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":1,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1560682612, 2, 5, 0);
INSERT INTO `yzm_order` VALUES (26, 'YZM184099467015611709304', 4, '{\"name\":\"\\u578b\\u4e70\\u5bb6\",\"address\":\"\\u592a\\u539f\",\"email\":\"123@178.com\",\"mobile\":\"18244445555\"}', '[{\"shop_id\":29,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":\"1\",\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 0, 1561170930, 1, 1, 0);
INSERT INTO `yzm_order` VALUES (27, 'YZM163984082915611719554', 4, '{\"name\":\"\\u578b\\u4e70\\u5bb6\",\"address\":\"\\u592a\\u539f\",\"email\":\"123@178.com\",\"mobile\":\"18244445555\"}', '[{\"shop_id\":30,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-2\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"},{\"shop_id\":29,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":1,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 0, 1561171955, 1, 1, 0);
INSERT INTO `yzm_order` VALUES (28, 'YZM210793116415611725274', 4, '{\"name\":\"\\u578b\\u4e70\\u5bb6\",\"address\":\"\\u592a\\u539f\",\"email\":\"123@178.com\",\"mobile\":\"18244445555\"}', '[{\"shop_id\":3,\"name\":\"\\u8054\\u60f3-1\",\"sell_price\":\"100.00\",\"cate\":\"\\u8054\\u60f3\\u7535\\u8111\",\"num\":\"1\",\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1561172527, 1, 6, 0);
INSERT INTO `yzm_order` VALUES (29, 'YZM104924032315612114584', 4, '{\"name\":\"\\u578b\\u4e70\\u5bb6\",\"address\":\"\\u592a\\u539f\",\"email\":\"123@178.com\",\"mobile\":\"18244445555\"}', '[{\"shop_id\":23,\"name\":\"\\u8054\\u60f3-2\",\"sell_price\":\"1500.00\",\"cate\":\"\\u8054\\u60f3\\u7535\\u8111\",\"num\":1,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190610\\\\15d30ba19264f13a7fcf3070fdd7c9ff.jpg\"},{\"shop_id\":34,\"name\":\"phone\\u8054\\u60f3\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u8054\\u60f3\\u624b\\u673a\",\"num\":1,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"},{\"shop_id\":29,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":2,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1561211458, 2, 5, 0);
INSERT INTO `yzm_order` VALUES (30, 'YZM22605347915612709624', 4, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"email\":\"110@qq.com\",\"mobile\":\"110\"}', '[{\"shop_id\":29,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1561270962, 2, 5, 0);
INSERT INTO `yzm_order` VALUES (31, 'YZM135304466215612732834', 4, '{\"name\":\"\\u578b\\u4e70\\u5bb6\",\"address\":\"\\u592a\\u539f\",\"email\":\"123@178.com\",\"mobile\":\"18244445555\"}', '[{\"shop_id\":24,\"name\":\"\\u8054\\u60f3-3\",\"sell_price\":\"1500.00\",\"cate\":\"\\u8054\\u60f3\\u7535\\u8111\",\"num\":2,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190610\\\\b87e5236514d0901d3348ed775c1f7fb.jpg\"},{\"shop_id\":10,\"name\":\"\\u82f9\\u679c-2\",\"sell_price\":\"150.00\",\"cate\":\"\\u82f9\\u679c\\u7535\\u8111\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1561273283, 1, 3, 0);
INSERT INTO `yzm_order` VALUES (32, 'YZM80680301815612741214', 4, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"email\":\"110@qq.com\",\"mobile\":\"110\"}', '[{\"shop_id\":32,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-4\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":2,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"},{\"shop_id\":6,\"name\":\"DELL-2\",\"sell_price\":\"120.00\",\"cate\":\"DELL\\u7535\\u8111\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190610\\/6409a829cbb2fffd84e0d2665ba90c0b.jpg\"}]', 0, 1561274121, 1, 2, 0);
INSERT INTO `yzm_order` VALUES (33, 'YZM194458873315612754864', 4, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"email\":\"110@qq.com\",\"mobile\":\"110\"}', '[{\"shop_id\":25,\"name\":\"\\u8054\\u60f3-4\",\"sell_price\":\"5222.00\",\"cate\":\"\\u8054\\u60f3\\u7535\\u8111\",\"num\":3,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190610\\\\6409a829cbb2fffd84e0d2665ba90c0b.jpg\"},{\"shop_id\":11,\"name\":\"\\u82f9\\u679c-3\",\"sell_price\":\"500.00\",\"cate\":\"\\u82f9\\u679c\\u7535\\u8111\",\"num\":2,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1561275486, 2, 5, 0);
INSERT INTO `yzm_order` VALUES (34, 'YZM159234732315612934874', 4, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"email\":\"110@qq.com\",\"mobile\":\"110\"}', '[{\"shop_id\":29,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-1\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":1,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1561293487, 2, 5, 0);
INSERT INTO `yzm_order` VALUES (35, 'YZM183406753615612938714', 4, '{\"name\":\"\\u5c0f\\u660e\",\"address\":\"\\u592a\\u539f\",\"email\":\"110@qq.com\",\"mobile\":\"110\"}', '[{\"shop_id\":31,\"name\":\"phone\\u534e\\u4e3a\\u624b\\u673a-3\",\"sell_price\":\"5000.00\",\"cate\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"num\":2,\"img\":\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"}]', 1, 1561293871, 2, 5, 0);

-- ----------------------------
-- Table structure for yzm_shop
-- ----------------------------
DROP TABLE IF EXISTS `yzm_shop`;
CREATE TABLE `yzm_shop`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` int(11) UNSIGNED NOT NULL,
  `shelf` tinyint(4) NOT NULL DEFAULT 0,
  `desc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `is_delete` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `sell_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `create_time` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_shop
-- ----------------------------
INSERT INTO `yzm_shop` VALUES (3, '联想-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 0, 1, '联想-1描述', 7, 0, 100.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (5, 'DELL-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL-1描述', 22, 0, 100.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (6, 'DELL-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190610\\/6409a829cbb2fffd84e0d2665ba90c0b.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\/55963afa4e16bfa65a47b18b18f33947.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190610\\/15d30ba19264f13a7fcf3070fdd7c9ff.jpg\"]', 1000, 1, 'DELL-2描述', 22, 0, 120.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (7, 'DELL-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL-3描述', 22, 0, 150.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (8, 'DELL-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL-4描述', 22, 0, 160.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (9, '苹果-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果-1描述', 9, 0, 200.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (10, '苹果-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果-2描述', 9, 0, 150.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (11, '苹果-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果-3电脑描述', 9, 0, 500.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (12, '苹果-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果-4描述', 9, 0, 922.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (13, '华为-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为-1描述', 11, 0, 420.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (14, '华为-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为-2描述', 11, 0, 855.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (15, '华为-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为-3描述', 11, 0, 3330.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (16, '华为-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为-4描述', 11, 0, 555.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (17, '三星-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星-1描述', 18, 0, 444.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (18, '三星-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星-2描述', 18, 0, 741.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (19, '三星-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星-3描述', 18, 0, 1234.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (20, '三星-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星-4描述', 18, 0, 555.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (21, '苹果-5', '[\"http:\\/\\/upload.myshop15.com\\/20190602\\\\55963afa4e16bfa65a47b18b18f33947.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\89501dea3524c71c7aada56bb07d4eee.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\d7f09697b947a19c910da895a5c6964b.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\f83856133f08c32c5dea0df4951112c2.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\4e3b0124c56e02c4fb69039db8e808f9.jpg\"]', 1000, 1, '苹果-5描述', 9, 0, 16000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (22, '华为-5', '[\"http:\\/\\/upload.myshop15.com\\/20190602\\\\2e52c2a5f75e038ecc3a210f0a51dcbd.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\aa5e0e1b6c8d06147afa0d0622a8d125.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\5e3c40efb2aeaaa82884fc79ef3a13eb.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\aa9e7a7ed25a7b382e9307d009eb0395.jpg\",\"http:\\/\\/upload.myshop15.com\\/20190602\\\\a865ffa2acb50d6506e4b29d26a114f7.jpg\"]', 1000, 1, '华为-5描述', 11, 0, 153.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (23, '联想-2', '[\"http:\\/\\/upload.myshop15.com\\/20190610\\\\15d30ba19264f13a7fcf3070fdd7c9ff.jpg\"]', 1000, 1, '联想-2描述', 7, 0, 1500.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (24, '联想-3', '[\"http:\\/\\/upload.myshop15.com\\/20190610\\\\b87e5236514d0901d3348ed775c1f7fb.jpg\"]', 1000, 1, '联想-3描述', 7, 0, 1500.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (25, '联想-4', '[\"http:\\/\\/upload.myshop15.com\\/20190610\\\\6409a829cbb2fffd84e0d2665ba90c0b.jpg\"]', 1000, 1, '联想-4描述', 7, 0, 5222.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (26, '联想-5', '[\"http:\\/\\/upload.myshop15.com\\/20190610\\\\5c2eb89745dfde77b745ad0b0c264854.jpg\"]', 1000, 1, '联想-5描述', 7, 0, 55522.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (27, '三星-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星-5描述', 18, 0, 555.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (28, 'DELL-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL-5描述', 22, 0, 160.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (29, 'phone华为手机-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone华为手机-1描述', 6, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (30, 'phone华为手机-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone华为手机-2描述', 6, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (31, 'phone华为手机-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone华为手机-3描述', 6, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (32, 'phone华为手机-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone华为手机-4描述', 6, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (33, 'phone华为手机-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone华为手机-5描述', 6, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (34, 'phone联想手机-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone联想手机-1描述', 8, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (35, 'phone联想手机-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone联想手机-2描述', 8, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (36, 'phone联想手机-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone联想手机-3描述', 8, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (37, 'phone联想手机-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone联想手机-4描述', 8, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (38, 'phone联想手机-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone联想手机-5描述', 8, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (39, 'phone苹果手机-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone苹果手机-1描述', 10, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (40, 'phone苹果手机-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone苹果手机-2描述', 10, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (41, 'phone苹果手机-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone苹果手机-3描述', 10, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (42, 'phone苹果手机-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone苹果手机-4描述', 10, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (43, 'phone苹果手机-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone苹果手机-5描述', 10, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (44, 'phone三星手机-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone三星手机-1描述', 20, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (45, 'phone三星手机-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone三星手机-2描述', 20, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (46, 'phone三星手机-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone三星手机-3描述', 20, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (47, 'phone三星手机-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone三星手机-4描述', 20, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (48, 'phone三星手机-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phone三星手机-5描述', 20, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (49, 'phoneDELL手机-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phoneDELL手机-1描述', 23, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (50, 'phoneDELL手机-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phoneDELL手机-2描述', 23, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (51, 'phoneDELL手机-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phoneDELL手机-3描述', 23, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (52, 'phoneDELL手机-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phoneDELL手机-4描述', 23, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (53, 'phoneDELL手机-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'phoneDELL手机-5描述', 23, 0, 5000.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (54, '华为手机配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为手机配件-1描述', 12, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (55, '华为手机配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为手机配件-2描述', 12, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (56, '华为手机配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为手机配件-3描述', 12, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (57, '华为手机配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为手机配件-4描述', 12, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (58, '华为手机配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为手机配件-5描述', 12, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (59, '联想手机配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想手机配件-1描述', 13, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (60, '联想手机配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想手机配件-2描述', 13, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (61, '联想手机配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想手机配件-3描述', 13, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (62, '联想手机配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想手机配件-4描述', 13, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (63, '联想手机配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想手机配件-5描述', 13, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (64, '联想电脑配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想电脑配件-1描述', 14, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (65, '联想电脑配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想电脑配件-2描述', 14, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (66, '联想电脑配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想电脑配件-3描述', 14, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (67, '联想电脑配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想电脑配件-4描述', 14, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (68, '联想电脑配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '联想电脑配件-5描述', 14, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (69, '苹果电脑配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果电脑配件-1描述', 15, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (70, '苹果电脑配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果电脑配件-2描述', 15, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (71, '苹果电脑配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果电脑配件-3描述', 15, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (72, '苹果电脑配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果电脑配件-4描述', 15, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (73, '苹果电脑配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果电脑配件-5描述', 15, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (74, '苹果手机配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果手机配件-1描述', 16, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (75, '苹果手机配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果手机配件-2描述', 16, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (76, '苹果手机配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果手机配件-3描述', 16, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (77, '苹果手机配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果手机配件-4描述', 16, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (78, '苹果手机配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '苹果手机配件-5描述', 16, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (79, '华为电脑配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为电脑配件-1描述', 17, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (80, '华为电脑配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为电脑配件-2描述', 17, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (81, '华为电脑配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为电脑配件-3描述', 17, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (82, '华为电脑配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为电脑配件-4描述', 17, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (83, '华为电脑配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '华为电脑配件-5描述', 17, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (84, '三星电脑配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星电脑配件-1描述', 19, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (85, '三星电脑配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星电脑配件-2描述', 19, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (86, '三星电脑配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星电脑配件-3描述', 19, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (87, '三星电脑配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星电脑配件-4描述', 19, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (88, '三星电脑配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星电脑配件-5描述', 19, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (89, '三星手机配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星手机配件-1描述', 21, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (90, '三星手机配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星手机配件-2描述', 21, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (91, '三星手机配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星手机配件-3描述', 21, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (92, '三星手机配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星手机配件-4描述', 21, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (93, '三星手机配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, '三星手机配件-5描述', 21, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (94, 'DELL手机配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL手机配件-1描述', 24, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (95, 'DELL手机配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL手机配件-2描述', 24, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (96, 'DELL手机配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL手机配件-3描述', 24, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (97, 'DELL手机配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL手机配件-4描述', 24, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (98, 'DELL手机配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL手机配件-5描述', 24, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (99, 'DELL电脑配件-1', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL电脑配件-1描述', 25, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (100, 'DELL电脑配件-2', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL电脑配件-2描述', 25, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (101, 'DELL电脑配件-3', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL电脑配件-3描述', 25, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (102, 'DELL电脑配件-4', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL电脑配件-4描述', 25, 0, 20.00, 1560175957);
INSERT INTO `yzm_shop` VALUES (103, 'DELL电脑配件-5', '[\"http:\\/\\/upload.myshop15.com\\/20190601\\/67df0acc2af91d54e43cc240cf474332.jpg\"]', 1000, 1, 'DELL电脑配件-5描述', 25, 0, 20.00, 1560175957);

-- ----------------------------
-- Table structure for yzm_system
-- ----------------------------
DROP TABLE IF EXISTS `yzm_system`;
CREATE TABLE `yzm_system`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站标题',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站标题logo',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站描述',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示状态   0：不显示 ，1：显示 ',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除 0：未删除，1：已删除',
  `create_time` int(11) UNSIGNED NOT NULL COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_system
-- ----------------------------
INSERT INTO `yzm_system` VALUES (1, '云知梦-只为有梦想的人', 'http://upload.myshop15.com/20190604\\656c9eb868212ac3fae5a150595bf06e.png', 'PHP、WEB前端、Linux、Python、Java、大数据、UI、人工智能、C语言、C#、C++、Android、Go、区块链、微信、小程序、APP、网络安全、软件测试、网络通讯、网络营销', '云知梦，一家专注于PHP、WEB前端、Linux、Python、Java、大数据、UI、人工智能、C语言、C#、C++、Android、Go、区块链、微信、小程序、APP、网络安全、软件测试、网络通讯、网络营销的全球知名线上教育平台！', 1, 0, 1559661863);
INSERT INTO `yzm_system` VALUES (2, '测试标题', 'http://upload.myshop15.com/20190604\\5aebd96ce7d07e134be9bd88fb8f698c.png', '测试关键字', '测试描述', 0, 0, 1559661863);

-- ----------------------------
-- Table structure for yzm_user
-- ----------------------------
DROP TABLE IF EXISTS `yzm_user`;
CREATE TABLE `yzm_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head_url` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `time` int(11) UNSIGNED NOT NULL,
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0：未删除，1：已删除',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态   1：启用， 2：禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzm_user
-- ----------------------------
INSERT INTO `yzm_user` VALUES (3, 'root', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 1, 1512613502, 0, 1);
INSERT INTO `yzm_user` VALUES (4, 'user1', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190620\\6b282f192cf2c72dbbe83807ac69ad43.jpg', 0, 1512616136, 0, 1);
INSERT INTO `yzm_user` VALUES (7, 'user2', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617625, 0, 1);
INSERT INTO `yzm_user` VALUES (8, 'user3', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617632, 0, 1);
INSERT INTO `yzm_user` VALUES (9, 'user4', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617638, 0, 1);
INSERT INTO `yzm_user` VALUES (10, 'user5', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617638, 0, 1);
INSERT INTO `yzm_user` VALUES (11, 'user6', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617638, 0, 1);
INSERT INTO `yzm_user` VALUES (12, 'user7', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617638, 0, 1);
INSERT INTO `yzm_user` VALUES (13, 'user8', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617638, 0, 2);
INSERT INTO `yzm_user` VALUES (15, 'user9', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 0, 1512617638, 0, 2);
INSERT INTO `yzm_user` VALUES (16, 'user11', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190601\\da2a35ff6eb111a3245f6e8451b79872.jpg', 1, 1512617638, 0, 1);
INSERT INTO `yzm_user` VALUES (17, 'user12', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190615\\b6e10136369d286b49bce675b14c6763.jpg', 0, 1560598169, 0, 2);
INSERT INTO `yzm_user` VALUES (19, 'user13', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190615\\b6e10136369d286b49bce675b14c6763.jpg', 0, 1560598375, 0, 1);
INSERT INTO `yzm_user` VALUES (20, 'user14', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190615\\926dddfd11490de1f7187d0b6e52a881.jpg', 0, 1560598557, 0, 2);
INSERT INTO `yzm_user` VALUES (21, 'qwe', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190615\\8640a8f1dd5f2817c6f9b33979844b58.jpg', 0, 1560601939, 0, 2);
INSERT INTO `yzm_user` VALUES (22, '18035759132', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190615\\43a9e970eb930ef9353131fc8f9afe61.jpg', 0, 1560610494, 0, 1);
INSERT INTO `yzm_user` VALUES (23, 'asdaad', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190627\\55fc6c92e8dbe0a5936c341c4f404c2f.jpg', 0, 1561648792, 1, 1);
INSERT INTO `yzm_user` VALUES (24, 'user101', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190627\\aa7787568ef9ca008e26b1ab127cc9e5.jpg', 0, 1561649074, 1, 1);
INSERT INTO `yzm_user` VALUES (25, 'user102', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190627\\1c1aaa4364a727aa4479284841afbb5d.jpg', 0, 1561649262, 1, 2);
INSERT INTO `yzm_user` VALUES (26, 'user103', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190627\\05d07b698f1f59eff7f7511b8f2c60d0.jpg', 0, 1561649711, 1, 1);
INSERT INTO `yzm_user` VALUES (27, 'user104', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190629\\2130da08a9022e0fd15a11fc5d3e762d.jpg', 0, 1561649722, 1, 1);
INSERT INTO `yzm_user` VALUES (28, 'user105', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190629\\8029d0c844a4a1e4e8af4304c614ccdb.jpg', 0, 1561649733, 1, 1);
INSERT INTO `yzm_user` VALUES (29, 'user106', 'e10adc3949ba59abbe56e057f20f883e', 'http://upload.myshop15.com/20190615/43a9e970eb930ef9353131fc8f9afe61.jpg', 1, 1561649744, 1, 1);
INSERT INTO `yzm_user` VALUES (30, 'user301', '202cb962ac59075b964b07152d234b70', 'http://upload.myshop15.com/20190629\\8b7d7fedc73558f986eb5b221ce34918.jpg', 0, 1561798459, 0, 1);
INSERT INTO `yzm_user` VALUES (31, 'user304', 'e10adc3949ba59abbe56e057f20f883e', 'http://upload.myshop15.com/20190629/8b7d7fedc73558f986eb5b221ce34918.jpg', 0, 1561800525, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
