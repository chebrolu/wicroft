<%-- 
    Document   : apchage
    Created on : 23 Jul, 2016, 12:37:06 PM
    Author     : ratheeshkv
--%>





<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.util.concurrent.CopyOnWriteArrayList"%>
<%@page import="com.iitb.cse.Utils"%>
<%@page import="com.mysql.jdbc.Util"%>
<%@page import="org.eclipse.jdt.internal.compiler.impl.Constant"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="com.iitb.cse.DeviceInfo"%>
<%@page import="com.iitb.cse.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>CrowdSource-ServerHandler</title>

        <!-- Bootstrap Core CSS -->
        <link href="/serverplus/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="/serverplus/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="/serverplus/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="/serverplus/vendor/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="/serverplus/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="frontpage.jsp">CrowdSource Application - SERVER</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">

                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">

                            <li class="divider"></li>
                            <li>

                                <a href="logout.jsp?logout=logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

              
                <!-- /.navbar-static-side -->
                
                 <div id="links" class="navbar-default sidebar" role="navigation">
                </div>
            </nav>












            <%
                if (Constants.currentSession.isExperimentRunning()) {
                    response.sendRedirect("experimentStatus.jsp");
                } else {


            %>


            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Experiment Status</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            
                            <div class="panel-body">
                                
                                Experiment Starting Failed : Control File Wrong Format
                                
                                
                                
                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

                
                <!--end Row -->




            </div>
            <!-- /#page-wrapper -->

            <%            }
            %>







        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="/serverplus/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/serverplus/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="/serverplus/vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="/serverplus/vendor/raphael/raphael.min.js"></script>
        <script src="/serverplus/vendor/morrisjs/morris.min.js"></script>
        <script src="/serverplus/data/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/serverplus/dist/js/sb-admin-2.js"></script>
        <!-- DataTables JavaScript -->
        <script src="/serverplus/vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="/serverplus/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
        <script src="/serverplus/vendor/datatables-responsive/dataTables.responsive.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/serverplus/dist/js/sb-admin-2.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
                                                    $(document).ready(function () {
                                                        $('#dataTables-example').DataTable({
                                                            responsive: true
                                                        });
                                                    });
        </script>


        <script>


            function _check() {
                //   alert(document.getElementById('filter').value);
                if (document.getElementById('filter').value == "bssid") {
                    document.getElementById('selectonbssid').style.display = 'block';
                    document.getElementById('selectonssid').style.display = 'none';
                    document.getElementById('random').style.display = 'none';
                    document.getElementById('getclient').style.display = 'block';
                } else if (document.getElementById('filter').value == "ssid") {
                    document.getElementById('selectonssid').style.display = 'block';
                    document.getElementById('selectonbssid').style.display = 'none';
                    document.getElementById('random').style.display = 'none';
                    document.getElementById('getclient').style.display = 'block';
                } else if (document.getElementById('filter').value == "manual") {

                    document.getElementById('random').style.display = 'none';
                    document.getElementById('selectonssid').style.display = 'none';
                    document.getElementById('selectonbssid').style.display = 'none';
                    document.getElementById('getclient').style.display = 'block';

                } else if (document.getElementById('filter').value == "random") {
                    document.getElementById('random').style.display = 'block';
                    document.getElementById('selectonssid').style.display = 'none';
                    document.getElementById('selectonbssid').style.display = 'none';
                    document.getElementById('getclient').style.display = 'block';
                } else {
                    document.getElementById('random').style.display = 'none';
                    document.getElementById('selectonssid').style.display = 'none';
                    document.getElementById('selectonbssid').style.display = 'none';
                    document.getElementById('getclient').style.display = 'none';
                }
            }


        </script>
      <script type="text/javascript">
            $(document).ready(function () {
                $('#links').load('navigation.html');
                refresh();

            });
        </script>



    </body>

</html>
