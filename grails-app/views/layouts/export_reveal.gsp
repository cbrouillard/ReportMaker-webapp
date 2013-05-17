<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:message code="app.name"/></title>


    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>

<g:layoutBody/>

<r:layoutResources/>

<link rel="stylesheet" href="${resource(dir: 'js/reveal/css/', file: "reveal.min.css")}">
<link rel="stylesheet" href="${resource(dir: 'js/reveal/css/theme', file: "night.css")}" id="theme">

<script src="${resource(dir: 'js/reveal/lib/js/', file: "head.min.js")}"></script>
<script src="${resource(dir: 'js/reveal/js/', file: "reveal.js")}"></script>

<script>
    // Full list of configuration options available here:
    // https://github.com/hakimel/reveal.js#configuration
    Reveal.initialize({
        controls: true,
        progress: true,
        history: true,
        center: true,
        overview:false,

        theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
        transition: Reveal.getQueryHash().transition || 'fade' // default/cube/page/concave/zoom/linear/fade/none
    });

</script>

</body>
</html>
