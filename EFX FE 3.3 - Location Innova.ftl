<?xml version="1.0"?>
<!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <head>

        <#if .locale == "ru_RU">
            <link
                    name="verdana"
                    type="font"
                    subtype="opentype"
                    src="${nsfont.verdana}"
                    src-bold="${nsfont.verdana_bold}"
                    bytes="2"/>
        </#if>
        <#assign addressCancelado=''>
        <#if record.custbody_efx_fe_cancelled== true >
            <#assign addressCancelado= 'FACTURA CANCELADA'>
        </#if>

        <macrolist>
            <macro id="watermark">
                <p
                        id="watermarkbody"
                        rotate="-30"
                        valign="middle"
                        align="center"
                        class="cancelada">
                    ${addressCancelado}
                </p>
            </macro>
            <macro id="nlheader">
                <table style="width: 100%; font-size: 10pt;">
                    <tr>
                        <td rowspan="3" style="padding: 0px; width: 33%;">
                            <#if companyInformation.logoUrl?length != 0>
                                <img src="${companyInformation.logoUrl}" style="float: left; margin: 7px;" width="140" height="70"/>
                            </#if>
                        </td>

                        <#assign address=''>
                        <#if record.custbody_efx_fe_location_address?has_content && record.custbody_efx_fe_location_address == true>
                            <#assign address= record.custbody_efx_fe_hiden_address_location>
                        <#else>
                            <#assign address= subsidiary.mainaddress_text></#if>

                        <td rowspan="3" style="padding: 0px; width: 33%;">
                                        <span style="font-size:10px;">${address}
                                          <br/> General de Ley Personas Morales
                                            <br/><strong>RFC:</strong>${subsidiary.federalidnumber}
                                        </span>
                        </td>
                        <td align="right" style="padding: 0;">
                                        <span style="font-size: 20pt;">
                                            Factura
                                        </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding: 0;">
                                        <span style="font-size: 14pt; color: #dd0000;">
                                            #${record.tranid}
                                        </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding: 4;">
                            ${record.trandate}
                        </td>
                    </tr>
                </table>
            </macro>
            <macro id="nlfooter">
                <table class="footer" style="width: 100%;">
                    <tr>
                        <td style="font-size: 6pt; text-align:left;">
                            ESTE DOCUMENTO ES UNA REPRESENTACIÓN IMPRESA DE UN CFDI.
                        </td>
                        <td align="right">
                            <pagenumber/>
                            de
                            <totalpages/>
                        </td>
                    </tr>
                </table>
            </macro>
        </macrolist>
        <style type="text/css">
            table {
            <#if .locale == "zh_CN"> font-family: stsong, sans-serif;
            <#elseif .locale == "zh_TW"> font-family: msung, sans-serif;
            <#elseif .locale == "ja_JP"> font-family: heiseimin, sans-serif;
            <#elseif .locale == "ko_KR"> font-family: hygothic, sans-serif;
            <#elseif .locale == "ru_RU"> font-family: verdana;
            <#else> font-family: sans-serif;
            </#if> font-size: 8pt;
                table-layout: fixed;
            }
            th {
                font-weight: bold;
                font-size: 8pt;
                vertical-align: middle;
                padding: 2px 3px 3px;
                background-color: #e3e3e3;
                color: #333333;
            }
            td {
                padding: 2px 3px;
            }
            b {
                font-weight: bold;
                color: #333333;
            }
            table.header td {
                padding: 0;
                font-size: 10pt;
            }
            table.footer td {
                padding: 0;
                font-size: 8pt;
            }
            table.itemtable th {
                padding-bottom: 5px;
                padding-top: 5px;
            }
            table.body td {
                padding-top: 3px;
            }
            table.total {
                page-break-inside: avoid;
            }
            tr.totalrow {
                background-color: #e3e3e3;
                line-height: 150%;
            }
            td.totalboxtop {
                font-size: 10pt;
                background-color: #e3e3e3;
            }
            td.addressheader {
                font-size: 8pt;
                padding-top: 6px;
                padding-bottom: 2px;
            }
            td.address {
                padding-top: 0;
            }
            td.totalboxmid {
                font-size: 24pt;
                padding-top: 18px;
                background-color: #e3e3e3;
            }
            td.totalboxbot {
                background-color: #e3e3e3;
                font-weight: bold;
            }
            span.title {
                font-size: 24pt;
            }
            span.number {
                font-size: 14pt;
            }
            span.itemname {
                font-weight: bold;
                line-height: 120%;
            }
            hr {
                width: 100%;
                color: #d3d3d3;
                background-color: #d3d3d3;
                height: 1px;
            }
            .cancelada {
                text-align: center;
                color: rgb(255, 102, 102);
                font-weight: bold;
                font-size: 100px;
                font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;

            }
            .nota{
                font-family: sans-serif;
                color:#c60a0a);

            }


        </style>
        <script>
            var w = window;
            if (w.performance || w.mozPerformance || w.msPerformance || w.webkitPerformance) {
                var d = document;
                AKSB = w.AKSB || {},
                    AKSB.q = AKSB.q || [],
                    AKSB.mark = AKSB.mark || function (e, _) {
                        AKSB
                            .q
                            .push([
                                "mark", e, _ || (new Date).getTime()
                            ])
                    },
                    AKSB.measure = AKSB.measure || function (e, _, t) {
                        AKSB
                            .q
                            .push([
                                "measure", e, _, t || (new Date).getTime()
                            ])
                    },
                    AKSB.done = AKSB.done || function (e) {
                        AKSB
                            .q
                            .push(["done", e])
                    },
                    AKSB.mark("firstbyte", (new Date).getTime()),
                    AKSB.prof = {
                        custid: "590700",
                        ustr: "",
                        originlat: "0",
                        clientrtt: "19",
                        ghostip: "189.247.214.4",
                        ipv6: false,
                        pct: "10",
                        clientip: "187.202.204.5",
                        requestid: "78e3429",
                        region: "11301",
                        protocol: "h2",
                        blver: 13,
                        akM: "x",
                        akN: "ae",
                        akTT: "O",
                        akTX: "1",
                        akTI: "78e3429",
                        ai: "384610",
                        ra: "false",
                        pmgn: "",
                        pmgi: "",
                        pmp: "",
                        qc: ""
                    },
                    function (e) {
                        var _ = d.createElement("script");
                        _.async = "async",
                            _.src = e;
                        var t = d.getElementsByTagName("script"),
                            t = t[t.length - 1];
                        t
                            .parentNode
                            .insertBefore(_, t)
                    }((
                        "https:" === d.location.protocol
                            ? "https:"
                            : "http:"
                    ) + "//ds-aksb-a.akamaihd.net/aksb.min.js")
            }
        </script>
        <script>
            var w = window;
            if (w.performance || w.mozPerformance || w.msPerformance || w.webkitPerformance) {
                var d = document;
                AKSB = w.AKSB || {},
                    AKSB.q = AKSB.q || [],
                    AKSB.mark = AKSB.mark || function (e, _) {
                        AKSB
                            .q
                            .push([
                                "mark", e, _ || (new Date).getTime()
                            ])
                    },
                    AKSB.measure = AKSB.measure || function (e, _, t) {
                        AKSB
                            .q
                            .push([
                                "measure", e, _, t || (new Date).getTime()
                            ])
                    },
                    AKSB.done = AKSB.done || function (e) {
                        AKSB
                            .q
                            .push(["done", e])
                    },
                    AKSB.mark("firstbyte", (new Date).getTime()),
                    AKSB.prof = {
                        custid: "590700",
                        ustr: "",
                        originlat: "0",
                        clientrtt: "17",
                        ghostip: "189.247.214.4",
                        ipv6: false,
                        pct: "10",
                        clientip: "187.202.204.5",
                        requestid: "7d80bed",
                        region: "11301",
                        protocol: "h2",
                        blver: 13,
                        akM: "x",
                        akN: "ae",
                        akTT: "O",
                        akTX: "1",
                        akTI: "7d80bed",
                        ai: "384610",
                        ra: "false",
                        pmgn: "",
                        pmgi: "",
                        pmp: "",
                        qc: ""
                    },
                    function (e) {
                        var _ = d.createElement("script");
                        _.async = "async",
                            _.src = e;
                        var t = d.getElementsByTagName("script"),
                            t = t[t.length - 1];
                        t
                            .parentNode
                            .insertBefore(_, t)
                    }((
                        "https:" === d.location.protocol
                            ? "https:"
                            : "http:"
                    ) + "//ds-aksb-a.akamaihd.net/aksb.min.js")
            }
        </script>
        <script>
            var w = window;
            if (w.performance || w.mozPerformance || w.msPerformance || w.webkitPerformance) {
                var d = document;
                AKSB = w.AKSB || {},
                    AKSB.q = AKSB.q || [],
                    AKSB.mark = AKSB.mark || function (e, _) {
                        AKSB
                            .q
                            .push([
                                "mark", e, _ || (new Date).getTime()
                            ])
                    },
                    AKSB.measure = AKSB.measure || function (e, _, t) {
                        AKSB
                            .q
                            .push([
                                "measure", e, _, t || (new Date).getTime()
                            ])
                    },
                    AKSB.done = AKSB.done || function (e) {
                        AKSB
                            .q
                            .push(["done", e])
                    },
                    AKSB.mark("firstbyte", (new Date).getTime()),
                    AKSB.prof = {
                        custid: "590700",
                        ustr: "",
                        originlat: "0",
                        clientrtt: "10",
                        ghostip: "189.247.214.4",
                        ipv6: false,
                        pct: "10",
                        clientip: "187.202.204.5",
                        requestid: "7da0307",
                        region: "11301",
                        protocol: "h2",
                        blver: 13,
                        akM: "x",
                        akN: "ae",
                        akTT: "O",
                        akTX: "1",
                        akTI: "7da0307",
                        ai: "384610",
                        ra: "false",
                        pmgn: "",
                        pmgi: "",
                        pmp: "",
                        qc: ""
                    },
                    function (e) {
                        var _ = d.createElement("script");
                        _.async = "async",
                            _.src = e;
                        var t = d.getElementsByTagName("script"),
                            t = t[t.length - 1];
                        t
                            .parentNode
                            .insertBefore(_, t)
                    }((
                        "https:" === d.location.protocol
                            ? "https:"
                            : "http:"
                    ) + "//ds-aksb-a.akamaihd.net/aksb.min.js")
            }
        </script>
    </head>
    <#if record.custbody_efx_fe_cancelled== true >
    <body
            background-macro="watermark"
            header="nlheader"
            header-height="15%"
            footer="nlfooter"
            footer-height="20pt"
            padding="0.5in 0.5in 0.5in 0.5in"
            size="Letter">
    <#else>
    <body
            header="nlheader"
            header-height="10%"
            footer="nlfooter"
            footer-height="20pt"
            padding="0.5in 0.5in 0.5in 0.5in"
            size="Letter">
    </#if>
    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <td
                    colspan="4"
                    style="font-size: 10pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); width: 25%;">Cliente:</td>
            <td
                    colspan="4"
                    style="font-size: 10pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); width: 25%;">Domicilio:</td>
            <td
                    colspan="5"
                    style="font-size: 12pt; background-color: #e3e3e3; font-weight: bold;">${record.total@label?upper_case}</td>
        </tr>
        <tr>
            <td colspan="4" style="padding: 0px; width: 25%; font-size: 8pt"><!--${record.entity?keep_after(" ")}<br/>${record.entity.addressee}<br/>-->
                <span style="font-size:10px;">${record.billingaddress.addressee}<br/>
                                       <strong>RFC:</strong><br/>${record.entity.vatregnumber}</span>
            </td>
            <td colspan="4" style="padding: 0px; width: 25%; font-size: 8pt">${record.billingaddress.custrecord_streetname}&nbsp;${record.billingaddress.custrecord_streetnum}<br/><#if record.billingaddress.custrecord_colonia?has_content>${record.billingaddress.custrecord_colonia},</#if>&nbsp;${record.billingaddress.custrecord_village}<br/><#if record.billingaddress.dropdownstate?has_content>${record.billingaddress.dropdownstate},</#if>${record.billingaddress.country}<br/>${record.billingaddress.zip}</td>
            <td
                    align="right"
                    colspan="5"
                    style="font-size: 22pt; padding-top: 20px; background-color: #e3e3e3;">${record.total}</td>
        </tr>
    </table>

    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th>Lugar de Expedici&oacute;n:</th>
            <th>Forma de Pago:</th>
            <th>Serie/Folio:</th>
        </tr>
        <tr>
            <!-- <td style="padding-top: 2px; font-size:
        8pt">${record.custbody_ix_fe_lugar_e}</td> -->
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_efx_fe_lugar_expedicion}</td>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_efx_fe_formapago.custrecord_efx_fe_fompago_codsat} - ${record.custbody_efx_fe_formapago}</td>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_efx_fe_serie}</td>
        </tr>
    </table>

    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th>Uso CFDI:</th>
            <th>M&eacute;todo de Pago:</th>
            <th>Folio Fiscal:</th>
        </tr>
        <tr>
            <td style="padding-top: 2px; font-size: 8pt; text-align:left;">${record.custbody_efx_fe_usocfdi}</td>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_efx_fe_metodopago.custrecord_efx_fe_mtdpago_codsat} - ${record.custbody_efx_fe_metodopago}</td>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_efx_fe_uuid}</td>
        </tr>
    </table>

    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th>Tipo de Comprobante:</th>
            <th>Condiciones de Pago:</th>
            <th>Fecha y Hora de Certificaci&oacute;n:</th>
        </tr>
        <tr>
            <td style="padding-top: 2px; font-size: 8pt">
                                    <span style="background-color: rgb(255, 255, 255);">
                                        <#assign recType=record.type>
                                        <#if recType == "custinvc">
                                            <#assign recType="I - INGRESO">
                                        <#elseif recType == "custcred">
                                            <#assign recType="E - EGRESO"></#if>
                                        ${recType}
            </span>
            </td>
            <td style="padding-top: 2px; font-size: 8pt">${record.terms}</td>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_efx_fe_fecha_timbrado}</td>
        </tr>
    </table>

    <table style="width: 100%; margin-top: 10px;">
        <tr>

            <th width="100%">No. de Pedido</th>

            <th width="100%">Moneda</th>
            <th width="100%">Tipo de Cambio</th>
        </tr>
        <tr>

            <td >${record.otherrefnum}</td>

            <td >${record.currency.symbol} - ${record.currency.name}</td>
            <td>${record.exchangerate?string("0.####")}</td>
        </tr>
    </table>


    <!--<if item.campo?has_content></if>-->


    <#if record.custbody_efx_fe_factura_global != ''>
        <p class="nota" id="itemFacGlb" valign="middle" align="center">
            NO SE PUEDEN CARGAR ARTICULOS DE FACTURA GLOBAL.
        </p>
    <#else>
        <#if record.item?has_content>
            <table class="itemtable" style="width: 100%; margin-top: 10px;">
                <!-- start items -->
                <#list record.item as item>
                    <#if item_index==0>
                        <thead>
                        <tr>
                            <th align="center" colspan="2" style="background-color: #999999; color: #fff;">Cant.</th>
                            <th align="center" colspan="10" style="background-color: #999999; color: #fff;">${item.item@label}</th>
                            <th align="center" colspan="4" style="background-color: #999999; color: #fff;">Cód. Artículo</th>
                            <th align="center" colspan="4" style="background-color: #999999; color: #fff;">Mes</th>
                            <th align="center" colspan="3" style="background-color: #999999; color: #fff;">Cód. Imp.</th>
                            <th align="center" colspan="3" style="background-color: #999999; color: #fff;">Impuesto</th>
                            <th align="center" colspan="3" style="background-color: #999999; color: #fff;">P. Unitario</th>
                            <th align="center" colspan="3" style="background-color: #999999; color: #fff;">${item.amount@label}</th>
                        </tr>

                        </thead>
                    </#if>
                    <tr style="font-size:8pt;">
                        <td align="center" colspan="2" line-height="150%">${item.quantity}</td>
                        <td colspan="10">
                            <span class="itemname">Código: ${item.item}</span>
                            <#if item.custcol_efx_fe_upc_code?has_content><br/>UPC: ${item.custcol_efx_fe_upc_code}</#if>
                            <#if item.description?has_content><br/>Descripción: ${item.description}</#if>
                            <#if item.custcol_efx_fe_serie_lote?has_content><br/>Serie/Lote: ${item.custcol_efx_fe_serie_lote}</#if>
                        </td>
                        <td colspan="4" align="left">Clave: ${item.custcol_efx_fe_clave_producto_sat}<br/>Unidad: ${item.custcol_efx_fe_unidad_medida_sat}</td>
                        <td align="center" colspan="4">${item.custcol_efx_af_mes}</td>
                        <td colspan="3">Tipo: ${item.custcol_efx_fe_tipo_impuesto}<br/>Tasa: ${item.taxrate1}</td>
                        <td align="right" colspan="3">${item.tax1amt}</td>
                        <td align="right" colspan="3">${item.rate}</td>
                        <td align="right" colspan="3">${item.amount}</td>
                    </tr>
                    <#if record.custbody_efx_fe_complemento_educativo?has_content &&
                    record.custbody_efx_fe_complemento_educativo == true >
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="27">
                                <#if item.custcol_efx_fe_com_edu_nom_alumn?has_content>Nombre del Alumno: ${item.custcol_efx_fe_com_edu_nom_alumn}<br/></#if>
                                <#if item.custcol_efx_fe_com_edu_nivel_edu?has_content>Nivel Educativo: ${item.custcol_efx_fe_com_edu_nivel_edu}<br/></#if>
                                <#if item.custcol_efx_fe_com_edu_curp?has_content>CURP: ${item.custcol_efx_fe_com_edu_curp}<br/></#if>
                                <#if item.custcol_efx_fe_com_edu_clave_autrvoe?has_content>AUTRVOE: ${item.custcol_efx_fe_com_edu_clave_autrvoe}<br/></#if>
                            </td>
                        </tr>
                    </#if>
                </#list>
                <!-- end items -->
            </table>

            <hr/>
            <!-- EFX FE - CE Descripciones específicas Numero de Serie
            custcol_efx_fe_ce_des_numero_serie -->
            <!-- EFX FE - CE Descripciones específicas Modelo custcol_efx_fe_ce_des_modelo
            -->
            <!-- EFX FE - CE Formula custcol_efx_fe_ce_formula -->
            <!-- EFX FE - CE Descripciones específicas Marca
            custcol_efx_fe_ce_des_especificas -->
            <!-- EFX FE - CE Valor dólares custcol_efx_fe_ce_val_dolares -->
            <!-- EFX FE - CE Valor Unitario Aduana custcol_efx_fe_ce_val_uni_aduana -->
            <!-- EFX FE - CE Unidad Aduana custcol_efx_fe_ce_uni_aduana -->
            <!-- EFX FE - CE Cantidad Aduana custcol_efx_fe_ce_cant_aduana -->
            <!-- EFX FE - CE Fracción arancelaria custcol_efx_fe_ce_frac_arancelari -->

            <#if record.custbody_efx_fe_ce?has_content && record.custbody_efx_fe_ce==true >
                <span style="font-size:10px;">
                                                    <br/>
                                                    <strong>Detalle del Complemento</strong>
                                                    <br/>
                                                </span>

                <table class="itemtable" style="width: 100%; margin-top: 10px;">
                    <!-- start items -->
                    <#list record.item as item>
                        <#if item_index==0>
                            <thead>
                            <tr>
                                <!-- <th align="center" colspan="3" style="background-color: #999999; color:
                                #fff;"> Formula</th> -->
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Fracción Arancelaria</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Unidad Aduana</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Cantidad Aduana</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Valor dólares</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Valor Unitario Aduana</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Numero de Serie</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Marca</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Modelo</th>
                            </tr>
                            </thead>
                        </#if>
                        <tr style="font-size:8pt;">
                            <!-- <td align="center" colspan="3">${item.custcol_efx_fe_ce_formula}</td> -->
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_frac_arancelaria}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_uni_aduana}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_cant_aduana}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_val_dolares}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_val_uni_aduana}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_des_numero_serie}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_des_especificas}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_des_modelo}</td>

                        </tr>
                    </#list>
                    <!-- end items -->
                </table>

                <hr/>
            </#if>
        </#if>

        <table class="total" style="width: 100%; margin-top: 1px;">


            <tr>
                <td colspan="3">&nbsp;</td>
                <td align="right">
                    <b>${record.subtotal@label}</b>
                </td>
                <td align="right">${record.subtotal}</td>
            </tr>

            <tr>
                <td colspan="3">&nbsp;</td>
                <td align="right">
                    <b>Descuento</b>
                </td>
                <td align="right">${record.discounttotal}</td>
            </tr>

            <tr>
                <td colspan="3">&nbsp;</td>
                <td align="right">
                    <b>Impuesto</b>
                </td>
                <td align="right">${record.taxtotal}</td>
            </tr>
            <tr class="totalrow">
                <td background-color="#ffffff" colspan="3">&nbsp;</td>
                <td align="right" style="background-color: #000000; color: #fff;">
                    <strong>${record.total@label}</strong>
                </td>
                <td align="right" style="background-color: #000000; color: #fff;">${record.total}</td>
            </tr>

        </table>
        <#if record.custbody_efx_fe_monto_letra!=''>

            <table style="width: 100%;">
                <tr>
                    <td width="100%"></td>
                </tr>

                <tr>
                    <th width="100%">Monto</th>
                </tr>
                <tr>
                    <td >${record.custbody_efx_fe_monto_letra}</td>
                </tr>
            </table>
            <!-- <tr style="width: 100%; "> <td align="right" style="background-color:
