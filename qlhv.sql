/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : qlhv

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 26/04/2023 14:34:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `account_code` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`account_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'tudinhle100@gmail.com', 'cacancap777', b'1');
INSERT INTO `account` VALUES (2, 'test@gmail.com', 'cacancap777', b'0');
INSERT INTO `account` VALUES (29, '1', '1', b'1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_code` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_duration` int NULL DEFAULT NULL,
  `course_fee` int NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `course_created_date` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`course_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Ruby On Rail', '', 2000, 3000, b'1', '2023-04-03 00:13:07');
INSERT INTO `course` VALUES (2, 'Java', 'Cấp chứng chỉ', 3000, 2, b'1', '2023-04-04 00:13:07');
INSERT INTO `course` VALUES (3, 'Vue Js cơ bản', 'Hỗ trợ xin việc', 1800, 2000, b'1', '2023-04-19 00:13:07');
INSERT INTO `course` VALUES (4, 'Ruby on Rail Nâng cao', 'khó học', 24000, 4, b'1', '2023-04-28 00:13:07');
INSERT INTO `course` VALUES (6, 'Git/Git lab cơ bản', 'miễn phí khi mua 1 khóa bất kì', 45, NULL, b'0', '2023-04-15 00:13:07');
INSERT INTO `course` VALUES (7, 'Cấu trúc dữ liệu giải thuật', 'khó học', 2000, 100, b'0', '2023-04-10 00:13:07');
INSERT INTO `course` VALUES (51, 'Html,css cơ bản', 'dành cho người mới', 5000, 50, b'1', '2023-04-26 00:13:07');
INSERT INTO `course` VALUES (52, 'Next js cơ bản', '', 3000, 100, b'1', '2023-04-02 00:13:07');
INSERT INTO `course` VALUES (55, 'PHP', '', 30, 200, b'1', '2023-04-17 10:11:06');
INSERT INTO `course` VALUES (56, 'Python', '', 120, 500, b'1', '2023-04-17 10:11:57');
INSERT INTO `course` VALUES (57, 'SQL', '', 12000, 57, b'1', '2023-04-17 10:12:28');
INSERT INTO `course` VALUES (58, 'Javascript', '', 1800, 2000, b'1', '2023-04-17 10:13:17');
INSERT INTO `course` VALUES (59, 'Boostrap', '', 18000, 5000, b'1', '2023-04-17 10:15:09');
INSERT INTO `course` VALUES (60, 'ko co sinh vien', '', 1000, 2000, b'1', '2023-04-24 12:21:37');

