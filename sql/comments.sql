-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2021 at 10:59 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forcomment`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(10) NOT NULL,
  `parant_id` int(10) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `parant_id`, `date`) VALUES
(3, 'Ljsdfksdf', 1, 1, '2021-03-01 14:06:33'),
(4, 'Another .... &lt;?php\r\n    require \'partials/_dbconnect.php\';\r\n    include \'partials/_controlFunctions.php\';\r\n    session_start();\r\n    $responce=\'\';\r\n\r\n    $showAllert = false;\r\n    $thread_id = $_GET[\'threadid\'];\r\n    $sqli = \"SELECT * FROM `thread` WHERE `thread_id`=$thread_id\";\r\n    $result = mysqli_query($conn,$sqli);\r\n    while($row = mysqli_fetch_assoc($result)){\r\n        // $threadid = $row[\'categories_id\'];\r\n        \r\n        $title = $row[\'thread_title\'];\r\n        $desc = $row[\'thread_dsc\'];\r\n        $postDate = $row[\'timestape\'];\r\n        $threader_id = $row[\'thread_user_id\'];\r\n        // find the user detail base on it user id\r\n        $sqli2 = \"SELECT * FROM `users` WHERE `user_id` = $threader_id\";\r\n        $result2 = mysqli_query($conn,$sqli2);\r\n        $row2 = mysqli_fetch_assoc($result2);\r\n        $threader_name = $row2[\'user_name\'];    \r\n    }\r\n\r\n?&gt;\r\n\r\n\r\n&lt;!-- hare is new comment and replay areay  --&gt;\r\n&lt;?php\r\n    // echo $_SERVER[\'REQUEST_METHOD\'];\r\n    if($_SERVER[\'REQUEST_METHOD\'] == \'POST\'){\r\n        // echo \'hello\';\r\n        if (isset($_POST[\'replay\'])) {\r\n            // stor replay data on db \r\n            # code...\r\n            $replayText = $_POST[\'replay\'];\r\n            $replayText = str_replace(\'&gt;\',\'&gt;\',$replayText);\r\n            $replayText = str_replace(\'&lt;\',\'&lt;\',$replayText);\r\n            $replayText = mysqli_escape_string($conn,$replayText);\r\n            $replayText = ucfirst($replayText);\r\n            $userid = $_SESSION[\'userid\'];\r\n            $parant_id = $_POST[\'parentComment\'];\r\n            // echo $parant_id . \'&lt;br&gt;\';\r\n            // $checkingQuery = \"SELECT * FROM `replay` WHERE \"\r\n        \r\n            // insert into dadabase query \r\n            $sql = \"INSERT INTO `replay` (`content`, `user_id`, `parant_id`, `date`) VALUES (\'$replayText\',\'$userid\', \'$parant_id\', CURRENT_TIMESTAMP)\";\r\n            $result = mysqli_query($conn,$sql);\r\n            // $result = $conn-&gt;query($sql);\r\n            // echo var_dump($result);\r\n            if ($result) {\r\n                # code...\r\n                $showAllert = true;\r\n            }\r\n            else \r\n                echo \'error is --&gt; \'. mysqli_error($conn);\r\n        }else{\r\n            // store comments data on db \r\n            $comment = $_POST[\'comment\'];\r\n            $comment = str_replace(\'&gt;\',\'&gt;\',$comment);\r\n            $comment = str_replace(\'&lt;\',\'&lt;\',$comment);\r\n            // echo $comment;\r\n            $comment = mysqli_escape_string($conn,$comment);\r\n            $comment = ucfirst($comment);\r\n            // echo $_SESSION[\'userid\'];\r\n            $userid = $_SESSION[\'userid\'];\r\n            \r\n            // insert into dadabase query \r\n            $sql = \"INSERT INTO `comments` (`content`, `user_id`, `parant_id`, `date`) VALUES (\'$comment\', \'$userid\', \'$thread_id\', CURRENT_TIMESTAMP)\";\r\n            $result = mysqli_query($conn,$sql);\r\n            if ($result) {\r\n                # code...\r\n                $showAllert = true;\r\n            }\r\n            // else{\r\n            //     echo \' not insert data error is-&gt; \' . mysqli_error($conn);\r\n            // }\r\n        }\r\n    };\r\n    \r\n?&gt;\r\n\r\n&lt;!doctype html&gt;\r\n&lt;html lang=\"en\"&gt;\r\n\r\n&lt;head&gt;\r\n    &lt;!-- Required meta tags --&gt;\r\n    &lt;meta charset=\"utf-8\"&gt;\r\n    &lt;meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"&gt;\r\n\r\n    &lt;!-- Bootstrap CSS --&gt;\r\n    &lt;link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\r\n        integrity=\"sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1\" crossorigin=\"anonymous\"&gt;\r\n\r\n    &lt;title&gt;Thread | iForum&lt;/title&gt;\r\n&lt;/head&gt;\r\n\r\n&lt;body&gt;\r\n    &lt;!-- &lt;h1&gt;Welcome to iForum&lt;/h1&gt; --&gt;\r\n\r\n    &lt;!--- this is header element come from another file----&gt;\r\n    &lt;?php require \"partials/_header.php\" ?&gt;\r\n\r\n    &lt;!-- show allert if there is comments posted --&gt;\r\n    &lt;?php\r\n        if ($showAllert) {\r\n            # code...\r\n            echo \'\r\n                    &lt;div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\"&gt;\r\n                        &lt;strong&gt;Succes!&lt;/strong&gt; Your thread added sucessfully!!\r\n                        &lt;button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"&gt;&lt;/button&gt;\r\n                    &lt;/div&gt;\r\n            \';\r\n        }\r\n    ?&gt;\r\n\r\n\r\n    &lt;!-- Hare is all Quesion show   --&gt;\r\n    &lt;div class=\"container\"&gt;\r\n        &lt;div class=\"bg-light p-4 my-3\"&gt;\r\n            &lt;h1&gt;&lt;?php echo $title ;?&gt;&lt;/h1&gt;\r\n            &lt;p&gt;\r\n                &lt;?php\r\n                    echo $desc;\r\n                ?&gt;&lt;/p&gt;\r\n            &lt;hr&gt;\r\n\r\n            &lt;p&gt;Posted by - &lt;strong&gt;&lt;?php echo $threader_name .\' |  \'.dateFormet($postDate);?&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n            &lt;button class=\"btn btn-success my-1\"&gt;Learn more&lt;/button&gt;\r\n        &lt;/div&gt;\r\n        &lt;hr class=\'my-4\'&gt;\r\n    &lt;/div&gt;\r\n    &lt;!-- Hare is user post his Comments, this is form for posting the comments --&gt;\r\n    &lt;?php\r\n    // echo replayTeplat(\'hellow i am function\');\r\n    if (isset($_SESSION[\'logdin\']) && $_SESSION[\'logdin\']==TRUE){\r\n        echo \'\r\n            &lt;div class=\"container\"&gt;\r\n                &lt;h3&gt;Start Discussion&lt;/h3&gt;\r\n                &lt;form class=\"border p-4 rounded\" action=\"\'. $_SERVER[\'REQUEST_URI\'] .\'\" method=\"post\"&gt;\r\n                    &lt;div class=\"mb-3\"&gt;\r\n                        &lt;label for=\"comment\" class=\"form-label\"&gt;comment somthing&lt;/label&gt;\r\n                        &lt;textarea required class=\"form-control\" name=\"comment\" placeholder=\"comment\" id=\"comment\" rows=\"3\"&gt;&lt;/textarea&gt;\r\n                    &lt;/div&gt;\r\n                    &lt;button type=\"submit\" class=\"btn btn-success\"&gt;Submit&lt;/button&gt;\r\n                    &lt;button type=\"reset\" class=\"btn ms-2 btn-dark\"&gt;Reset&lt;/button&gt;\r\n                &lt;/form&gt;\r\n            &lt;/div&gt;\r\n        \';\r\n        \r\n    }else{\r\n        echo \'\r\n        &lt;div class=\"container\"&gt;\r\n       \r\n            &lt;h3&gt;Start Discussion&lt;/h3&gt;\r\n            &lt;div class=\"alert alert-warning\" role=\"alert\"&gt;\r\n                &lt;p class=\"lead m-0\"&gt;\r\n                &lt;b&gt;You are not login user. Pleas loging to post your Comments.!!&lt;/b&gt;\r\n                &lt;/p&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        \';\r\n    }\r\n    \r\n    ?&gt;\r\n\r\n\r\n    &lt;!-- hare is comments list  --&gt;\r\n    &lt;!-- fetching comments from the data base if hare is not data show the \'no comment\' notifications --&gt;\r\n    &lt;div class=\"container\"&gt;\r\n        &lt;hr class=\"my-4\"&gt;\r\n        &lt;h3 class=\"my-3\"&gt;All Discussion&lt;/h3&gt;\r\n        &lt;?php\r\n        //  $responce .= replayTeplat(array(\'waseem\',\'12-12-2020\',\'this is comment\'));\r\n            // $sqli = \"SELECT * FROM `comments` WHERE `parant_id`=$thread_id\";\r\n            $sqli = \"SELECT `user_name`, `content`, `comments`.`id`, `comments`.`date` FROM `comments`INNER JOIN `users` ON `comments`.`user_id` = `users`.`user_id` WHERE `parant_id`=$thread_id\";\r\n            $result = mysqli_query($conn,$sqli);\r\n            $nothread = true;\r\n            $index = 0;\r\n            while($data = mysqli_fetch_assoc($result)){\r\n                $nothread = false;\r\n                // echo var_dump($data);\r\n                // echo $data[\'id\'] .\'&lt;--- id\';\r\n                $responce .= commentAndReplayTeplat($data);\r\n            };\r\n            // echo var_dump($responce);\r\n            echo $responce;\r\n            if ($nothread) {\r\n                # code...\r\n                echo \'\r\n                    &lt;div class=\"alert alert-dark\" role=\"alert\"&gt;\r\n                        &lt;h4 class=\"alert-heading display-4\"&gt;No comment hare&lt;/h4&gt;\r\n                        &lt;p&gt;There is no comments at. make your comments first.&lt;/p&gt;\r\n                        &lt;hr&gt;\r\n                        &lt;p class=\"mb-0\"&gt;Post the comment under the rool of this forum.&lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                \';\r\n            }\r\n\r\n\r\n           \r\n\r\n        ?&gt;\r\n\r\n\r\n\r\n\r\n        &lt;hr class=\"my-4\"&gt;\r\n        &lt;!-- &lt;textarea name=\"\" id=\"\" cols=\"30\" rows=\"10\"&gt;&lt;/textarea&gt; --&gt;\r\n    &lt;/div&gt;\r\n    &lt;?php require \"partials/_footer.php\" ?&gt;\r\n\r\n\r\n\r\n\r\n    &lt;!-- Optional JavaScript; choose one of the two! --&gt;\r\n\r\n    &lt;!-- Option 1: Bootstrap Bundle with Popper --&gt;\r\n    &lt;script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js\"\r\n        integrity=\"sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW\" crossorigin=\"anonymous\"&gt;\r\n    &lt;/script&gt;\r\n\r\n    &lt;!-- Option 2: Separate Popper and Bootstrap JS --&gt;\r\n    &lt;!--\r\n    &lt;script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js\" integrity=\"sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU\" crossorigin=\"anonymous\"&gt;&lt;/script&gt;\r\n    &lt;script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js\" integrity=\"sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj\" crossorigin=\"anonymous\"&gt;&lt;/script&gt;\r\n    --&gt;\r\n    &lt;script src=\"index.js\"&gt;&lt;/script&gt;\r\n\r\n&lt;/body&gt;\r\n\r\n&lt;/html&gt;', 1, 1, '2021-03-01 14:11:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
