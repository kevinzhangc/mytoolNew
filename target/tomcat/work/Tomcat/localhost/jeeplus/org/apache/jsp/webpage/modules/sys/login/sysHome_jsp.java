/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-01-30 09:32:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.webpage.modules.sys.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class sysHome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

private static org.apache.jasper.runtime.ProtectedFunctionMapper _jspx_fnmap_0;

static {
  _jspx_fnmap_0= org.apache.jasper.runtime.ProtectedFunctionMapper.getMapForFunction("fns:getAdminPath", com.jeeplus.common.config.Global.class, "getAdminPath", new Class[] {});
}

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/WEB-INF/tlds/menu.tld", Long.valueOf(1495040902485L));
    _jspx_dependants.put("/webpage/include/taglib.jsp", Long.valueOf(1496543662854L));
    _jspx_dependants.put("/WEB-INF/tlds/fns.tld", Long.valueOf(1497955049550L));
    _jspx_dependants.put("/WEB-INF/tlds/shiros.tld", Long.valueOf(1495040902489L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write('\n');
      if (_jspx_meth_c_005fset_005f1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\t<title>首页</title>\n");
      out.write("\t<meta name=\"decorator\" content=\"ani\"/>\n");
      out.write("\t<style>\n");
      out.write("\n");
      out.write("\t\t#body-container {\n");
      out.write("\t\t\tmargin-left: 0px !important;\n");
      out.write("\t\t\t/**padding: 10px;*/\n");
      out.write("\t\t\tmargin-top: 0px !important;\n");
      out.write("\t\t\toverflow-x: hidden!important;\n");
      out.write("\t\t\ttransition: all 0.2s ease-in-out !important;\n");
      out.write("\t\t\theight: 100% !important;\n");
      out.write("\t\t}\n");
      out.write("\t</style>\n");
      out.write("</head>\n");
      out.write("<body class=\"\">\n");
      out.write("<div id=\"body-container\" class=\"wrapper wrapper-content\">\n");
      out.write("\t<div class=\"conter-wrapper home-container\">\n");
      out.write("\t\t<div class=\"row home-row\">\n");
      out.write("\t\t\t<div class=\"col-md-4 col-lg-3\">\n");
      out.write("\t\t\t\t<div class=\"home-stats\">\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"stat hvr-wobble-horizontal\">\n");
      out.write("\t\t\t\t\t\t<div class=\" stat-icon\">\n");
      out.write("\t\t\t\t\t\t\t<i class=\"fa fa-cloud-upload fa-4x text-info \"></i>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\" stat-label\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"label-header\">\n");
      out.write("\t\t\t\t\t\t\t\t88%\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"progress-sm progress ng-isolate-scope\" value=\"progressValue\" type=\"info\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"progress-bar progress-bar-info\" role=\"progressbar\"\n");
      out.write("\t\t\t\t\t\t\t\t\t aria-valuenow=\"88\" aria-valuemin=\"0\" aria-valuemax=\"100\"  style=\"width: 88%;\">\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"clearfix stat-detail\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"label-body\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<i class=\"fa fa-arrow-circle-o-right pull-right text-muted\"></i>服务正常运行时间\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</a>\t\t\t\t\t<a href=\"#\" class=\"stat hvr-wobble-horizontal\">\n");
      out.write("\t\t\t\t\t<div class=\" stat-icon\">\n");
      out.write("\t\t\t\t\t\t<i class=\"fa fa-heartbeat fa-4x text-success \"></i>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\" stat-label\">\n");
      out.write("\t\t\t\t\t\t<div class=\"label-header\">\n");
      out.write("\t\t\t\t\t\t\t94%\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"progress-sm progress ng-isolate-scope\" value=\"progressValue\" type=\"info\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"progress-bar progress-bar-success\" role=\"progressbar\"\n");
      out.write("\t\t\t\t\t\t\t\t aria-valuenow=\"94\" aria-valuemin=\"0\" aria-valuemax=\"100\"  style=\"width: 94%;\">\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix stat-detail\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"label-body\">\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"fa fa-arrow-circle-o-right pull-right text-muted\"></i>积极反馈\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</a>\t\t\t\t\t<a href=\"#\" class=\"stat hvr-wobble-horizontal\">\n");
      out.write("\t\t\t\t\t<div class=\" stat-icon\">\n");
      out.write("\t\t\t\t\t\t<i class=\"fa fa-flag fa-4x text-danger \"></i>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\" stat-label\">\n");
      out.write("\t\t\t\t\t\t<div class=\"label-header\">\n");
      out.write("\t\t\t\t\t\t\t88%\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"progress-sm progress ng-isolate-scope\" value=\"progressValue\" type=\"info\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"progress-bar progress-bar-danger\" role=\"progressbar\"\n");
      out.write("\t\t\t\t\t\t\t\t aria-valuenow=\"88\" aria-valuemin=\"0\" aria-valuemax=\"100\"  style=\"width: 88%;\">\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix stat-detail\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"label-body\">\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"fa fa-arrow-circle-o-right pull-right text-muted\"></i>机器负载\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</a>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"col-md-4 col-lg-6\">\n");
      out.write("\t\t\t\t<div class=\"home-charts-middle\">\n");
      out.write("\t\t\t\t\t<div class=\"chart-container\">\n");
      out.write("\t\t\t\t\t\t<div class=\"chart-comment clearfix\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"text-primary pull-left\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"comment-header\">55%</span><br />\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"comment-comment\">搜素引擎</span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"text-success pull-left m-l\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"comment-header\">25%</span><br />\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"comment-comment\">自主访问</span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"text-warning pull-left m-l\">\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"comment-header\">20%</span><br />\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"comment-comment\">友情链接</span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div id=\"lineChart\" style=\"height:250px\"></div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"col-md-4 col-lg-3\">\n");
      out.write("\t\t\t\t<div class=\"home-charts-right\">\n");
      out.write("\t\t\t\t\t<div class=\"top-right-chart\">\n");
      out.write("\t\t\t\t\t\t<div id=\"cbar\" style=\"height:150px; padding-top:7px;\"></div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"bottom-right-chart\">\n");
      out.write("\t\t\t\t\t\t<div class=\"top-left-chart clearfix\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-sm-6 text-left\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"padder\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"heading\">本周访问人数 : </span><br />\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<big class=\"text-primary\">22068</big>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-sm-6\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div id=\"pie\"  style=\"height:125px; padding-top:8px;\"></div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"row home-row\">\n");
      out.write("\t\t\t<div class=\"col-lg-8 col-md-6\">\n");
      out.write("\t\t\t\t<div class=\"map-container box padder\">\n");
      out.write("\t\t\t\t\t<div id=\"world-map\" style=\"width: 100%; height: 320px\"></div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"col-lg-4 col-md-6\">\n");
      out.write("\t\t\t\t<div class=\"todo-container panel panel-danger\">\n");
      out.write("\t\t\t\t\t<div class=\"panel-heading\">\n");
      out.write("\t\t\t\t\t\t<div class=\"todo-header text-center\">\n");
      out.write("\t\t\t\t\t\t\t<h4><i class=\"fa fa-tasks\"></i>&nbsp;待办任务</h4>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"panel-body bg-danger\">\n");
      out.write("\t\t\t\t\t\t<div class=\"todo-body\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"todo-list-wrap\">\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"todo-list\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label class=\"checkbox1\" for=\"option1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input id=\"option1\" type=\"checkbox\" class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"done-false\">9:00开晨会安排工作</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label class=\"checkbox1\" for=\"option3\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input id=\"option3\" type=\"checkbox\" class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"done-false\">9:00~12:00客户需求分析</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label class=\"checkbox1\" for=\"option4\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input id=\"option4\" type=\"checkbox\" class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"done-false\">12:00和客户电话会议</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label class=\"checkbox1\" for=\"option5\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input id=\"option5\" type=\"checkbox\" class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"done-false\">2:00参加技术论坛</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label class=\"checkbox1\" for=\"option2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input id=\"option2\" type=\"checkbox\" class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"done-false\">5:00晚会总结进度</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<form class=\"form-horizontal todo-from-bottom\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"col-sm-12\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" placeholder=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span class=\"input-group-btn\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<button class=\"btn btn-default\" type=\"submit\">增加</button>\n");
      out.write("\t\t\t\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("<script src=\"vendor/ckeditor/ckeditor.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"js/vendor.js\"></script>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    $(function(){\n");
      out.write("        $('#calendar2').fullCalendar({\n");
      out.write("            eventClick: function(calEvent, jsEvent, view) {\n");
      out.write("                alert('Event: ' + calEvent.title);\n");
      out.write("                alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);\n");
      out.write("                alert('View: ' + view.name);\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        $('#rtlswitch').click(function() {\n");
      out.write("            console.log('hello');\n");
      out.write("            $('body').toggleClass('rtl');\n");
      out.write("\n");
      out.write("            var hasClass = $('body').hasClass('rtl');\n");
      out.write("\n");
      out.write("            $.get('/api/set-rtl?rtl='+ (hasClass ? 'rtl': ''));\n");
      out.write("\n");
      out.write("        });\n");
      out.write("        $('.theme-picker').click(function() {\n");
      out.write("            changeTheme($(this).attr('data-theme'));\n");
      out.write("        });\n");
      out.write("        $('#showMenu').click(function() {\n");
      out.write("            $('body').toggleClass('push-right');\n");
      out.write("        });\n");
      out.write("\n");
      out.write("    });\n");
      out.write("    function changeTheme(the) {\n");
      out.write("        $(\"#current-theme\").remove();\n");
      out.write("        $('<link>')\n");
      out.write("            .appendTo('head')\n");
      out.write("            .attr('id','current-theme')\n");
      out.write("            .attr({type : 'text/css', rel : 'stylesheet'})\n");
      out.write("            .attr('href', '/css/app-'+the+'.css');\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    $(function(){\n");
      out.write("        setTimeout(function() {\n");
      out.write("            var chart = c3.generate({\n");
      out.write("                bindto: '#lineChart',\n");
      out.write("                data: {\n");
      out.write("                    columns: [\n");
      out.write("                        ['搜索引擎', 30, 200, 100, 400, 150, 250],\n");
      out.write("                        ['自主访问', 50, 120, 210, 140, 115, 425],\n");
      out.write("                        ['友情链接', 40, 150, 98, 300, 175, 100]\n");
      out.write("                    ]\n");
      out.write("                },\n");
      out.write("                color: {\n");
      out.write("                    pattern: ['#3CA2E0','#5CB85C','#F1B35B']\n");
      out.write("                },\n");
      out.write("                axis: {\n");
      out.write("                    x: {\n");
      out.write("                        show: false\n");
      out.write("                    },\n");
      out.write("                    y: {\n");
      out.write("                        show: false\n");
      out.write("                    },\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        }, 275);\n");
      out.write("        setTimeout(function() {\n");
      out.write("            $('#world-map').vectorMap({\n");
      out.write("                backgroundColor: '#FFF',\n");
      out.write("                regionStyle: {\n");
      out.write("                    initial: {\n");
      out.write("                        fill: 'black',\n");
      out.write("                        \"fill-opacity\": 1,\n");
      out.write("                        stroke: 'none',\n");
      out.write("                        \"stroke-width\": 0,\n");
      out.write("                        \"stroke-opacity\": 1\n");
      out.write("                    },\n");
      out.write("                    hover: {\n");
      out.write("                        \"fill-opacity\": 0.8,\n");
      out.write("                        cursor: 'pointer',\n");
      out.write("                    },\n");
      out.write("                    selected: {\n");
      out.write("                        fill: 'red'\n");
      out.write("                    },\n");
      out.write("                    selectedHover: {\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        }, 275);\n");
      out.write("        setTimeout(function() {\n");
      out.write("            var chart2 = c3.generate({\n");
      out.write("                bindto: '#cbar',\n");
      out.write("                data: {\n");
      out.write("                    columns: [\n");
      out.write("                        [10,40,20,90,35,70,10,50,20,80,60,10,20,40,70]\n");
      out.write("                    ],\n");
      out.write("                    type:'bar'\n");
      out.write("                },\n");
      out.write("                bar: {\n");
      out.write("                    width: {\n");
      out.write("                        ratio: 0.5 // this makes bar width 50% of length between ticks\n");
      out.write("                    }\n");
      out.write("                },\n");
      out.write("                color: {\n");
      out.write("                    pattern: ['#DB5B57']\n");
      out.write("                },\n");
      out.write("                labels: true,\n");
      out.write("                legend: {\n");
      out.write("                    show: 0\n");
      out.write("                },\n");
      out.write("                axis: {\n");
      out.write("                    x: {\n");
      out.write("                        show: false\n");
      out.write("                    },\n");
      out.write("                    y: {\n");
      out.write("                        show: false\n");
      out.write("                    },\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("\n");
      out.write("        }, 275);\n");
      out.write("        setTimeout(function() {\n");
      out.write("            var chart = c3.generate({\n");
      out.write("                bindto: '#pie',\n");
      out.write("                data: {\n");
      out.write("                    // iris data from R\n");
      out.write("                    columns: [\n");
      out.write("                        ['data1', 11],\n");
      out.write("                        ['data2', 23],\n");
      out.write("                        ['data3', 66]\n");
      out.write("                    ],\n");
      out.write("                    type : 'pie',\n");
      out.write("                },\n");
      out.write("                color: {\n");
      out.write("                    pattern: ['#5CB85C','#F0AD4E','#3CA2E0']\n");
      out.write("                },\n");
      out.write("                legend: {\n");
      out.write("                    show: 0\n");
      out.write("                },\n");
      out.write("            });\n");
      out.write("\n");
      out.write("        }, 275);\n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f0.setParent(null);
    // /webpage/include/taglib.jsp(11,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setVar("ctx");
    // /webpage/include/taglib.jsp(11,0) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}${fns:getAdminPath()}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, _jspx_fnmap_0, false));
    int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
    if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fset_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f1.setParent(null);
    // /webpage/include/taglib.jsp(12,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f1.setVar("ctxStatic");
    // /webpage/include/taglib.jsp(12,0) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}/static", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
    int _jspx_eval_c_005fset_005f1 = _jspx_th_c_005fset_005f1.doStartTag();
    if (_jspx_th_c_005fset_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
    return false;
  }
}