#999999; color:
#fff;"><strong>${record.custbody_efx_fe_monto_letra@label}</strong></td> <td
colspan="6" width="100%" align="right"
>${record.custbody_efx_fe_monto_letra}</td> </tr> -->
        </#if>
    </#if>

    <!-- <br/> -->
    <#if record.memo != ''>
        <table style="width: 100%;">
            <tr>
                <th width="100%">Observaciones</th>
            </tr>
            <tr>
                <td >${record.memo}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>

    </#if>



    <#if record.custbody_efx_fe_ce_certificado_origen?has_content>
        <#assign certificado_origen=record.custbody_efx_fe_ce_certificado_origen>
    <#else>
        <#assign certificado_origen="No Funge con certificado origen">
    </#if>

    <#if record.custbody_efx_fe_ce?has_content && record.custbody_efx_fe_ce == true>
        <table style="width: 100%; ">
            <tr>
                <th >Tipo de Cambio</th>
            </tr>
            <tr>
                <td style="align: left;">${record.custbody_efx_fe_ce_exchage} </td>
            </tr>
            <tr>
                <th >Certificado de Origen</th>
            </tr>
            <tr>
                <td style="align: left;">${certificado_origen} </td>
            </tr>
            <tr>
                <th >Clave de Incoterm</th>
            </tr>
            <tr>
                <td style="align: left;">${record.custbody_efx_fe_ce_incoterm} </td>
            </tr>
            <tr>
                <th >Subdivision</th>
            </tr>
            <tr>
                <td style="align: left;">${record.custbody_efx_fe_ce_subdivision} </td>
            </tr>
            <tr>
                <th >Destinatario</th>
            </tr>
            <tr>
                <td style="align: left;">${record.custbody_efx_fe_ce_destinatario_name} </td>
            </tr>
            <tr>
                <th >Numero de Registro de destinat</th>
            </tr>
            <tr>
                <td style="align: left;">${record.custbody_efx_fe_ce_destin_num_reg} </td>
            </tr>

        </table>
        <br/>
    </#if>
    <!-- TIMBRE DEL SAT -->

    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <td valign="top" align="left" width="25%">
                <#if record.custbody_efx_fe_qr != ''>
                    <!-- undefined<a href="https://www.the-qrcode-generator.com/"> <img
            src="https://chart.googleapis.com/chart?chs=110x110&amp;cht=qr&amp;chld=|1&amp;chl=${record.custbody_efx_fe_qr}"
            /> </a> -->
                    <barcode
                            codetype="qrcode"
                            width="45mm"
                            height="45mm"
                            value="${record.custbody_efx_fe_qr}"/>
                </#if>
            </td>
            <td>
                <table style="width: 100%; margin-top: 10px;">
                    <tr>
                        <th >Cadena original del complemento de certificación digital del SAT</th>
                    </tr>
                    <tr>
                        <td style="align: left;">${record.custbody_efx_fe_cadena}</td>
                    </tr>
                    <tr>
                        <th>Sello digital del CFDI</th>
                    </tr>
                    <tr>
                        <td style="align: left;">${record.custbody_efx_fe_sellocfd}</td>
                    </tr>
                    <tr>
                        <th>Sello digital del SAT</th>
                    </tr>
                    <tr>
                        <td style="align: left;">${record.custbody_efx_fe_sellosat}</td>
                    </tr>

                    <#if record.custbody_efx_fe_cfdi_rel != ''>
                        <tr>
                            <th>CFDI's Relacionados</th>
                        </tr>
                        <tr>
                            <td style="align: left;">${record.custbody_efx_fe_cfdi_rel}</td>
                        </tr>
                    </#if>
                </table>
            </td>
        </tr>
    </table>
    </body>
</pdf>