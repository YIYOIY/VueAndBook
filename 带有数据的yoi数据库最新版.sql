-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yoi
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_admin`
--
create database yoi;
use yoi;
DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_admin`
(
    `admin_id`       int                                                          NOT NULL AUTO_INCREMENT,
    `admin_name`     varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL,
    `admin_password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT (111111),
    PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK
TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` (`admin_id`, `admin_name`, `admin_password`)
VALUES (1, '1', '1'),
       (2, '测试一', '1');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `t_book`
--

DROP TABLE IF EXISTS `t_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_book`
(
    `book_id`      int                                                          NOT NULL AUTO_INCREMENT,
    `book_name`    varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `book_info`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `book_author`  varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL,
    `book_factory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL,
    `book_addDate` date                                                          DEFAULT (curdate()),
    `book_price`   decimal(6, 2)                                                 DEFAULT '100.00',
    `book_num`     double                                                        DEFAULT '100',
    `book_picture` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `book_detail`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
    `series_id`    int                                                           DEFAULT NULL,
    PRIMARY KEY (`book_id`) USING BTREE,
    KEY            `series_id` (`series_id`) USING BTREE,
    CONSTRAINT `t_book_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `t_category` (`series_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_book`
--

LOCK
TABLES `t_book` WRITE;
/*!40000 ALTER TABLE `t_book` DISABLE KEYS */;
INSERT INTO `t_book` (`book_id`, `book_name`, `book_info`, `book_author`, `book_factory`, `book_addDate`, `book_price`,
                      `book_num`, `book_picture`, `book_detail`, `series_id`)
VALUES (1, '讲故事的人', '2012年诺贝尔文学奖得主莫言演讲全编（共三册）', '汉娜', '出版社', '2023-06-09', 100.00, 100,
        'api/讲故事的人.jpg',
        '当当云阅读  > 文艺  > 小说  > 中国近当代小说  > 讲故事的人\r\n讲故事的人\r\n收藏\r\n | \r\n分享 |  手机阅读\r\n讲故事的人电子书\r\n2012年诺贝尔文学奖得主莫言演讲全编（共三册）；全新编校、修订、整理和编选；完整呈现莫言自创作之初至今的公演讲；是经过莫言认可的“定稿版”，也是他的演讲作品首次大规模全面的整理编选。 本书收录莫言自1999年至2018年的文学演讲33篇，包括2012年他在斯德哥尔摩领受诺贝尔文学奖期间的受奖演说、诺贝尔奖晚宴上的致辞、瑞典笔会上的演讲等等；以及莫言荣获第八届茅盾文学奖的获奖感言；\r\n\r\n售       价：¥23.99\r\n\r\n纸质售价：¥24.50购买纸书\r\n\r\n4561人正在读 | 0人评论      6.6\r\n促       销：N件折满2件5折详情>\r\n\r\n作       者：莫言\r\n\r\n出  版  社：浙江文艺出版社\r\n\r\n出版时间：2019-04-01\r\n\r\n字       数：19.8万\r\n\r\n所属分类： 文艺 > 小说 > 中国近当代小说\r\n\r\n加入购物车试读\r\n温馨提示：数字商品不支持退换货，不提供源文件，不支持导出打印\r\n\r\n为你推荐\r\n\r\n潮湿不难\r\n潮湿不难\r\n\r\n￥2.90\r\n\r\n人生海海(敢死不是勇气，活着才需要勇气。你要替我记住这句话！让你好看到失眠！茅奖得主麦家全新之作！莫言盛赞“迷人”)\r\n人生海海(敢死不是勇气，活着才需要勇气。你要替我记住这句话！让你好看到失眠！茅奖得主麦家全新之作！莫言盛赞“迷人”)\r\n\r\n￥21.99\r\n\r\n俗世奇人全本\r\n俗世奇人全本\r\n\r\n￥14.99\r\n\r\n长恨歌\r\n长恨歌\r\n\r\n￥18.81\r\n\r\n书生行\r\n书生行\r\n\r\n￥53.00\r\n\r\n透视中国富豪-24位当今知名企业家的发家史和家庭纠葛\r\n透视中国富豪-24位当今知名企业家的发家史和家庭纠葛\r\n\r\n￥3.99\r\n\r\n真知\r\n真知\r\n\r\n￥0.01\r\n\r\n晚熟的人\r\n晚熟的人\r\n\r\n￥36.00\r\n\r\n潮湿不难\r\n潮湿不难\r\n\r\n￥2.90\r\n\r\n人生海海(敢死不是勇气，活着才需要勇气。你要替我记住这句话！让你好看到失眠！茅奖得主麦家全新之作！莫言盛赞“迷人”)\r\n人生海海(敢死不是勇气，活着才需要勇气。你要替我记住这句话！让你好看到失眠！茅奖得主麦家全新之作！莫言盛赞“迷人”)\r\n\r\n￥21.99\r\n\r\n俗世奇人全本\r\n俗世奇人全本\r\n\r\n￥14.99\r\n\r\n长恨歌\r\n长恨歌\r\n\r\n￥18.81\r\n\r\n书生行\r\n书生行\r\n\r\n￥53.00\r\n\r\n透视中国富豪-24位当今知名企业家的发家史和家庭纠葛\r\n透视中国富豪-24位当今知名企业家的发家史和家庭纠葛\r\n\r\n￥3.99\r\n\r\n真知\r\n真知\r\n\r\n￥0.01\r\n\r\n晚熟的人\r\n晚熟的人\r\n\r\n￥36.00\r\n\r\n读书简介目录累计评论(1条)\r\n本书为莫言演讲集之一，收录莫言自1999年至2018年的文学演讲33篇，包括2012年他在斯德哥尔摩领受诺贝尔文学奖期间的受奖演说。这些演讲生动幽默、充满智慧，集中展示了莫言的人生经历、创作道路、文学观念，以及他的多数重要作品——如《丰乳肥臀》《檀香刑》《四十一炮》《生死疲劳》《蛙》等长篇小说的创作缘起和所要表达的思想等。',
        1),
       (2, '晚熟的人', '本书收录了诺贝尔文学奖得主莫言全新创作的中短篇小说12篇，都是莫言说给大家的“新故事”', '莫言著',
        '人民文学出版社', '2023-06-09', 100.00, 100, 'api/晚熟的人.jpg',
        '12个故事篇幅紧凑，却各有曲直，新鲜的、骁勇的、星罗棋布的叙述里塑造了一系列“应时而变”的人物，他们像是从我们身边走出来的人，健步如飞，从小说的这头一直奔跑到小说的那一头，从红高粱的历史来到红唇绿嘴的当下。阅读莫言总是刺激的，他的小说世界立体而完整，蕞终的结果总让我们大惊失色。【推荐语】<br/>.<br/>【作者】<br/>莫言，山东高密人，2012年诺贝尔文学奖得主，是中国首位获此殊荣的作家。',
        1),
       (3, '生命的礼物:关于爱、死亡及存在的意义', '我们都曾经、正在或将要面临衰老、疾病、死亡和哀伤，我们该如何面对？',
        '玛丽莲?亚隆(Marilyn Yalom)', '机械工业出版社', '2023-06-09', 100.00, 100,
        'api/生命的礼物关于爱与死亡及存在的意义.jpg',
        '我们都曾经、正在或将要面临所爱之人的患病离世。 当鹣鲽情深、相濡以沫的伴侣突患癌症，该如何面对，如何劝慰？ 当生命渐逝，注定无法阻止，该如何了无遗憾地告别，好好陪伴爱人后的时光？ 当永失吾爱，生活灰暗绝望，该如何坦然面对孤独，疗愈哀伤？   本书是心理学大师亚隆夫妇献给对方的后礼物，它是对爱人后的告白，更是一场振聋发聩又温柔万分的死亡教育，充满了对芸芸众生的拳拳关怀，以真挚的记录和觉察，揭示生命、死亡、爱与存在的意义，为同在受苦的人们带来一丝抚慰。   欧文•亚隆： “在写这本书的时候，我们正处于大多数同时代人都已经过世的年龄。我们现在每天都知道，我们在一起的时间是有限的，极其宝贵。 ',
        1),
       (4, '我想偶尔停一会儿', '青年作家，小红书热门插画博主（小红书ID：@画画的麦茬）由宾的绘本故事集《我想偶尔停一会儿》。',
        '由宾', '湖南文艺出版社', '2023-06-09', 100.00, 100, 'api/我想偶尔停一会儿.jpg',
        '《我想偶尔停一会儿》是一部治愈系绘本故事集，作者由宾用画笔记录了很多日常的故事和生活的细节。 这本书让我们看到了很多城市青年的缩影，他从一个刚走出校园的穷小子慢慢化成职场精英，然后成为数万网友追捧的绘本作家；他身边有温暖的父母、仗义的老友、幽默的同事，以及，粘人的猫咪；他偶尔摆烂，偶尔精致生活，他经历过失恋的痛苦，也懂得了如何向风中告别…… 这些生活里看似平凡不过的故事和经历，却是我们每一个人在努力生活的证明。由宾用他的画笔记录着属于我们每一个人的日常，酸甜苦辣尽在其中，让大家都能在作品中看到自己。 作者说：“这本书里，画的都是一些日常琐碎的记录。我很珍惜这些灵感碎片，并很庆幸自己把它们捕捉到了。” 如果你在生活的路上跑累了，不妨偶尔停一会儿，或者画一画，这是由宾积蓄能量的新方式，也是他正在享受的生活的闲暇。这样的日常，同时属于你和我。<br/>【推荐语】<br/>青年作家，小红书热门插画博主（小红书ID：@画画的麦茬）由宾的绘本故事集《我想偶尔停一会儿》。画风简洁可爱，故事充满巧思，细致勾勒出生活里微小如流星般的感动。   全书从五个维度：一个人的生活、猫咪毛豆、家人和朋友、吃喝玩乐及胡思乱想，全方位为我们展示了一个城市青年的缩影。他曾是穷小子也是职场精英；他拥有过家人朋友带来的温暖，也品尝了失恋的苦涩；他偶尔摆烂，也偶尔精致生活……这本书画出了我们每一个人。   生活里看似平凡不过的故事和经历，却是我们每一个人在努力生活的证明。',
        1),
       (5, '追求精确',
        '《追求精确》浓缩250年来精/密制造的科学发展历程，带领读者见证公差是怎么从1 缩小到 0.000 000 000 000 000',
        '[英]西蒙·温切斯特', '中国财政经济出版社', '2023-06-09', 100.00, 100, 'api/追求精确.jpg',
        '当当云阅读  > 经管/励志  > 经济  > 经济通俗读物  > 追求精确\r\n追求精确\r\n收藏\r\n | \r\n分享 |  手机阅读\r\n追求精确电子书\r\n《追求精确》浓缩250年来精/密制造的科学发展历程，带领读者见证公差是怎么从1 缩小到 0.000 000 000 000 000 000 000 000 000 000 000 01（几近为零）。同时，这也是一部对完/美主义者的颂歌，正是对精/确不断追求的他们，塑造了现代世界。 西蒙·温切斯特深研究了精/密制造250年跌宕起伏的发展历程，掀起了一场对精/密制造改变世界大问题的深刻探讨：完/美从时间中诞生，现代世界从精/确中涌现。\r\n\r\n售       价：¥88.14\r\n\r\n纸质售价：¥104.90购买纸书\r\n\r\n392人正在读 | 0人评论      6.6\r\n促       销：N件折满2件5折详情>\r\n\r\n作       者：[英]西蒙·温切斯特\r\n\r\n出  版  社：中国财政经济出版社\r\n\r\n出版时间：2023-05-01\r\n\r\n字       数：24.7万\r\n\r\n所属分类： 经管/励志 > 经济 > 经济通俗读物\r\n\r\n加入购物车试读\r\n温馨提示：数字商品不支持退换货，不提供源文件，不支持导出打印\r\n\r\n为你推荐\r\n\r\n大国锁钥:国产替代浪潮\r\n大国锁钥:国产替代浪潮\r\n\r\n￥55.00\r\n\r\n经济学是个什么玩意\r\n经济学是个什么玩意\r\n\r\n￥18.85\r\n\r\n经济学原来这么有趣Ⅱ：让你豁然开朗的18堂经济学公开课\r\n经济学原来这么有趣Ⅱ：让你豁然开朗的18堂经济学公开课\r\n\r\n￥15.70\r\n\r\n经济学就这么有趣\r\n经济学就这么有趣\r\n\r\n￥12.99\r\n\r\n未来社会趋势系列(套装共5册)\r\n未来社会趋势系列(套装共5册)\r\n\r\n￥199.00\r\n\r\n经济学真有趣:机会原来就在你面前\r\n经济学真有趣:机会原来就在你面前\r\n\r\n￥33.00\r\n\r\n小白经济学(一本有趣的经济学常识,零基础入门一看就懂,冯仑推荐)\r\n小白经济学(一本有趣的经济学常识,零基础入门一看就懂,冯仑推荐)\r\n\r\n￥12.90\r\n\r\n一本书读懂ChatGPT\r\n一本书读懂ChatGPT\r\n\r\n￥19.99\r\n\r\n大国锁钥:国产替代浪潮\r\n大国锁钥:国产替代浪潮\r\n\r\n￥55.00\r\n\r\n经济学是个什么玩意\r\n经济学是个什么玩意\r\n\r\n￥18.85\r\n\r\n经济学原来这么有趣Ⅱ：让你豁然开朗的18堂经济学公开课\r\n经济学原来这么有趣Ⅱ：让你豁然开朗的18堂经济学公开课\r\n\r\n￥15.70\r\n\r\n经济学就这么有趣\r\n经济学就这么有趣\r\n\r\n￥12.99\r\n\r\n未来社会趋势系列(套装共5册)\r\n未来社会趋势系列(套装共5册)\r\n\r\n￥199.00\r\n\r\n经济学真有趣:机会原来就在你面前\r\n经济学真有趣:机会原来就在你面前\r\n\r\n￥33.00\r\n\r\n小白经济学(一本有趣的经济学常识,零基础入门一看就懂,冯仑推荐)\r\n小白经济学(一本有趣的经济学常识,零基础入门一看就懂,冯仑推荐)\r\n\r\n￥12.90\r\n\r\n一本书读懂ChatGPT\r\n一本书读懂ChatGPT\r\n\r\n￥19.99\r\n\r\n读书简介目录累计评论(0条)\r\n精/确，不仅从源头上“定义”了现代世界，更一步步“塑造”了现代世界。诸如今日火热的智能制造，便是由我们对精/确的不断追求所构建起来的。《追求精确》是一部 250 年精/密制造的沧桑巨变史，一部恢宏的机械交响史和一首激荡人心的智能制造交响曲，是关于人类不断逼近精/确JI限的创造史、创新史。 精/确是一切的关键。它是现代社会不可或缺的重要组成部分。日常生活中对我们而言非常重要的物品，例如手机、相机、电脑、自行车、汽车等，里面的零件都需要相互匹配，才有可能完/美运转。然而，尽管我们的生活充满了精/确，但我们往往忽视了精/确的存在。关于精/确度的思考是历史上一个伟大的转折，如果没有对精/确的重视，制造业的崛起就不可能发生。 作者西蒙·温切斯特带领读者回到工业时代的起源，以前/所未有的广度和深度、独到的视野，穿越250年的历史，从英国北威尔士的铸造厂到曼彻斯特的工厂，再到美国迪尔伯恩的汽车生产线，以及美国的实验室，追溯了从工业时代到数字时代的技术发展历程。温切斯特通过讲述精/密制造先驱的故事：“铁疯子”约翰·威尔金森、亨利·莫兹利、约瑟夫·布拉马、杰西·拉姆斯登和约瑟夫·惠特沃思等，带读者见证公差是怎么一步步缩小为零的。',
        3),
       (6, '中国古代异闻录2',
        '1.颠覆性、趣味性、知识性并重。历史、案卷、民间文学整合统一，在历史中寻找真相。 2.360度全方位解析历史。', '呼延云',
        '浙江人民出版社有限公司', '2023-06-09', 100.00, 99, 'api/中国古代异闻录2.jpg',
        '当当云阅读  > 人文社科  > 历史  > 历史普及读物  > 中国古代异闻录2\r\n中国古代异闻录2\r\n收藏\r\n | \r\n分享 |  手机阅读\r\n中国古代异闻录2电子书\r\n1.颠覆性、趣味性、知识性并重。历史、案卷、民间文学整合统一，在历史中寻找真相。 2.360度全方位解析历史。糅合史学、考古学以及法学等多元学科视角，运用诸多刑侦手法，大胆推测、小心求证，力图为读者还原历史真相。 3.《北京晚报》、澎湃网读书频道授权推荐。内容丰富有趣，网络粉丝众多。 4.本书部分章节已在首都图书馆、西城图书馆、三联书店做过讲座。\r\n\r\n售       价：¥39.99\r\n\r\n纸质售价：¥55.60购买纸书\r\n\r\n1023人正在读 | 0人评论      6.6\r\n促       销：N件折满2件5折详情>\r\n\r\n作       者：呼延云\r\n\r\n出  版  社：浙江人民出版社有限公司\r\n\r\n出版时间：2023-04-01\r\n\r\n字       数：12.3万\r\n\r\n所属分类： 人文社科 > 历史 > 历史普及读物\r\n\r\n加入购物车试读\r\n温馨提示：数字商品不支持退换货，不提供源文件，不支持导出打印\r\n\r\n为你推荐\r\n\r\n明朝那些事儿(增补版)(套装共9册)\r\n明朝那些事儿(增补版)(套装共9册)\r\n\r\n￥24.99\r\n\r\n中国历史百科丛书(套装共15册)\r\n中国历史百科丛书(套装共15册)\r\n\r\n￥6.99\r\n\r\n从大都到上都:在古道上重新发现中国\r\n从大都到上都:在古道上重新发现中国\r\n\r\n￥41.40\r\n\r\n知行合一王阳明大合集（1+2+3+传习录）\r\n知行合一王阳明大合集（1+2+3+传习录）\r\n\r\n￥21.66\r\n\r\n年轻人不可不知的108件世界大事\r\n年轻人不可不知的108件世界大事\r\n\r\n￥0.49\r\n\r\n十三堂史记通识课\r\n十三堂史记通识课\r\n\r\n￥19.90\r\n\r\n神奇的北魏\r\n神奇的北魏\r\n\r\n￥19.90\r\n\r\n话说世界丛书(二)(套装共15册)\r\n话说世界丛书(二)(套装共15册)\r\n\r\n￥4.99\r\n\r\n明朝那些事儿(增补版)(套装共9册)\r\n明朝那些事儿(增补版)(套装共9册)\r\n\r\n￥24.99\r\n\r\n中国历史百科丛书(套装共15册)\r\n中国历史百科丛书(套装共15册)\r\n\r\n￥6.99\r\n\r\n从大都到上都:在古道上重新发现中国\r\n从大都到上都:在古道上重新发现中国\r\n\r\n￥41.40\r\n\r\n知行合一王阳明大合集（1+2+3+传习录）\r\n知行合一王阳明大合集（1+2+3+传习录）\r\n\r\n￥21.66\r\n\r\n年轻人不可不知的108件世界大事\r\n年轻人不可不知的108件世界大事\r\n\r\n￥0.49\r\n\r\n十三堂史记通识课\r\n十三堂史记通识课\r\n\r\n￥19.90\r\n\r\n神奇的北魏\r\n神奇的北魏\r\n\r\n￥19.90\r\n\r\n话说世界丛书(二)(套装共15册)\r\n话说世界丛书(二)(套装共15册)\r\n\r\n￥4.99\r\n\r\n读书简介目录累计评论(0条)\r\n虽然真相只有一个，故事却有多重说法！ 本书作者呼延云于历史档案馆查考历史档案并结合1000多部明清名人笔记，将许多载于史册的历史谜案重新演绎，抽丝剥茧，利用现代刑侦手段，重新将历史事实摆在人们面前。<br/>【推荐语】<br/>1.颠覆性、趣味性、知识性并重。历史、案卷、民间文学整合统一，在历史中寻找真相。',
        3),
       (7, '胜算', '《胜算》是百万销量作者、知名商业顾问刘润，写给每一个迷茫前行的人实用方法论。', '刘润',
        '民主与建设出版公司', '2023-06-09', 100.00, 100, 'api/胜算.jpg',
        '人生是一系列决策的过程，不同的人生算法，会导致全然不同的选择。理解万物运转的规律，你才会做出正确的选择，用概率思维提高人生胜算。本书包含六大阶步骤，帮你逐步建立个人成事框架，117个思维模型，搭建认知系统。小成靠努力，大成靠趋势。每一个人都应该找到可成事的能力内核，不断复制，四散花，像细胞分裂一样，实现从0到1，从1到N。让幸运变成你的能力，搭建一套属于自己的商业模式。<br/>【推荐语】<br/>◆ 中国知名商业顾问刘润，帮你找到可复制的能力内核，搭建一套属于自己的人生算法 中国著名商业顾问刘润为你准备的一整套人生化框架，层层递，六大阶步骤：定准方向、找对方法、做好决策、思维化、管理智慧、商业逻辑，助你启动“挂人生。 ◆ 成功可以不靠运气，让运气变成能力！天不帮你，概率也会帮你！ 运气的本质是概率，运气（概率）>选择>努力。每个人都应该拥有概率思维，做对决策，让人生胜算从 5% 提高到 95%。用概率赢得自己的人生，是当今信息爆炸时代必须掌握的思考能力。 ◆ 117个思维模型，助你构建认知体系，找到自己的旋转飞轮 （1）变量、因果、增强回路、调节回路、滞后效应 （2）一维思考、二维思考、三维思考、四维思考、五维思考 （3）PDCA法则、波特定律、MECE法则、平衡计分卡 人生是一系列的决策过程， 只做对一道题没有用， 要有能力去应对人生一系列的复杂难题。一次完美，换不回人生的成功。 次次完成，才有机会迎来人生的圆满。',
        3),
       (8, '活着', '松下幸之助的生命志向', '(日)佐藤悌二郎', '机械工业出版社', '2023-06-09', 100.00, 100,
        'api/活着.jpg',
        '当当云阅读  > 经管/励志  > 管理  > 会计/金融投资  > 活着:松下幸之助的生命志向\r\n活着:松下幸之助的生命志向\r\n收藏\r\n | \r\n分享 |  手机阅读\r\n活着:松下幸之助的生命志向电子书\r\n抢购¥15.99仅剩97:59:00\r\n纸质售价：¥44.20购买纸书\r\n\r\n2062人正在读 | 0人评论      6.6\r\n作       者：(日)佐藤悌二郎\r\n\r\n出  版  社：机械工业出版社\r\n\r\n出版时间：2022-11-01\r\n\r\n字       数：7.7万\r\n\r\n所属分类： 经管/励志 > 管理 > 会计/金融投资\r\n\r\n加入购物车试读\r\n温馨提示：数字商品不支持退换货，不提供源文件，不支持导出打印\r\n\r\n为你推荐\r\n\r\n巴菲特与索罗斯的投资习惯\r\n巴菲特与索罗斯的投资习惯\r\n\r\n￥13.99\r\n\r\n约翰·邓普顿投资精要\r\n约翰·邓普顿投资精要\r\n\r\n￥29.40\r\n\r\n纳瓦尔宝典\r\n纳瓦尔宝典\r\n\r\n￥47.60\r\n\r\n避风港\r\n避风港\r\n\r\n￥19.99\r\n\r\n商业的本质和互联网 第2版\r\n商业的本质和互联网 第2版\r\n\r\n￥23.99\r\n\r\n进化的力量2:寻找不确定性中的确定性\r\n进化的力量2:寻找不确定性中的确定性\r\n\r\n￥44.85\r\n\r\n价值\r\n价值\r\n\r\n￥13.90\r\n\r\n查理·芒格投资精要\r\n查理·芒格投资精要\r\n\r\n￥29.40\r\n\r\n巴菲特与索罗斯的投资习惯\r\n巴菲特与索罗斯的投资习惯\r\n\r\n￥13.99\r\n\r\n约翰·邓普顿投资精要\r\n约翰·邓普顿投资精要\r\n\r\n￥29.40\r\n\r\n纳瓦尔宝典\r\n纳瓦尔宝典\r\n\r\n￥47.60\r\n\r\n避风港\r\n避风港\r\n\r\n￥19.99\r\n\r\n商业的本质和互联网 第2版\r\n商业的本质和互联网 第2版\r\n\r\n￥23.99\r\n\r\n进化的力量2:寻找不确定性中的确定性\r\n进化的力量2:寻找不确定性中的确定性\r\n\r\n￥44.85\r\n\r\n价值\r\n价值\r\n\r\n￥13.90\r\n\r\n查理·芒格投资精要\r\n查理·芒格投资精要\r\n\r\n￥29.40\r\n\r\n读书简介目录累计评论(0条)\r\n松下幸之助被人们称为“经营之神”。本书通过具体事例来说明他的生活方式和想法，也就是“松下哲学”产生后并得到升华的过程。 “松下幸之助走过的路与学习心得”刊登在月刊杂志PHP中的2007年1月刊至2015年12月刊中，在此期间连载并好评不断，本书从中严格挑选了77个故事。本书介绍了松下刚始创业到他逝世期间令人印象深刻的人生和经营故事，另外除了介绍当时的背景，还对他的一系列事迹行了分析。不仅能让读者感受到松下的拼搏精神，也是大多数即将成为领导者的行为指南。',
        3),
       (9, '底层逻辑', '“底层逻辑”来源于不同中的相同，变化背后的不变。', '刘润', '机械工业出版社', '2023-06-09', 100.00,
        100, 'api/底层逻辑.jpg',
        '只有掌握了底层逻辑，只有探寻到万变中的不变，才能动态地、持续地看清事物的本质。 在本书中，中国著名商业顾问刘润把在《5分钟商学院》中讲述的底层逻辑的内容做了总结，与你分享是非对错、思考问题、个体化、理解他人和社会协作五个方面的底层逻辑，带你看清这个世界的底牌。 “底层逻辑”并不局限于商业世界。希望你在看到千变万化的世界后，依然能心态平静、不焦虑，能够通过“底层逻辑＋环境变量”不断创造新的方法论，在工作和生活中都始终如鱼得水。<br/>【推荐语】<br/>★中国著名商业顾问刘润为你准备的一整套思维框架，助你启动“挂人生”。 ★刘润，以敏锐的洞察力和批判性思维著称的商业顾问。 创立“5分钟商学院”，5年拥有50万学员。 设“刘润”公众号，5年拥有190万读者。',
        3),
       (10, '关键对话', '活着:松下幸之助', '格雷戈里', '机械工业出版社', '2023-06-09', 100.00, 100, 'api/关键对话.jpg',
        ' 指出上司的做法欠妥 男女朋友要结束一段关系 和叛逆期的孩子沟通 让伴侣的父母停止干涉自己的生活 让朋友还钱 大多数人要么隐忍不发，要么恶语相向。有什么办法既能圆满解决问题，又不会伤害或冒犯对方？ 本书作者团队基于20多年对全球10多万人的跟踪调查，甄选出大家公认的对话高手，总结出一套行之有效的方法和技巧。运用这些方法和技巧，无论是多么难以应对的局面，你都能够轻松面对，成就无往不利的事业，拥有和谐快乐的人生! 第3版重大更新 1.沟通技巧和案例的更新幅度超过40%。 2.完善架构。本书按照关键对话的流程顺序展，方便新老读者按图索骥。 3.新增应用场景： 网络沟通方式下，如何行关键对话？ 面对多元文化冲突时，如何行关键对话？ 价值观有较大分歧时，如何行关键对话？ 说得切中要 让对方清楚地知道你的看法，是一种能力 说得圆满得体 让对方自我反省，是一种智慧',
        3),
       (11, '雪国', '本书为川端康成诺贝尔文学奖获奖作品《雪国》独立短篇。', '川端康成', '南海出版社', '2023-06-09', 100.00,
        99, 'api/雪国.jpg', '本书为川端康成诺贝尔文学奖获奖作品《雪国》独立短篇。', 3),
       (12, '布鲁克林有棵树', '1生活千疮百孔，但被爱治愈的孩子，终会向阳而生。', '贝蒂·史密斯', '光明日报出版社',
        '2023-06-09', 100.00, 100, 'api/布鲁克林有棵树.jpg',
        '《布鲁克林有棵树》是美国作家贝蒂·史密斯创作的一部半自传体长篇小说，首次出版于1943年。全书没有怪诞刺激的情节，却以平实细腻的滴经历动人心。',
        3),
       (13, '人生借阅室', '阅读一本书，一种人生。”日本治愈系宝藏作家青山美智子，以书籍舒展心绪、书写人生！',
        '青山美智子,烨伊译', '湖南文艺出版社', '2023-06-09', 100.00, 99, 'api/人生借阅室.jpg',
        '《人生借阅室》是一部充满了爱、希望与帮助的故事。 看上去不怎么和蔼、友善的图书管理员，经常置身于狭窄的图书借阅室的柜台里，用针扎着一团一团的毛线，做着似乎是羊毛毡般的小手工活儿。 实际上，她非常善于倾听别人讲诉自己的故事与困惑，并为每位来访者精心推荐一本出人意料的书，那些亲切备至的言语和书籍的字里行间，正以温柔的方式，鼓励并改变着他人的人生......<br/>【推荐语】<br/>1.“阅读一本书，一种人生。”日本治愈系宝藏作家青山美智子，以书籍舒展心绪、书写人生！ 2.日本“书店大奖”第2名，献给内心温柔之人的佳作！令无数人感动落泪的《人生借阅室》，中文简体版首次出版！',
        3),
       (14, '商业冒险', '多次被巴菲特推荐，并被比尔•盖茨誉为“我读过的好商业书”，得以让微软避免错过重要机遇；', '布鲁克斯',
        '中信出版集团股份有限公司', '2023-06-09', 100.00, 91, 'api/商业冒险.jpg',
        '冒险是商业精神的核心，安于现状注定被淘汰，只有冒险家才能生存。 一次莫名其妙的股市崩盘，一款赔了3.5亿美元的汽车，一件造就新行业的产品，一群自愿救助股市散户的贪婪银行家，一个孤身挑战华尔街的超市老板，一桩令人难以置信的丑闻，一轮改变全球货币体系的暗战…… 华尔街不仅是金融的战场，也是人性的试验场，这里每天都上演着一夜暴富或身败名裂的故事，充满戏剧性和冒险性，展现了金融世界的阴谋和动荡，总会让人感觉到历史重演。 约翰·布鲁克斯选择了华尔街上12个富有戏剧性的时刻，以小说的笔法叙述了这个舞台上的奇谋、诡计、欺诈、贪婪、坚持、不甘……如今，商业的形式和表象一直在变，但商业的基础始终如一，商界诸如此类的冒险故事已经发生，正在发生，将来还会继续发生，而本书将不断地焕发力量，给我们启示和警醒。',
        3);
/*!40000 ALTER TABLE `t_book` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `t_category`
--

DROP TABLE IF EXISTS `t_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_category`
(
    `series_id`   int                                                          NOT NULL AUTO_INCREMENT,
    `series_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`series_id`) USING BTREE,
    UNIQUE KEY `series_name` (`series_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_category`
--

LOCK
TABLES `t_category` WRITE;
/*!40000 ALTER TABLE `t_category` DISABLE KEYS */;
INSERT INTO `t_category` (`series_id`, `series_name`)
VALUES (3, ' 经管/励志'),
       (1, '历史文学'),
       (2, '科技前沿');
/*!40000 ALTER TABLE `t_category` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order`
(
    `order_id`     int NOT NULL AUTO_INCREMENT,
    `book_id`      int      DEFAULT NULL,
    `user_id`      int      DEFAULT NULL,
    `order_time`   datetime DEFAULT (now()),
    `order_status` enum('已购买','未购买') DEFAULT (_utf8mb4 '未购买'),
    `book_num`     int      DEFAULT (1),
    PRIMARY KEY (`order_id`),
    KEY            `book_id` (`book_id`),
    KEY            `user_id` (`user_id`),
    CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `t_book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK
TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user`
(
    `user_id`       int         NOT NULL AUTO_INCREMENT,
    `user_name`     varchar(20)          DEFAULT NULL,
    `user_password` varchar(25) NOT NULL DEFAULT (111111),
    `user_sex`      enum('男','女','保密') NOT NULL DEFAULT (_utf8mb4 '保密'),
    `user_birth`    date                 DEFAULT (curdate()),
    `user_address`  varchar(100)         DEFAULT NULL,
    `user_phone`    varchar(11)          DEFAULT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK
TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`user_id`, `user_name`, `user_password`, `user_sex`, `user_birth`, `user_address`, `user_phone`)
VALUES (1, '1', '123', '女', '2023-06-10', '123', '123');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19 19:30:07
