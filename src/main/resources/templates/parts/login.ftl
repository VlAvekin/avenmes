<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> User Name :</label>
        <div class="col-sm-5">
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
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-5">
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
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-5">
            <input class="form-control ${(password2Error??)?string('is-invalid', '')}"
                   type="password2" name="password2" placeholder="Retype password"/>
            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-5">
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
        <div class="g-recaptcha" data-sitekey="6LfmA2gUAAAAAKvFPn6hDUP5k5LRluNqfm4jdY4m"></div>
        <#if captchaError??>
        <div class="alert alert-danger" role="alert">
            ${captchaError}
        </div>
        </#if>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm>
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
    </#if>
    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit" >Sign Out</button>
</form>
</#macro>
