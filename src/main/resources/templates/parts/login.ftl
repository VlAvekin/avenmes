<#macro login path isRegisterForm>

 <div align="center" >
     <form action="${path}" method="post" >
         <#if !isRegisterForm>
             <#if !isRegisterForm>
             <a href="/registration" class="btn btn-primary">Add new user</a>
             </#if>
         </#if>
         <div class="form-group center" >
             <div class="col-sm-5">
                 <label class="col-form-label row"> User Name :</label>
                 <input class="form-control ${(usernameError??)?string('is-invalid', '')}"
                        type="text" name="username" placeholder="User name"
                        value="<#if user??>${user.username}</#if>"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
             </div>
         </div>
         <div class="form-group center">
             <div class="col-sm-5">
                 <label class="col-form-label row">Password:</label>
                 <input class="form-control ${(passwordError??)?string('is-invalid', '')}"
                        type="password" name="password" placeholder="Password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
             </div>
         </div>
    <#if isRegisterForm>
    <div class="form-group center">
        <div class="col-sm-5">
            <label class="col-form-label row">Password:</label>
            <input class="form-control ${(password2Error??)?string('is-invalid', '')}"
                   type="password2" name="password2" placeholder="Retype password"/>
            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group center">
        <div class="col-sm-5">
            <label class="col-form-label row">Email:</label>
            <input type="email" name="email"
                   class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="some@some.com"
                   value="<#if user??>${user.email}</#if>"/>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </div>
    </div>
    <div class="col-sm-5">
        <div class="g-recaptcha" data-sitekey="6LfdD2gUAAAAACrpJoMkxdYB2B5u3ZwSG401SAE9"></div>
        <#if captchaError??>
        <div class="alert alert-danger" role="alert">
            ${captchaError}
        </div>
        </#if>
    </div>
    </#if>
         <input type="hidden" name="_csrf" value="${_csrf.token}"/>
         <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
     </form>
 </div>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit">Sign Out</button>
</form>
</#macro>
