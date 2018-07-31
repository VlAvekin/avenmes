<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
Login page
    ${message?ifExists}
<@l.login "/login" false/>
</@c.page>
