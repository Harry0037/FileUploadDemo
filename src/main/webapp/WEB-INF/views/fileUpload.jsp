<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>文件上传系统</title>
  <style type="text/css">
    body{
      background: #7cea9d;
    }
    .box{
      width: 50%;
      margin: 20px auto;
      background: #8a737857;
      padding: 20px;
      box-shadow: 1px 1px 3px #666;
      text-align: center;
    }
    h1{
      color: #fff;
      text-shadow: 0px 0px 2px #000;
    }
    a{
      text-decoration: none;
      padding: 5px 8px;
      color: #fff;
      background: #607bc7;
      box-shadow: 0px 0px 3px #000;
      border-radius: 5px; /*圆角*/
    }
    a:hover{
      padding: 6px 9px;
      background: #000;
    }
    .fileList{
      margin-top: 20px;
    }
    ul{
      list-style: none;
      border-bottom: 1px solid #666;
      margin: 0;
    }

    /*解决子元素的浮动导致自己没高度*/
    ul:after{
      clear: both;
      content: "";
      display: block;
    }
    ul:nth-child(odd){
      background: #676767;
      color: #ffffff;
    }
    li{
      float: left;
    }

  </style>
</head>
<body>
  <div class="box">
    <h1>文件管理系统</h1>
    <input type="file" onchange="doFileUp(this)" multiple style="display: none" id="fileChoice"/>
    <a href="javascript:void(0);" onclick="doFileChoice()">上传文件</a>
    <div class="fileList" id="fileList">
      <ul>
        <li style="width: 30%">文件名</li>
        <li style="width: 68%">上传情况</li>
      </ul>
    </div>
  </div>

  <script type="text/javascript">
    function doFileChoice(){
      document.getElementById("fileChoice").click();
    }

    function doFileUp(fileObj){
      var files = fileObj.files;
      var backHtml = "";
      for(var i = 0; i < files.length; i++){
        var file = files[i];
        <!--progress进度条组件-->
        backHtml += "<ul><li style=\"width: 30%\">"+file.name+"</il><li style=\"width: 68%\"><progress id = \"pro\"+i+max=\"100\" value=\"0\"></progress><label id='lab"+i+"'></label></li></ul>";
        // 每一个文件单独创建一个商城进程
        fileUp(file, i);
      }

      document.getElementById("fileList").innerHTML += backHtml;
    }

    function fileUp(file, index){
      // 相当于form表单
      var formData = new FormData();
      formData.append("file", file);
      var xhr = new XMLHttpRequest();
      var oldLoaded=0,total=0,curLoaded=0;
      xhr.upload.addEventListener("progress", function(event){
        //loaded total
        var percent = Math.round(event.loaded/event.total*100);
        document.getElementById("pro"+index).value = percent;
        curLoaded = event.loaded;
        if(oldLoaded == 0){
          total = event.total;
          oldLoaded = event.loaded;
        }
      }, false);

      //开启定时器
      var upSpeet = setInterval(function(){
        if(oldLoaded != 0){
          var speet = curLoaded-oldLoaded;
          document.getElementById("lab"+index).innerHTML = "速度:"+Math.round((speet/(1024*1024)*100)/100)+"m/s 剩余时间:"+Math.round((total-curLoaded)/speet)+"s";
          if(curLoaded == total){
            document.getElementById("lab"+index).innerHTML = "上传完成";
            clearInterval(upSpeet);
          }
          oldLoaded = curLoaded;
        }
      }, 1000);
      xhr.open("post", "doUpload",true);//true表示是异步的
      xhr.send(formData);
    }
  </script>
</body>
</html>
