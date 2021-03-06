<?php

function connectt() {
    $h = 'localhost';
    $username = 'root';
    $password = '';
    $dbname = 'zalochat';
 
    $conn = mysqli_connect('localhost', 'root', '', 'zalochat');
    if(!$conn){
        Respone(1001, []);
        die();
    } else {
        mysqli_set_charset($conn, "utf8");
        return $conn;
    }
    
};

function Respone($code, $data){
    $mess = '';
    $res = [];
    switch ($code) {
    case 1000:
        $mess = "OK";
        break;
    case 9992:
        $mess = "Post is not existed";
        break;
    case 9993:
        $mess = "Code verify is incorrect";
        break;
    case 9994:
        $mess = "No data or end of list data";
        break;
    case 9995:
        $mess = "User is not validated";
        break;
    case 9996:
        $mess = "User is existed";
        break;
    case 9997:
        $mess = "Method is invalid";
        break;
    case 9998:
        $mess = "Token is invalid";
        break;
    case 9999:
        $mess = "Exception error";
        break;
    case 1001:
        $mess = "Cannot connect to DB";
        break;
    case 1002:
        $mess = "Parameter is not enought";
        break;
    case 1003:
        $mess = "Parameter type is invalid";
        break;
    case 1004:
        $mess = "Parameter value is invalid";
        break;
    case 1005:
        $mess = "Unknown error";
        break;
    case 1006:
        $mess = "File size is too big";
        break;
    case 1007:
        $mess = "Upload file failed";
        break;
    case 1008:
        $mess = "Maximum number of images";
        break;
    case 1009:
        $mess = "Not access";
        break;
    case 1010:
        $mess = "Action has been done previously by this user";
        break;
    case 1011:
        $mess = "This user logged in somewhere";
        break;
    }
    
    $res['code'] = ''.$code;
    $res['message'] = $mess;
    
    if(count($data) > 0){
        $res['data'] = $data;
    }
    
    echo json_encode($res);
}

require 'jwtHandler.php';

function GetToken($sdt, $id) {
    $jwt = new jwtHandler();
    $token = $jwt->_jwt_encode_data(
    'http://localhost/Zaloo/',
    array("sdt"=>$sdt,"id"=>$id)
    );
    
    $ng[$id] = $token;
    return $token;
}

function DecodeToken($tokn) {
    $jwt = new jwtHandler();
    $data =  $jwt->_jwt_decode_data(trim($tokn));
    $row = (array)$data;
    
    return $row;
}

function isAuth($tokn) {
    $jwt = new jwtHandler();
    $data =  $jwt->_jwt_decode_data(trim($tokn));
    $row = (array)$data;
    
    if(array_key_exists('id', $row)){
        return 1;
    } else{
        return 0;
    }
}

function uploadImage($folde) {
    if (!isset($_FILES["imageupload"]) || $_FILES["imageupload"]['error'] != 0)
  {
        return '';
  } else{
  // ???? c?? d??? li???u upload, th???c hi???n x??? l?? file upload

  //Th?? m???c b???n s??? l??u file upload
  $target_dir    = "up/";
  //V??? tr?? file l??u t???m trong server (file s??? l??u trong uploads, v???i t??n gi???ng t??n ban ?????u)
  $target_file   = $target_dir . basename($_FILES["imageupload"]["name"]);
  //L???y ph???n m??? r???ng c???a file (jpg, png, ...)
  $filename = pathinfo($_FILES['imageupload']['name'], PATHINFO_FILENAME);
  $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
  
  // move to folder
  $target_dir2   = $folde."/";
  $target_file2   = $target_dir2 . $filename.".".$imageFileType;

  $allowUpload   = true;
 
  // C??? l???n nh???t ???????c upload (bytes)
  $maxfilesize   = 5*1024*1024;  // 10Mb

  ////Nh???ng lo???i file ???????c ph??p upload
  $allowtypes    = array('jpg', 'png', 'jpeg', 'gif');


      //Ki???m tra xem c?? ph???i l?? ???nh b???ng h??m getimagesize
  /*    $check = getimagesize($_FILES["imageupload"]["tmp_name"]);
      if($check !== false)
      {
          //echo "????y l?? file ???nh - " . $check["mime"] . ".";
          $allowUpload = true;
      }
      else
      {
          //echo "Kh??ng ph???i file ???nh.";
          Respone(1007, []);
          die();
          
          $allowUpload = false;
      }*/

  // Ki???m tra n???u file ???? t???n t???i th?? kh??ng cho ph??p ghi ????
  // B???n c?? th??? ph??t tri???n code ????? l??u th??nh m???t t??n file kh??c
  if (file_exists($target_file2))
  {
      //echo "T??n file ???? t???n t???i tr??n server, kh??ng ???????c ghi ????";
      //$allowUpload = true;
      
      $addname = 1;
      while (true){
          $target_file2   = $target_dir2 . $filename.$addname.".".$imageFileType;
          if (file_exists($target_file2)){
              $addname++;
          } else{
              break;
          }
      }
      
  }
  // Ki???m tra k??ch th?????c file upload cho v?????t qu?? gi???i h???n cho ph??p
  if ($_FILES["imageupload"]["size"] > $maxfilesize)
  {
      $allowUpload = false;
      
       Respone(10062, []);
       die();
  }


  // Ki???m tra ki???u file
  if (!in_array($imageFileType,$allowtypes ))
  {
      //echo "Ch??? ???????c upload c??c ?????nh d???ng JPG, PNG, JPEG, GIF";
      $allowUpload = false;
      
      Respone(10073, []);
      die();
  }


  if ($allowUpload)
  {
      // X??? l?? di chuy???n file t???m ra th?? m???c c???n l??u tr???, d??ng h??m move_uploaded_file
      if (move_uploaded_file($_FILES["imageupload"]["tmp_name"], $target_file2))
      {
        /*  echo "File ". basename( $_FILES["fileupload"]["name"]).
          " ???? upload th??nh c??ng.";*/

        //  echo "File l??u t???i " . $target_file;
        return $target_file2;
      }
      else
      {
          //echo "C?? l???i x???y ra khi upload file.";
          Respone(10074, []);
          die();
      }
  }
  else
  {
      //echo "Kh??ng upload ???????c file, c?? th??? do file l???n, ki???u file kh??ng ????ng ...";
      Respone(10075, []);
      die();
  }
  }
}

