<div class="reveal">
    <div class="slides">
        <section>
            <h1>${report.name}</h1>

            <h3><g:message code="app.name"/></h3>

            <p>
                Rapport de bataille par ${report.owner.username}<br/>
                <small>${report.one.name} vs ${report.two.name}</small><br/>

                <g:if test="${report.one.race && report.two.race}">
                    <small>${report.one.race} vs ${report.two.race}</small><br/>
                </g:if>

                <g:if test="${report.format}">
                    <small>${report.format}</small><br/>
                </g:if>

            </p>

            <p>
                <small>Naviguez avec les touches <span class="key">→</span> et <span class="key">↓</span> de votre clavier</small>
            </p>

        </section>

        <section>
            <section>
                <h1><g:message code="before.game"/></h1>

                <ul>
                    <li>Table</li>
                    <li>Infos joueurs</li>
                    <li>Déploiement</li>
                    <li>Infiltration</li>
                    <li>Mouvements scouts</li>
                </ul>

                %{--<a href="#" class="image navigate-down">--}%
                %{--<img width="178" height="238" src="https://s3.amazonaws.com/hakim-static/reveal-js/arrow.png" alt="Down arrow">--}%
                %{--</a>--}%

            </section>
            <section>
                <h1>Déploiement</h1>
            </section>
        </section>



        <g:set var="reportDone" value="${false}"/>
        <g:each var="turn" in="${report.turns}">

            <g:if test="${!reportDone}">
                <section>
                    <h1>Tour #${turn.num}</h1>
                </section>

                <g:if test="${turn.lastOne}">
                    <g:set var="reportDone" value="${true}"/>
                </g:if>

            </g:if>

        </g:each>

    </div>
</div>

<div class="footer-reveal" style="position: fixed; bottom: 5px; z-index: 20;text-align: center;padding-left:20px;color:white;">

    <g:render template="/export/share"/>
    <p>© BROUILLARD Cyril - 2013 - <g:message
            code="app.name"/> - <g:message code="app.disclaimer"/></p>

</div>