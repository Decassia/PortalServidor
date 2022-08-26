<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="initial-scale = 1.0">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

    <r:require modules="scaffolding"/>
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>

<div class="container">
    <g:layoutBody/>
</div>

<r:layoutResources/>

<script type="text/javascript">
    $(document).ready(function(){
        //configura que todo campo que tiver a classe contato vai ter mascara
       // $(".contato").mask("(99)9999-9999");
        //configura que todo campo que tiver a classe data vai ter mascara
        $(".data").mask("99/99/9999");
    });


</script>


</body>
</html>