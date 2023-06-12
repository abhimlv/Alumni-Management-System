
<?php

session_start();

include_once('../../config/dbconnect.php');


$Alumni_id = "";
$jobs_id = "";
$your_company = "";
$based_on = "";
$interns_req = "";
$emp_req = "";


    $sqlA = "SELECT A_id FROM alumni WHERE Alumni_name='{$_SESSION['Alumni_name']}'";
    $queryA = mysqli_query($conn,$sqlA);
    $rowA = mysqli_fetch_object($queryA);
    $A_id = $rowA->A_id;

    $sqljobs = "SELECT * FROM jobs WHERE A_id = '$A_id'";
    $queryjobs = mysqli_query($conn,$sqljobs);
    if (mysqli_num_rows($queryjobs)>0){
    $row = mysqli_fetch_object($queryjobs);

        $jobs_id = $row->jobs_id;
        $your_company = $row->your_company;
        $based_on = $row->based_on;
        $interns_req = $row->interns_req;
        $emp_req = $row->emp_req;

    }else{
        $emptyerror = "Please Enter Your Jobs First .";
    }


if (isset($_POST['Update'])) {
    $jobs_id = $_POST['jobs_id'];
    $your_company = $_POST['your_company'];
    $based_on = $_POST['based_on'];
    $interns_req = $_POST['interns_req'];
    $emp_req = $_POST['emp_req'];


    $sqlU = "UPDATE jobs SET your_company='$_POST[your_company]', based_on='$_POST[based_on]', interns_req='$_POST[interns_req]', emp_req='$_POST[emp_req]'
            WHERE jobs_id='$_POST[jobs_id]'"; 

    if (mysqli_query($conn, $sqlU)) 
    {
        $successmsz = 'Your Higher Studies details are successfully Updated.';
        header("refresh:1; url=Edit_jobs.php");
    }
    else
    {
        $errormsz = mysqli_error($conn);
    }

}
?>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>work details</title>
    <link type="text/css" href="../../Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../Assets/bootstrap/css/theme.css" rel="stylesheet">
    <link type="text/css" href="../../Assets/bootstrap/css/custom.css" rel="stylesheet">
    <link type="text/css" href="../../Assets/bootstrap/images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
        rel='stylesheet'>
    <script src="../../Assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Assets/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../Assets/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="../../Assets/scripts/flot/jquery.flot.js" type="text/javascript"></script>
    <script src="../../Assets/scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
    <script src="../../Assets/scripts/common.js" type="text/javascript"></script>
</head>
<body>

<div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <i class="icon-reorder shaded"></i></a><a class="brand" href="Dashboard.php">SAKEC Alumni Portal </a>
                <div class="nav-collapse collapse navbar-inverse-collapse">
                    <ul class="nav pull-right">
                        <li><a class="User" href="#"><?php echo $_SESSION['Alumni_name']; ?></a></li>
                    </ul>
                </div>
                <!-- /.nav-collapse -->
            </div>
        </div>
        <!-- /navbar-inner -->
    </div>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <div class="sidebar">
                        <ul class="widget widget-menu unstyled">
                            <li class="active"><a href="../Alumni_Dashboard.php"><i class="menu-icon icon-dashboard"></i>Dashboard
                            </a></li>
                        </ul>
                        <!--/.widget-nav-->
                        <ul class="widget widget-menu unstyled">
                            <li style="height: 30px; text-align: center;padding-top: 10px; background-color: #4268f4;"><b><h4>Enter Your details.(If not filled)</h4></b></li>
                            <li><a href="work_details.php"><i class="menu-icon icon-tasks"></i>Work </a>
                            </li>
                            <li><a href="higher_education.php"><i class="menu-icon icon-tasks"></i>Higher Education </a>
                            </li>
                            <li><a href="jobs.php"><i class="menu-icon icon-tasks"></i>Jobs </a>
                            </li>
                        </ul>
                        <!--/.widget-nav-->
                        <ul class="widget widget-menu unstyled">
                            <li><a href="../../config/Alumni_logout.php"><i class="menu-icon icon-signout"></i>Logout </a></li>
                        </ul>
                    </div>
                    <!--/.sidebar-->
                </div>
                <!--/.span3-->
                <div class="span9">
                    <div class="content">
                        <div class="module" >
                        <div class="module-head">
                            <h3 style="text-align: center;">Your Job Details</h3>
                        </div>
                        <div class="module-body">

                                    <?php
                                        if(isset($successmsz))
                                        {
                                          ?>
                                          <div class="alert alert-success">
                                            <?php echo $successmsz; ?>
                                          </div>
                                          <?php
                                        }else if (isset($emptyerror)) {
                                          ?>
                                            <div class="alert alert-danger">
                                            <?php echo $emptyerror; ?> 
                                          </div>
                                          <?php
                                        }
                                   ?>
                                <br />

                                <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" class="form-horizontal row-fluid" >

                                    <input type="hidden" id=" jobs_id" value="<?php echo $HS_id; ?>" name="jobs_id" class="span8">

                                    <div class="control-group">
                                        <label class="control-label" for="  your_company">  Your Company Name</label>
                                        <div class="controls">
                                            <input type="text" id=" your_company" value="<?php echo $your_company; ?>" name="your_company" class="span8"><br><br>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="based_on">Course Name</label>
                                        <div class="controls">
                                            <input type="text" id="based_on" value="<?php echo $based_on; ?>" name="based_on" class="span8"><br><br>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="interns_req">Interns Required</label>
                                        <div class="controls">
                                            <input type="text" id="interns_req" value="<?php echo $interns_req; ?>" name="interns_req" class="span8"><br><br>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="emp_req">Employees Required</label>
                                        <div class="controls">
                                            <input type="text" id="emp_req" value="<?php echo $emp_req; ?>" name="emp_req" class="span8"><br><br>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="controls">
                                            <button name="Update" type="submit" class="btn btn-primary btn-xl" onclick="checkFields()">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--/.content-->
                </div>
                <!--/.span9-->
            </div>
        </div>
        <!--/.container-->
    </div>
    <!--/.wrapper-->
</body>