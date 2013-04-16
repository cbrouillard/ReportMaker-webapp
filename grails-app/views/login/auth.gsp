<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<g:render template="/common/flashmessage"/>

<div class="row">
    <div class="span8">
        <div class="row around-border degrade-to-grey">
            <div class="span3 justify">

                <div id="myCarousel" class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                    </ol>
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="active item">
                            <img src="${resource(dir: 'images/mobapp', file: 'a_propos.png')}"
                                 alt="[TWR - Mobile - A propos]"/>

                            <div class="carousel-caption">
                                <h4>Une application pour votre mobile Android !</h4>

                                %{--<p>L'application pour Android est simple et claire : elle permet de créer--}%
                                %{--rapidement des rapports de bataille complets, incluants notes et photos.</p>--}%
                            </div>
                        </div>

                        <div class="item"><img src="${resource(dir: 'images/mobapp', file: 'creer.png')}"
                                               alt="[TWR - Mobile - Créer]"/>

                            <div class="carousel-caption">
                                <h4>Créer votre rapport en quelques secondes</h4>

                                %{--<p>Créer un rapport ne prend pas plus de 2 minutes : donnez un nom à votre--}%
                                %{--bataille, saisissez les noms ou pseudos des joueurs : c'est parti !</p>--}%
                            </div>

                        </div>

                        <div class="item center"><img
                                src="${resource(dir: 'images/mobapp', file: 'edition.png')}"
                                alt="[TWR - Mobile - Edition]"/>

                            <div class="carousel-caption">
                                <h4>Dans le feu de l'action !</h4>

                                %{--<p>Pendant votre partie, TWR fournit des emplacements pour prendre vos photos--}%
                                %{--au moment clés. Saisissez également vos notes : elles peuvent être succintes ou très--}%
                                %{--complètes selon le temps dont vous disposez.</p>--}%
                            </div>
                        </div>

                        <div class="item"><img
                                src="${resource(dir: 'images/mobapp', file: 'zoom.png')}"
                                alt="[TWR - Mobile - Zoom]"/>

                            <div class="carousel-caption">
                                <h4>Les photos sont accessibles</h4>

                                %{--<p>Les photos que vous prenez sont enregistrées sur votre appareil. Vous en faites--}%
                                %{--ce que vous voulez !</p>--}%
                            </div>
                        </div>

                        <div class="item"><img
                                src="${resource(dir: 'images/mobapp', file: 'liste.png')}"
                                alt="[TWR - Mobile - Liste]"/>

                            <div class="carousel-caption">
                                <h4>Tout vos rapports sont accessibles</h4>

                                %{--<p>Les rapports que vous enregistrés restent accessibles : éditez-les,--}%
                                %{--regardez-les, partagez-les !</p>--}%
                            </div>
                        </div>
                    </div>
                    <!-- Carousel nav -->
                    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                </div>

            </div>

            <div class="span4 justify">

                <p>Tactical War Report (TWR) est une application facilitant la rédaction de rapports de bataille pour vos parties de wargame.</p>

                <p>En quelques étapes, rédigez et partagez vos rapports de bataille:</p>

                <ul>
                    <li>téléchargez l'application pour votre appareil Android</li>
                    <li>créez votre rapport à partir de votre appareil mobile</li>
                    <li>jouez votre partie tout en prenant notes et photos</li>
                    <li>envoyez le tout sur votre compte TWR en ligne</li>
                    <li>partagez !</li>
                </ul>

                <p>C'est simple et c'est gratuit !</p>

                <div class="around-border center">
                    <a class="btn btn-large btn-success"
                       href="https://play.google.com/store/apps/details?id=com.headbangers.reportmaker"><g:message
                            code="download.mobile.app"/></a> <br/><br/>
                    <g:link class="btn btn-large btn-warning"
                            action="register"><g:message code="login.noaccount"/></g:link>
                </div>

            </div>

        </div>

    </div>

    <div class="span4">

        <form class="form-signin" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
            <h2 class="form-signin-heading alert alert-info"><g:message code="login.please.signin"/></h2>
            <input type="text" class="input-block-level" placeholder="${message(code: 'login.username')}"
                   name='j_username' required="true">
            <input type="password" class="input-block-level" placeholder="${message(code: 'login.password')}"
                   name='j_password' required="true">
            <label class="checkbox">
                <input type="checkbox" name='${rememberMeParameter}'
                       <g:if test='${hasCookie}'>checked='checked'</g:if>><g:message code="login.rememberme"/>
            </label>
            <button class="btn btn-large btn-primary" type="submit"><g:message code="login.submit"/></button>
        </form>


    </div>

</div>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->

</script>
</body>
</html>
