<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

<div align="center">
    <h1>Avenmes</h1>
</div>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
    </#if>
    <#if message??>
    <div class="alert alert-${messageType}" role="alert">
        ${message}
    </div>
    </#if>
    <@l.login "/login" false/>
</@c.page>
