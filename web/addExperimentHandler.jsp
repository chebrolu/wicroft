<%-- 
    Document   : apchangeHandler
    Created on : 23 Jul, 2016, 11:46:07 PM
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

        <title>Wicroft</title>

        <!-- Bootstrap Core CSS -->
        <link href="/wicroft/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="/wicroft/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="/wicroft/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="/wicroft/vendor/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="/wicroft/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="wrapper">

          <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="frontpage.jsp">Wicroft Server</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">

                    <!-- /.dropdown -->
                    <li class="dropdown">

                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <%= session.getAttribute("currentUser") %>
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
                
                <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            
                            <li>
                                <a href="frontpage.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            
                            <li>
                                <a href="configExperiment.jsp"><i class="fa fa-dashboard fa-fw"></i> Experiment Configuration</a>
                            </li>
                            
                            <li>
                                <a href="experimentDetails.jsp"><i class="fa fa-table fa-fw"></i> Experiment History</a>
                            </li>
                            
                            <li>
                                <a href="utilities.jsp"><i class="fa fa-dashboard fa-fw"></i> Utilities</a>
                            </li>
                            
                            <li>
                                <a href="details.jsp"><i class="fa fa-dashboard fa-fw"></i> Details</a>
                            </li>
                            
                            <li>
                                <a href="settings.jsp"><i class="fa fa-dashboard fa-fw"></i> Settings</a>
                            </li>

                        </ul>
                    </div>
                    </div>

            </nav>



  <div id="page-wrapper">
      <form role="form" action="addExperimentStatus.jsp"  method="post"  enctype="multipart/form-data" onsubmit="return check();">
          <div class="row">
              <div class="col-lg-12">
                  <h1 class="page-header">Add Experiment</h1>
              </div>
              <!-- /.col-lg-12 -->
          </div>
                    <!-- /.row -->
          <div class="row">
              <div class="col-lg-6">
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          Select Clients
                      </div>
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-lg-6">




                                  <div class="form-group">
                                      <label>Experiment Number</label>
                                      <input class="form-control" type="text" name="exp_number" value=<%= Integer.toString(DBManager.getNextExperimentId())%> readonly="readonly">
                                  </div>


                                  <div class="form-group">
                                      <label>Experiment Name<b style='color: red'>*</b></label>
                                      <input  class="form-control" type="text" id="expName" name="exp_name"/><i style='color:red;display: none' id='error'>Field Cannot be Empty</i>
                                  </div>

                                  <div class="form-group">
                                      <label>Experiment Location</label>
                                      <input class="form-control" type="text" name="exp_loc"/>
                                  </div>

                                  <div class="form-group">
                                      <label>Description</label>
                                      <textarea class="form-control" name="exp_desc" rows="5" cols="30" style="resize:none;overflow-y: scroll"></textarea>
                                  </div>

                                  <div class="form-group">
                                      <label>Upload Control File</label>
                                      <input type="file" id="fileupload" name="fileupload">
                                  </div>


                                  <div class="form-group">
                                      <label>Experiment Timeout<i>(Seconds)</i><b style='color: red'>*</b></label>
                                      <input class="form-control" type="text" id="timeout" name="timeout">
                                  </div>

                                  <div class="form-group">
                                      <label>Log Background Traffic</label>
                                      <select name="bglog" class="form-control">
                                          <option value="false">Yes</option>
                                          <option value="true">No</option>
                                      </select>
                                  </div>
                                  <div class="form-group">
                                      <input type='submit' class='btn btn-default' value='Start Experiment'  onclick='return checkFields();' >                                                    
                                  </div>

                              </div>

                          </div>
                          <!-- /.row (nested) -->
                      </div>
                      <!-- /.panel-body -->
                  </div>
                  <!-- /.panel -->
              </div>
              <!-- /.col-lg-12 -->
          </div>
                    <!-- /.row -->

          <div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          <b> Active Clients Information</b>
                      </div>
                      <!-- /.panel-heading -->
                      <div class="panel-body">
                          <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">

                              <thead>
                                  <tr>
                                      <th>#</th>
                                      <th>Select</th>
                                      <th>Mac Address</th>
                                      <th>SSID</th>
                                      <th>BSSID</th>
                                      <th>Latest HearBeat</th>

                                  </tr>
                              </thead>
                              <tbody>


                  <%
                     session.setAttribute("filter", null);
                     session.setAttribute("clientcount", null);

                     if (request.getParameter("getclient") != null) {

                         if (request.getParameter("filter").equals("bssid")) {

                             ConcurrentHashMap<String, DeviceInfo> clients = Constants.currentSession.getConnectedClients();
                             Enumeration<String> macList = clients.keys();
                             if (clients != null) {
    
                                 if (clients.size() == 0) {
                                     out.write("<tr><td colspan=\"7\">No Clients</td></tr>");
                                 } else {
                                     int i = 0;
                                     int flag = 0;
                                     while (macList.hasMoreElements()) {
                                         String macAddr = macList.nextElement();
                                         DeviceInfo device = clients.get(macAddr);

                                         CopyOnWriteArrayList<DeviceInfo> activeClient = Utils.activeClients();
                                         if (activeClient.contains(device)) {
                                             if (request.getParameter("bssid").equalsIgnoreCase(device.getBssid())) {
                                                 i++;
                                                 flag = 1;
                                                 out.write("<tr><td>" + i + "</td><td><input type=\"checkbox\" checked  name='selectedclient' value=\"" + macAddr + "\"/></td><td>" + macAddr + "</td><td>" + device.getSsid() + "</td><td>" + device.getBssid() + "</td><td>" + device.getLastHeartBeatTime() + "</td></tr>");
                                             }
                                         }
                                     }
                                     if (flag == 0) {
                                         out.write("<tr><td colspan=\"7\">No Active Client</td></tr>");
                                     }
                                 }
                             }
                         } else if (request.getParameter("filter").equals("ssid")) {

                             ConcurrentHashMap<String, DeviceInfo> clients = Constants.currentSession.getConnectedClients();
                             Enumeration<String> macList = clients.keys();
                             if (clients != null) {
    
                                 if (clients.size() == 0) {
                                     out.write("<tr><td colspan=\"7\">No Clients</td></tr>");
                                 } else {
                                     int i = 0;
                                     int flag = 0;
                                     while (macList.hasMoreElements()) {
                                         String macAddr = macList.nextElement();
                                         DeviceInfo device = clients.get(macAddr);
                                         CopyOnWriteArrayList<DeviceInfo> activeClient = Utils.activeClients();
                                         if (activeClient.contains(device)) {
                                             if (request.getParameter("ssid").equalsIgnoreCase(device.getSsid())) {
                                                 i++;
                                                 flag = 1;
                                                 out.write("<tr><td>" + i + "</td><td><input type=\"checkbox\" checked  name='selectedclient' value=\"" + macAddr + "\"/></td><td>" + macAddr + "</td><td>" + device.getSsid() + "</td><td>" + device.getBssid() + "</td><td>" + device.getLastHeartBeatTime() + "</td></tr>");
                                             }
                                         }
                                     }
                                     if (flag == 0) {
                                         out.write("<tr><td colspan=\"7\">No Active Client</td></tr>");
                                     }
                                 }
                             }

                         } else if (request.getParameter("filter").equals("manual")) {

                             ConcurrentHashMap<String, DeviceInfo> clients = Constants.currentSession.getConnectedClients();
                             Enumeration<String> macList = clients.keys();
                             if (clients != null) {
    
                                 if (clients.size() == 0) {
                                     out.write("<tr><td colspan=\"7\">No Clients</td></tr>");
                                 } else {
                                     int i = 0;
                                     int flag = 0;
                                     while (macList.hasMoreElements()) {
                                         String macAddr = macList.nextElement();
                                         DeviceInfo device = clients.get(macAddr);
                                         CopyOnWriteArrayList<DeviceInfo> activeClient = Utils.activeClients();
                                         if (activeClient.contains(device)) {
                                             i++;
                                             flag = 1;
                                             out.write("<tr><td>" + i + "</td><td><input type=\"checkbox\" checked  name='selectedclient' value=\"" + macAddr + "\"/></td><td>" + macAddr + "</td><td>" + device.getSsid() + "</td><td>" + device.getBssid() + "</td><td>" + device.getLastHeartBeatTime() + "</td></tr>");
                                         }
                                     }
                                     if (flag == 0) {
                                         out.write("<tr><td colspan=\"7\">No Active Client</td></tr>");
                                     }
                                 }
                             }

                         } else if (request.getParameter("filter").equals("random")) {
    

                             ConcurrentHashMap<String, DeviceInfo> clients = Constants.currentSession.getConnectedClients();
                             Enumeration<String> macList = clients.keys();
                             if (clients != null) {
    
                                 if (clients.size() == 0) {
                                     out.write("<tr><td colspan=\"7\">No Clients</td></tr>");
                                 } else {
                                     int i = 0;
                                     int count = 0;
                                     int flag = 0;
                                     while (macList.hasMoreElements()) {
                                         String macAddr = macList.nextElement();
                                         DeviceInfo device = clients.get(macAddr);

                                         CopyOnWriteArrayList<DeviceInfo> activeClient = Utils.activeClients();
                                         if (activeClient.contains(device)) {

                                             i++;
                                             count++;
                                             flag = 1;
                                             if (count <= Integer.parseInt(request.getParameter("random"))) {
                                                 out.write("<tr><td>" + i + "</td><td><input type=\"checkbox\" checked  name='selectedclient' value=\"" + macAddr + "\"/></td><td>" + macAddr + "</td><td>" + device.getSsid() + "</td><td>" + device.getBssid() + "</td><td>" + device.getLastHeartBeatTime() + "</td></tr>");
                                             } else {
                                                 out.write("<tr><td>" + i + "</td><td><input type=\"checkbox\"   name='selectedclient' value=\"" + macAddr + "\"/></td><td>" + macAddr + "</td><td>" + device.getSsid() + "</td><td>" + device.getBssid() + "</td><td>" + device.getLastHeartBeatTime() + "</td></tr>");
                                             }
                                         }

                                     }
                                     if (flag == 0) {
                                         out.write("<tr><td colspan=\"7\">No Active Client</td></tr>");
                                     }
                                 }
                             }
                         }
                 }
                  %>                 


                                        </tbody>
                                    </table>
                                    <!-- /.table-responsive -->

                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!--end Row -->

                </form>


            </div>


        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="/wicroft/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/wicroft/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="/wicroft/vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="/wicroft/vendor/raphael/raphael.min.js"></script>
        <script src="/wicroft/vendor/morrisjs/morris.min.js"></script>
        <script src="/wicroft/data/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/wicroft/dist/js/sb-admin-2.js"></script>
        <!-- DataTables JavaScript -->
        <script src="/wicroft/vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="/wicroft/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
        <script src="/wicroft/vendor/datatables-responsive/dataTables.responsive.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/wicroft/dist/js/sb-admin-2.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
                                                        $(document).ready(function () {
                                                            $('#dataTables-example').DataTable({
                                                                responsive: true
                                                            });
                                                        });
        </script>


        <script>

            function check() {

                document.getElementById('error').style.display = 'none';

                if (document.getElementById("expName").value == null || document.getElementById("expName").value == "") {
                    //alert("ExprimentName cannot be empty");
                    document.getElementById('error').style.display = 'block';
                    return false;
                }

                if (document.getElementById("fileupload").value == null || document.getElementById("fileupload").value == "") {
                    alert("Choose Control file");
                    return false;
                } else {
                    return true;
                }

            }



            function checkFields() {


                var inputElems = document.getElementsByTagName("input"),
                        count = 0;

                for (var i = 0; i < inputElems.length; i++) {
                    if (inputElems[i].type == "checkbox" && inputElems[i].checked == true) {
                        count++;
//                        alert("COUNT : " + count);
                    }
                }

                if (count == 0) {
                    alert("No clients selected");
                    return false;
                }

                //alert("COUNT : " + count);

//		alert(document.getElementsByName("selectedclient").length);
                if (document.getElementById("expName").value == null || document.getElementById("expName").value == "") {
                    alert("Experiment Name cannnot be empty");
                    return false;
                }

                if (document.getElementById("timeout").value == null || document.getElementById("timeout").value == "") {
                    alert("Experiment Timeout cannnot be empty");
                    return false;
                }

                if (document.getElementsByName("selectedclient").length <= 0) {
                    alert("No clients selected.");
                    return false;
                }
                return true;
            }

        </script>
<!--      <script type="text/javascript">
            $(document).ready(function () {
                $('#links').load('navigation.html');
                refresh();

            });
        </script>-->



    </body>

</html>


