<%-- 
    Document   : home.jsp
    Created on : Jun 13, 2024, 3:14:28 AM
    Author     : gauta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style = "background :url(img/img1.jpg); background-size:cover; background-attachment:fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px"; class="center-align">Register Here!!!!</h3>
                            <h5 id="msg" class="center-align"> </h5>
                            <div class="form center-align">
                                <form action="web" method="post" id="myform">
                                    <input type="text"  id ="user_name" name="user_name" placeholder="Enter your name">
                                    <input type="password" id ="user_password" name="user_password" placeholder="Enter your password">
                                    <input type="email" id="user_email" name="user_email" placeholder="Enter your email">
                                    <div class="file-field input-field">
                                        <div class="btn">
                                            <span>File</span>
                                            <input type="file" name="image">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn">submit</button>
                                </form>
                            </div>
                            <div class="loader center-align" style="margin-top: 10px;display:none;">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>

                                <!--                                  <div class="preloader-wrapper active">
                                                                    <div class="spinner-layer spinner-red-only">
                                                                      <div class="circle-clipper left">
                                                                        <div class="circle"></div>
                                                                      </div><div class="gap-patch">
                                                                        <div class="circle"></div>
                                                                      </div><div class="circle-clipper right">
                                                                        <div class="circle"></div>
                                                                      </div>
                                                                    </div>
                                                                  </div>-->

                                <!--                                  <div class="preloader-wrapper small active">
                                                                    <div class="spinner-layer spinner-green-only">
                                                                      <div class="circle-clipper left">
                                                                        <div class="circle"></div>
                                                                      </div><div class="gap-patch">
                                                                        <div class="circle"></div>
                                                                      </div><div class="circle-clipper right">
                                                                        <div class="circle"></div>
                                                                      </div>
                                                                    </div>
                                                                  </div>-->
                                <h5>please wait...</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous">
        </script>
        <script>
            $(document).ready(function ()
            {
                console.log("ready1");
                $("#myform").on('submit', function (event)
                {
                    event.preventDefault();
                    console.log("ready2");
//                    var f = $(this).serialize();
                    let f = new FormData(this);
                    console.log("ready3");
                    console.log(f);
                    $(".loader").show();
                    $("#myform").hide();

                    $.ajax({
                        url: "web",
                        data: f,
                        type: "post",
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log(data);
                            console.log("sucess..................");
                            $(".loader").hide();
                            $("#myform").show();

                            if (data.trim() === "done")
                            {
                                $("#msg").html("Registered Successfully!!!");
                                $("#msg").addClass("green-text");
                            } else {
                                $("#msg").html("SomeThing Went Wrong!!!");
                                $("#msg").addClass("red-text");
                            }
                        },

                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            console.log("error..................");
                        },
                        processData: false,
                        contentType: false
                    });
                });

            }
            )
        </script>
    </body>
</html>