function uploadVideo($folde) {
    if (!isset($_FILES["videoupload"]) || $_FILES["videoupload"]['error'] != 0)
  {
        return '';
  } else{

  // ???? c?? d??? li???u upload, th???c hi???n x??? l?? file upload

  //Th?? m???c b???n s??? l??u file upload
  $target_dir    = "up/";
  //V??? tr?? file l??u t???m trong server (file s??? l??u trong uploads, v???i t??n gi???ng t??n ban ?????u)
  $target_file   = $target_dir . basename($_FILES["videoupload"]["name"]);
  //L???y ph???n m??? r???ng c???a file (jpg, png, ...)
  $filename = pathinfo($_FILES['videoupload']['name'], PATHINFO_FILENAME);
  $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
  
  // move to folder
  $target_dir2   = $folde."/";
  $target_file2   = $target_dir2 . $filename.".".$imageFileType;

  $allowUpload   = true;
 
  // C??? l???n nh???t ???????c upload (bytes)
  $maxfilesize   = 30*1024*1024;  // 10Mb

  ////Nh???ng lo???i file ???????c ph??p upload
  $allowtypes    = array('mp4', 'mp4');

  // Ki???m tra n???u file ???? t???n t???i th?? kh??ng cho ph??p ghi ????
  // B???n c?? th??? ph??t tri???n code ????? l??u th??nh m???t t??n file kh??c
  if (file_exists($target_file2))
  {
      //echo "T??n file ???? t???n t???i tr??n server, kh??ng ???????c ghi ????";
      //$allowUpload = true;
      
      $addname = 1;
      while (true){
          $target_file2   = $target_dir2 . $filename.$addname.".".$imageFileType;
          if (file_exists($target_file2)){
              $addname++;
          } else{
              break;
          }
      }
      
  }
  // Ki???m tra k??ch th?????c file upload cho v?????t qu?? gi???i h???n cho ph??p
  if ($_FILES["videoupload"]["size"] > $maxfilesize)
  {
      $allowUpload = false;
      
       Respone(1006, []);
       die();
  }


  // Ki???m tra ki???u file
  if (!in_array($imageFileType,$allowtypes ))
  {
      //echo "Ch??? ???????c upload c??c ?????nh d???ng JPG, PNG, JPEG, GIF";
      $allowUpload = false;
      
      Respone(1007, []);
      die();
  }


  if ($allowUpload)
  {
      // X??? l?? di chuy???n file t???m ra th?? m???c c???n l??u tr???, d??ng h??m move_uploaded_file
      if (move_uploaded_file($_FILES["videoupload"]["tmp_name"], $target_file2))
      {
        /*  echo "File ". basename( $_FILES["fileupload"]["name"]).
          " ???? upload th??nh c??ng.";*/

        //  echo "File l??u t???i " . $target_file;
        return $target_file2;
      }
      else
      {
          //echo "C?? l???i x???y ra khi upload file.";
          Respone(1007, []);
          die();
      }
  }
  else
  {
      //echo "Kh??ng upload ???????c file, c?? th??? do file l???n, ki???u file kh??ng ????ng ...";
      Respone(1007, []);
      die();
  }
  }
}

?>