-- ----------------------------
-- Table structure for enrollment
-- ----------------------------
DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE `enrollment`  (
  `enrollment_code` int NOT NULL,
  `student_code` int NOT NULL,
  `course_code` int NOT NULL,
  `enrollment_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`enrollment_code`) USING BTREE,
  INDEX `student_code`(`student_code` ASC) USING BTREE,
  INDEX `course_code`(`course_code` ASC) USING BTREE,
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_code`) REFERENCES `student` (`student_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enrollment
-- ----------------------------
INSERT INTO `enrollment` VALUES (1, 292, 3, '2023-04-18');
INSERT INTO `enrollment` VALUES (2, 302, 3, '2023-04-02');
INSERT INTO `enrollment` VALUES (3, 838, 6, '2023-04-20');
INSERT INTO `enrollment` VALUES (4, 1393, 7, '2023-04-19');
INSERT INTO `enrollment` VALUES (5, 2929, 52, '2023-04-18');
INSERT INTO `enrollment` VALUES (6, 439, 7, '2023-04-19');
INSERT INTO `enrollment` VALUES (7, 439, 4, '2023-04-19');
INSERT INTO `enrollment` VALUES (8, 2929, 4, '2023-04-20');
INSERT INTO `enrollment` VALUES (9, 2929, 57, '2023-04-20');
INSERT INTO `enrollment` VALUES (10, 1393, 58, '2023-04-11');
INSERT INTO `enrollment` VALUES (11, 939, 52, '2023-04-20');
INSERT INTO `enrollment` VALUES (12, 939, 6, '2023-04-20');
INSERT INTO `enrollment` VALUES (13, 939, 57, '2023-04-12');
INSERT INTO `enrollment` VALUES (14, 3022, 57, '2023-04-03');
INSERT INTO `enrollment` VALUES (15, 100000004, 59, '2023-04-04');
INSERT INTO `enrollment` VALUES (16, 439, 6, '2023-04-02');
INSERT INTO `enrollment` VALUES (17, 1393, 52, '2023-04-02');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_code` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `phone_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `sex` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`student_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000011 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (292, 'Nguyên Lệ Chi', '2023-04-05', '+84292939393', '', b'1', b'0');
INSERT INTO `student` VALUES (302, 'Vũ Văn Cườngg', '2023-03-01', '+84029299233', '', b'0', b'1');
INSERT INTO `student` VALUES (439, 'Lưu Huy Hiếu', '2003-02-24', '+84304982920', '', b'1', b'0');
INSERT INTO `student` VALUES (838, 'Hoàng Hồ Gia Khánh', '2023-03-14', '+84020020222', '', b'1', b'1');
INSERT INTO `student` VALUES (939, 'Vũ Trọng Hoàng', '2023-04-12', '+84292929292', '', b'1', b'1');
INSERT INTO `student` VALUES (1393, 'Nguyễn Trà My', '2023-04-05', '+84292939393', '', b'1', b'1');
INSERT INTO `student` VALUES (2929, 'phạm phương nam', '2023-04-04', '+8492929299', 'test@gmail.com', b'1', b'1');
INSERT INTO `student` VALUES (3022, 'Phạm Quang Núi', '2003-03-14', '+84029299292', '', b'1', b'0');
INSERT INTO `student` VALUES (3029, 'Vũ Phúc Văn', '2023-03-01', '+84029299233', '', b'1', b'1');
INSERT INTO `student` VALUES (3930, 'Mực Kho Tàu', '2003-10-01', '+84302929942', '', b'1', b'1');
INSERT INTO `student` VALUES (9292, 'Hoàng Huy Hiếu', '2023-04-05', '+84828299222', '', b'0', b'1');
INSERT INTO `student` VALUES (29298, 'Hoàng Liên', '2023-03-01', '+84029299233', '', b'1', b'1');
INSERT INTO `student` VALUES (30300, 'Thanh Trà', '2023-03-14', '+84029299299', '', b'1', b'0');
INSERT INTO `student` VALUES (30302, 'Phạm Huy Hoàng', '2003-03-14', '+84020202029', '', b'1', b'1');
INSERT INTO `student` VALUES (393303, 'Lê Đình Tú', '2003-12-21', '+84030929202', '', b'1', b'1');
INSERT INTO `student` VALUES (100000001, 'test 1', '2023-04-06', '+840209292', 'test@gmai.com', b'1', b'0');
INSERT INTO `student` VALUES (100000002, 'Nguyễn Thị Thương', '2003-04-18', '0343310165', 'annhi18042@gmail.com', b'1', b'0');
INSERT INTO `student` VALUES (100000003, 'Phan Thị Thưởng', '2003-07-16', '0358278192', 'phanthuong@gmail.com\n', b'1', b'0');
INSERT INTO `student` VALUES (100000004, 'Nguyễn Như Thương', '2006-09-17', '0367287293', 'nhuthuong@gmail.com\n', b'1', b'0');
INSERT INTO `student` VALUES (100000005, 'Nguyễn Thị Hồng', '2003-01-10', '0313310657', 'nguyenhong@gmail.com', b'1', b'0');
INSERT INTO `student` VALUES (100000006, 'test 2', '2023-04-13', '0234213241', 'test2@gmail.com', b'1', b'0');

SET FOREIGN_KEY_CHECKS = 1;
