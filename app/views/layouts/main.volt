<div class="container">

    <div class="header">

        {{ elements.getMenu() }}

        <h3 class="text-muted"><!-- <img src="/img/logo.png" id="logo"> --> Diplom</h3>
    </div>

    <div class="row">
        <div class="col-sm-8 blog-main">
            {{ content() }}
        </div>
        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
            <!--<div class="sidebar-module">
                <button class="btn btn-md btn-primary btn-block" onclick="window.location='/index'">Про нас</button>
            </div>-->
            <div class="sidebar-module" style="background:url(/img/about.png) center center;">
                <a href="/about" style="text-decoration: none;outline: 0;">
                    <div class="inner-padding" style="color: #fff; overflow: hidden;text-align: center;">
                        <h4 style="margin-bottom: 20px;font-size: 20px;line-height: 30px;font-family: Georgia, serif;font-style: italic;">Хто ми?</h4>
                        <p style="margin: 0;font-size: 14px;line-height: 20px;text-transform: uppercase;">Група людей зацікавлених<br>
                             в розвитку ІТ сфери<br>
                            в Івано-Франківську</p>
                        <span style="margin: 15px 0px;display: block;font-size: 12px;font-family: Georgia, serif;font-style: italic;text-transform: none;" >— Детальніше —</span>
                    </div>
                </a>
            </div>
            <br>
            <div class="sidebar-module" style="text-align: center">
                <a href="http://vk.com/ifits" target="_blank"><img src="/img/vk.jpg"></a>
            </div>
            <br>
            <div class="sidebar-module" style="text-align: center">
                <h4>Віджети</h4>
                <div id="clock" class="light">
                    <div class="display">
                        <div class="weekdays"></div>
                        <div class="ampm"></div>
                        <div class="alarm"></div>
                        <div class="digits"></div>
                    </div>
                </div>
                <div id="converter" class="converter">
                    <h6>Конвертор</h6>
                    <select class="form-control" id="num_sys">
                        <option selected value="zero">Система числення</option>
                        <option value="bin">Двійкова</option>
                        <option value="oct">Вісімкова</option>
                        <option value="hex">Шістнадцяткова</option>
                    </select>
                    <div class="input-group" style="padding-top: 5px;">
                        <input type="text" class="form-control" placeholder="Число" id="num">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-pencil"></span></span>
                    </div>
                    <div class="input-group" style="padding-top: 5px;">
                        <input type="text" class="form-control" placeholder="Результат" id="result">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-ok"></span></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="blog-footer">
        <p>Flappy Team for ITdeya cup.</p>
        <p>
            <a id="up">Вверх</a>
        </p>
    </div>
</div>
