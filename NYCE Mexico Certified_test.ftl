<?xml version="1.0"?>
<!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <#if custom?has_content>
        <#if custom.certData?has_content>
            <#assign "certData" = custom.certData>
        <#else>
            <#assign "certData" = record>  
        </#if>
    <#else>
        <#assign "certData" = record>
    </#if>
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
                <table style="width: 100%; font-size: 10pt; border-top: 1px;  border-bottom: 1px">
                    <tr>
                        <td rowspan="3" style="padding: 0px; width: 22%;">
                            <#if record.custbody_efx_fe_logosub?has_content>
                                <#assign "urldir" = "https://system.netsuite.com" + record.custbody_efx_fe_logosub>
                                <img src="${urldir}" style="float: left; margin: 3px; width: 140px; height: 70px;"/>
                            </#if>
                        </td>

                        <td rowspan="3" style="padding: 0px; width: 33%;">
                            <span style="font-size:8px;">${record.custbody_efx_fe_dirsubs?upper_case} <br />
                            <strong>Folio Fiscal:</strong> ${certData.custbody_mx_cfdi_uuid}<br />
                            <strong>Fecha de expedición:</strong> ${certData.custbody_mx_cfdi_certify_timestamp}<br />
                            <strong>No. Serie del Certificado CSD:</strong> ${certData.custbody_mx_cfdi_issuer_serial}</span>
                        </td>
                        <td  align="right" rowspan="3" style="padding: 0px; width: 20%;">
                           
                        </td>
                        <td align="right"  rowspan="3" style="padding: 0px; width: 20%;">
                            <span>
                                <strong>Factura</strong></span>
                            <br />
                                #${record.tranid}
                            <br />
                          <span style="font-size:8px;">
                            <strong>Lugar de expedición:</strong></span>
                          <br /><span style="font-size:8px;">
                          ${record.location.custrecord_efx_lugar_expedicion} 
                          <#if record.location?contains("Ciudad") > Ciudad de México
                            <#elseif record.location?contains("Juarez")> Ciudad Juarez <br/> <b>Sucursal Juarez</b>
                              <#elseif record.location?contains("Guadalajara")> Guadalajara <br/> <b>Sucursal Guadalajara</b>
                                <#elseif record.location?contains("Monterrey")> Monterrey <br/> <b>Sucursal Monterrey</b>
                                  <#elseif record.location?contains("Tijuana")> Tijuana <br/> <b>Sucursal Tijuana</b>
                                  <#else>
                         </#if>
                         </span>
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
                        td.pb { page-break-after:always}
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
    header-height="9%"
    footer="nlfooter"
    footer-height="20pt"
    padding="0.5in 0.5in 0.5in 0.5in"
    size="Letter">
    <#else>
    <body
        header="nlheader"
        header-height="9%"
        footer="nlfooter"
        footer-height="20pt"
        padding="0.5in 0.5in 0.5in 0.5in"
        size="Letter">
    </#if>
    <#if record.subsidiary?contains("MX05")>
    <table style="width: 100%; border-bottom: 1px">
    <tr>
            <td
                colspan="4"
                style="font-size: 10pt; font-weight: bold; color: rgb(51, 51, 51);" align="center">Sucursal Guadalajara</td>
            <td
                colspan="4"
                style="font-size: 10pt; font-weight: bold; color: rgb(51, 51, 51);"  align="center">Sucursal Monterrey</td>
            <td
                colspan="4"
                style="font-size: 10pt; font-weight: bold; color: rgb(51, 51, 51);"  align="center">Sucursal Tijuana</td>
            <td
                colspan="4"
                style="font-size: 10pt; font-weight: bold; color: rgb(51, 51, 51);"  align="center">Sucursal Juarez</td>
        </tr>
    <tr>
            <td
                colspan="4"
                style="font-size: 7pt; color: rgb(51, 51, 51);" align="center"><p style="text-align: center;">Francisco Rojas González 407<br/>Col. Ladrón De Guevara<br/>C.P. 44600 Guadalajara, Jal.<br/>Tel.: (0133) 3810-8011 Fax: 3810-8020</p></td>
            <td
                colspan="4"
                style="font-size: 7pt; color: rgb(51, 51, 51);" align="center"><p style="text-align: center;">Calle Jardín de San Jerónimo No. 216<br/>Interior A, Col. San Jerónimo<br/>C.P. 64640 Monterrey, N.L.<br/>Tel.: (0181) 8335-5990 Fax: 8100-9688</p></td>
            <td
                colspan="4"
                style="font-size: 7pt; color: rgb(51, 51, 51);" align="center"><p style="text-align: center;">Blvd. Díaz Ordaz No. 12415<br/>Interior AC-1, Col. El Paraiso<br/>C.P. 22106 Tijuana, B.C.<br/>Tel.: (01664) 686-6728 Fax: 686-6727</p></td>
            <td
                colspan="4"
                style="font-size: 7pt; color: rgb(51, 51, 51);" align="center"><p style="text-align: center;">Blvd. Tomas Fernández N° 7930<br/>Interior 305 B Col. Campestre Juárez<br/>C.P. 32460 Cd. Juárez, Chih.<br/>Tel.: (01656) 629-0959 Fax: 648-7024</p></td>
        </tr>
    </table>
        </#if>
    <table style="width: 100%; ">
        <tr>
            <td
                colspan="1"
                style="font-size: 8pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); "><strong>Nombre: </strong></td>
            <td
                colspan="3"
                style="font-size: 8pt; padding: 6px 0px 2px;  color: rgb(51, 51, 51);">${record.entity.custentity_tkio_full_name}</td>
            <#assign uso_cfdi = record.custbody_mx_cfdi_usage?keep_before(" ")>
            <td
                colspan="1"
                style="font-size: 8pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); "><strong>Uso de CFDI: </strong></td>
            <#if uso_cfdi == "D01">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D01 - HONORARIOS MÉDICOS, DENTALES Y GASTOS HOSPITALARIOS</td>
                            <#elseif uso_cfdi == "D02">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D02 - GASTOS MÉDICOS POR INCAPACIDAD O DISCAPACIDAD</td>
                            <#elseif uso_cfdi == "D03">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D03 - GASTOS FUNERALES</td>
                            <#elseif uso_cfdi == "D04">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D04 - DONATIVOS</td>
                            <#elseif uso_cfdi == "D05">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D05 - INTERESES REALES EFECTIVAMENTE PAGADOS POR CRÉDITOS HIPOTECARIOS (CASA HABITACIÓN)</td>
                            <#elseif uso_cfdi == "D06">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D06 - APORTACIONES VOLUNTARIAS AL SAR</td>
                            <#elseif uso_cfdi == "D07">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D07 - PRIMAS POR SEGUROS DE GASTOS MÉDICOS</td>
                            <#elseif uso_cfdi == "D08">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D08 - GASTOS DE TRANSPORTACIÓN ESCOLAR OBLIGATORIA</td>
                            <#elseif uso_cfdi == "D09">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D09 - DEPÓSITOS EN CUENTAS PARA EL AHORRO, PRIMAS QUE TENGAN COMO BASE PLANES DE PENSIONES</td>
                            <#elseif uso_cfdi == "D10">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">D10 - PAGOS POR SERVICIOS EDUCATIVOS (COLEGIATURAS)</td>
                            <#elseif uso_cfdi == "G01">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">G01 - ADQUISICIÓN DE MERCANCÍAS</td>
                            <#elseif uso_cfdi == "G02">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">G02 - DEVOLUCIONES, DESCUENTOS O BONIFICACIONES</td>
                            <#elseif uso_cfdi == "G03">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">G03 - GASTOS EN GENERAL</td>
                            <#elseif uso_cfdi == "I01">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I01 - CONSTRUCCIONES</td>
                            <#elseif uso_cfdi == "I02">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I02 - MOBILIARIO Y EQUIPO DE OFICINA POR INVERSIONES</td>
                            <#elseif uso_cfdi == "I03">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I03 - EQUIPO DE TRANSPORTE</td>
                            <#elseif uso_cfdi == "I04">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I04 - EQUIPO DE CÓMPUTO Y ACCESORIOS</td>
                            <#elseif uso_cfdi == "I05">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I05 - DADOS, TROQUELES, MOLDES, MATRICES Y HERRAMENTAL</td>
                            <#elseif uso_cfdi == "I06">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I06 - COMUNICACIONES TELEFÓNICAS</td>
                            <#elseif uso_cfdi == "I07">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I07 - COMUNICACIONES SATELITALES</td>
                            <#elseif uso_cfdi == "I08">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">I08 - OTRA MAQUINARIA Y EQUIPO</td>
                            <#elseif uso_cfdi == "P01">
                                <td colspan="2" style="font-size: 8pt; padding: 2px;">P01 - POR DEFINIR</td>
                            <#else>
                                <td colspan="2" style="font-size: 8pt; padding: 2px;"></td>
                            </#if>
        </tr>
        <tr>
            <td
                colspan="1"
                style="font-size: 8pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); "><strong>Dirección: </strong></td>
            <td
                colspan="6"
                style="font-size: 8pt; padding: 6px 0px 2px;  color: rgb(51, 51, 51); ">${record.billingaddress_text?replace("<br />", " ")?replace("${record.entity.addressee}", "")} </td>
            
            
        </tr>
        <tr>
            <td
                colspan="1"
                style="font-size: 8pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); "><strong>RFC: </strong></td>
            <td
                colspan="4"
                style="font-size: 8pt; padding: 6px 0px 2px;  color: rgb(51, 51, 51); ">${record.entity.vatregnumber}</td>
            <td
                colspan="2"
                style="font-size: 8pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); ">&nbsp;</td>
            
            
        </tr>
    </table>

                
                <#if record.custbody_efx_fe_factura_global != ''>
                    <p class="nota" id="itemFacGlb" valign="middle" align="center">
                        NO SE PUEDEN CARGAR ARTICULOS DE FACTURA GLOBAL.
                    </p>
                <#else>
                    <#if record.item?has_content>
                        <#assign totaldiscount = 0/>
                        <#assign subtotal = 0/>
                        <#assign totaliva = 0/>
                        <table class="itemtable" style="width: 100%; margin-top: 10px;">
                            <!-- start items -->
                            <#list record.item as item>
                                <#if item_index==0>
                                    <thead>
                                        <tr style="border: 1px 0px; font-size:7pt;">
                                            <td align="center" colspan="2" >Cant.</td>
                                            <td align="center" colspan="5" >Código</td>
                                            <td align="center" colspan="3" >Cve. <br/> Unidad</td>
                                            <td align="center" colspan="10" >Descripción</td>
                                          	<td align="center" colspan="4" >Cve. <br/> Producto</td>
                                            <td align="center" colspan="3" >Precio<br/>unitario</td>
                                            <td align="center" colspan="3" >Importe<br/>bruto</td>
                                            <td align="center" colspan="4" >Descuento</td>
                                            <td align="center" colspan="3" >Impuesto</td>
                                            <td align="center" colspan="3" >T. Tasa</td>
                                            <td align="center" colspan="3" >IVA</td>
                                            <td align="center" colspan="3" >Importe</td>
                                        </tr>
                                    
                                    </thead>
                                </#if>
                                
                                <#if item.itemtype!='Discount'>
                                    <tr style="font-size:6pt;">
                                        <td align="center" colspan="2" >${item.quantity}</td>
                                        <td align="center" colspan="5" >${item.custcol_tkio_item_code_nyce}</td>
                                        <#assign "units_sat" = "NA">
                                        <#if item.units == "ACT">
                                            <#assign "units_sat" = "ACT">
                                        </#if>
                                        <#if item.units == "gr">
                                                <#assign "units_sat" = "GRM">
                                        </#if>
                                        <#if item.units == "kg">
                                                <#assign "units_sat" = "KGM">
                                        </#if>
                                        <#if item.units == "mg">
                                                <#assign "units_sat" = "MGM">
                                        </#if>
                                        <#if item.units == "L">
                                                <#assign "units_sat" = "LTR">
                                        </#if>
                                        <#if item.units == "ML">
                                                <#assign "units_sat" = "MLT">
                                        </#if>
                                        <#if item.units == "ml">
                                                <#assign "units_sat" = "MLT">
                                        </#if>
                                        <#if item.units == "µg">
                                                <#assign "units_sat" = "GRM">
                                        </#if>
                                        <#if item.units == "µl">
                                                <#assign "units_sat" = "LTR">
                                        </#if>
                                        <#if item.units == "Pza">
                                                <#assign "units_sat" = "H87">
                                        </#if>
                                        <#if item.units == "Uno">
                                                <#assign "units_sat" = "C62">
                                        </#if>
                                        <#if item.units == "Tebibit">
                                                <#assign "units_sat" = "E87">
                                        </#if>
                                        <#if item.units == "C20">
                                                <#assign "units_sat" = "H87">
                                        </#if>
                                        <#if item.units == "srv">
                                                <#assign "units_sat" = "E48">
                                        </#if>
                                        <#if item.units == "Viaje">
                                                <#assign "units_sat" = "E54">
                                        </#if>
                                        <td align="center" colspan="3" >${units_sat}</td>
                                        <td align="left" colspan="10" >
                                            ${item.description}<br />
                                        </td>
                                        <td align="center" colspan="4" >${item.custcol_mx_txn_line_sat_item_code?keep_before("-")}</td>
                                        <td align="center" colspan="3" >${item.rate}</td>
                                        <td align="center" colspan="3" >${item.amount}</td>
                                        <td align="center" colspan="4" ><#if (item_index+1) != record.item?size><#if record.item[item_index+1].itemtype=='Discount'>${record.item[item_index+1].amount}<#else>0.00</#if><#else>0.00</#if> </td>
                                        <td align="center" colspan="3" >002</td>
                                        <td align="center" colspan="3" >${item.taxrate1}</td>
                                        <td align="center" colspan="3" ><#if (item_index+1) != record.item?size><#if record.item[item_index+1].itemtype=='Discount'>$${(item.tax1amt + record.item[item_index+1].tax1amt)?string(",##0.00")}<#else>${item.tax1amt}</#if><#else>${item.tax1amt}</#if></td>
                                        <td align="center" colspan="3" ><#if (item_index+1) != record.item?size><#if record.item[item_index+1].itemtype=='Discount'>$${(item.amount + record.item[item_index+1].amount)?string(",##0.00")}<#else>${item.amount}</#if><#else>${item.amount}</#if></td>
                                    </tr>

                                    <#assign arrayFact = []>
                                    <#assign arrayFact2 = []>
                                    <#assign arrayFact3 = []>

                                    <#if item.custcol_tkio_notas_fact?has_content>    
                                        <#if item.custcol_tkio_notas_fact?contains(";") || item.custcol_tkio_notas_fact?contains("<br />") >
                                            <#assign arrayFact = item.custcol_tkio_notas_fact?split(";")>
                                            <#assign arrayFact2 = item.custcol_tkio_notas_fact_2?split("<br />")>
                                            <#else>
                                                <#if arrayFact2?is_sequence == false>
                                                    <#assign arrayFact = arrayFact+[item.custcol_tkio_notas_fact]>
                                                </#if>
                                                <#--  <#assign arrayFact = item.custcol_tkio_notas_fact>  -->
                                        </#if>
                                    </#if>

                                    <#if item.custcol_tkio_notas_fact_2?has_content>
                                        <#if item.custcol_tkio_notas_fact_2?contains(";") || item.custcol_tkio_notas_fact_2?contains("<br />") >
                                            <#assign arrayFact2 = item.custcol_tkio_notas_fact_2?split(";")>
                                            <#assign arrayFact2 = item.custcol_tkio_notas_fact_2?split("<br />")>
                                            <#else>
                                                <#if arrayFact2?is_sequence == false>
                                                    <#assign arrayFact2 = arrayFact2+[item.custcol_tkio_notas_fact_2]>
                                                </#if>
                                        </#if>
                                    </#if>

                                    <#if item.custcol_tkio_notas_fact_3?has_content>    
                                        <#if item.custcol_tkio_notas_fact_3?contains(";") || item.custcol_tkio_notas_fact_3?contains("<br />") >
                                            <#assign arrayFact3 = item.custcol_tkio_notas_fact_3?split(";")>
                                            <#assign arrayFact3 = item.custcol_tkio_notas_fact_3?split("<br />")>
                                            <#else>
                                                <#if arrayFact3?is_sequence == false>
                                                    <#assign arrayFact3 = arrayFact3+[item.custcol_tkio_notas_fact_3]>
                                                </#if>
                                                <#--  <#assign arrayFact3 = item.custcol_tkio_notas_fact_3>  -->
                                        </#if>
                                    </#if>
                                    <#assign recorre = 0>

                                    <#if arrayFact?is_sequence || arrayFact2?is_sequence || arrayFact3?is_sequence>    
                                        <#list arrayFact as n1>
                                            <tr style="font-size:6pt;">
                                                <td align="center" colspan="2" ></td>
                                                <td align="center" colspan="5" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td id="datos" align="left" colspan="10" >
                                                    <#if item.custcol_tkio_notas_fact?has_content>
                                                        <#if arrayFact?size gt recorre >
                                                        ${arrayFact[recorre]} 
                                                        </#if>
                                                    </#if> 

                                                    <#if arrayFact2?has_content >
                                                        <#if arrayFact2?size gt recorre >
                                                            ${arrayFact2[recorre]} 
                                                        </#if> 
                                                    </#if> 
                                                    
                                                    <#if item.custcol_tkio_notas_fact_3?has_content >
                                                        <#if arrayFact3?size gt recorre >
                                                            ${arrayFact3[recorre]} 
                                                        </#if> 
                                                    </#if> 
                                                </td>
                                                <td align="center" colspan="4" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="4" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                            </tr>
                                            <#assign recorre = recorre + 1>
                                        </#list>    
                                        <#else>
                                            <tr id="datos" style="font-size:6pt;">
                                                <td align="center" colspan="2" ></td>
                                                <td align="center" colspan="5" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="left" colspan="10" >
                                                        ${arrayFact} 
                                                        ${arrayFact2} 
                                                        ${arrayFact3} 
                                                </td>
                                                <td align="center" colspan="4" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="4" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                                <td align="center" colspan="3" ></td>
                                            </tr>

                                    </#if>
                                    

                                    <#assign subtotal += item.amount/>
                                    <#assign totaliva += item.amount/>
                                <#else>
                                    <#assign totaldiscount += item.amount/>
                                </#if>                       
                                <#if record.custbody_efx_fe_complemento_educativo?has_content && record.custbody_efx_fe_complemento_educativo == true >
                                    <tr>
                                        <td colspan="2">
                                        </td>

                                        <td colspan="27">
                                            <#if item.custcol_efx_fe_com_edu_nom_alumn?has_content>Nombre Alumno: ${item.custcol_efx_fe_com_edu_nom_alumn}<br/></#if>
                                            <#if item.custcol_efx_fe_com_edu_curp?has_content>CURP: ${item.custcol_efx_fe_com_edu_curp}<br/></#if>
                                            <#if item.custcol_efx_fe_com_edu_nivel_edu?has_content>Nivel Educativo: ${item.custcol_efx_fe_com_edu_nivel_edu}<br/></#if>
                                            <#if item.custcol_efx_fe_com_edu_clave_autrvoe?has_content>Clave: ${item.custcol_efx_fe_com_edu_clave_autrvoe}<br/></#if>
                                        </td>
                                    </tr>
                                </#if>

                            </#list>
                            <!-- end items -->
                        </table>
                        <br/>
                        <hr style="background-color:#000000"/>
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
                            <td colspan="3"><strong>Importe en letra:</strong></td>
                            <td colspan="1">&nbsp;</td>
                            <td align="right">
                                <b>${record.subtotal@label}</b>
                            </td>
                            <td align="right">${record.subtotal}</td>
                        </tr>
                        
                        
                        <tr>
                            <td colspan="3"><#if record.custbody_efx_fe_monto_letra!=''>${record.custbody_efx_fe_monto_letra}</#if></td>
                            <td colspan="1">&nbsp;</td>
                            <td align="right">
                                <b>IVA:</b>
                            </td>
                            <td align="right">${record.taxtotal}</td>
                        </tr>
                        <tr>
                            <td colspan="4">&nbsp;</td>
                            <td align="right" >
                                <strong>${record.total@label}</strong>
                            </td>
                            <td align="right" >${record.total}</td>
                        </tr>

                    </table>
                    
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

                <!--  <#assign leyenda= subsidiary.custrecord_efx_fe_legend_subsidiary>
                    <#if leyenda != ''>
                        <table style="width: 100%; ">
                            <tr>
                                <th width="100%"></th>
                            </tr>
                            <tr>
                                <td >${leyenda}</td>
                            </tr>
                            <tr>
                                <td ></td>
                            </tr>
                        </table>
                        
                    </#if>-->

                    <!-- Tabla Bancos -->
                    <#if record.subsidiary?contains("MX06")>
                    <table style="width: 100%;">
                        <tr>
                            <td style="font-size: 7pt;"><strong>Moneda:</strong></td>
                        <td style="font-size: 7pt;">${record.currency.name}</td>
                        <td style="font-size: 7pt;">&nbsp;</td>
                            <td style="background-color: #ffffff;font-size:7pt;">Nuestros datos bancarios</td>
                        <td style="font-size: 7pt;">&nbsp;</td>
                        </tr>
                        <tr>
                          <#assign forma_pago = record.custbody_mx_txn_sat_payment_method?keep_before(" ")>
                            <td style="font-size: 7pt;"><strong>Forma de pago:</strong></td>
                        	<#if forma_pago == "01">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">01 - EFECTIVO</td>
                            <#elseif forma_pago == "02">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">02 - CHEQUE NOMINATIVO</td>
                            <#elseif forma_pago == "03">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">03 - TRANSFERENCIA ELECTRÓNICA DE FONDOS</td>
                            <#elseif forma_pago == "04">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">04 - TARJETA DE CRÉDITO</td>
                            <#elseif forma_pago == "05">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">05 - MONEDERO ELECTRÓNICO</td>
                            <#elseif forma_pago == "06">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">06 - DINERO ELECTRÓNICO</td>
                            <#elseif forma_pago == "07">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">07 - TARJETAS DIGITALES</td>
                            <#elseif forma_pago == "08">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">08 - VALES DE DESPENSA</td>
                            <#elseif forma_pago == "09">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">09 - BIENES</td>
                            <#elseif forma_pago == "10">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">10 - SERVICIO</td>
                            <#elseif forma_pago == "11">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">11 - POR CUENTA DE TERCERO</td>
                            <#elseif forma_pago == "12">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">12 - DACIÓN EN PAGO</td>
                            <#elseif forma_pago == "13">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">13 - PAGO POR SUBROGACIÓN</td>
                            <#elseif forma_pago == "14">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">14 - PAGO POR CONSIGNACIÓN</td>
                            <#elseif forma_pago == "15">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">15 - CONDONACIÓN</td>
                            <#elseif forma_pago == "16">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">16 - CANCELACIÓN</td>
                            <#elseif forma_pago == "17">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">17 - COMPENSACIÓN</td>
                            <#elseif forma_pago == "23">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">23 - NOVACIÓN</td>
                            <#elseif forma_pago == "24">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">24 - CONFUSIÓN</td>
                            <#elseif forma_pago == "25">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">25 - REMISIÓN DE DEUDA</td>
                            <#elseif forma_pago == "26">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">26 - PRESCRIPCIÓN O CADUCIDAD</td>
                            <#elseif forma_pago == "27">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">27 - A SATISFACCIÓN DEL ACREEDOR</td>
                            <#elseif forma_pago == "28">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">28 - TARJETA DE DÉBITO</td>
                            <#elseif forma_pago == "29">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">29 - TARJETA DE SERVICIOS</td>
                            <#elseif forma_pago == "30">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">30 - APLICACIÓN DE ANTICIPOS</td>
                            <#elseif forma_pago == "31">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">31 - INTERMEDIARIO PAGOS</td>
                            <#elseif forma_pago == "98">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">98 - N/A</td>
                            <#elseif forma_pago == "99">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">99 - POR DEFINIR</td>
                            <#else>
                                <td colspan="2" style="font-size: 7pt; padding: 2px;"></td>
                               </#if>
                            <td colspan="2" style="font-size: 7pt;"><STRONG>Déposito en Pesos</STRONG></td>
                        </tr>
                        <tr>
                           <#assign metodo_pago = record.custbody_mx_txn_sat_payment_term?keep_before(" ")>
                        <td style="font-size: 7pt;"><strong>Método de pago:</strong></td>
                            <#if metodo_pago == "PUE">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">PUE - PAGO EN UNA SOLA EXHIBICION</td>
                            <#elseif metodo_pago == "PPD">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">PPD - PAGO EN PARCIALIDADES O DIFERIDO</td>
                            <#else>
                                <td colspan="2" style="font-size: 7pt; padding: 2px;"></td>
                            </#if>
                            <td style="font-size: 7pt;"><STRONG>Cuenta a nombre de: </STRONG></td>
                            <td style="font-size: 7pt;">NYCE LABORATORIOS, S.C.</td>
                        </tr>
                        <tr>
                          <#assign regfiscal = record.subsidiary.custrecord_mx_sat_industry_type?keep_before(" ")>
                            <td style="font-size: 7pt;"><strong>Regimen fiscal:</strong></td>
                            <#if regfiscal == "601">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">601 - GENERAL DE LEY PERSONAS MORALES</td>
                            <#else>
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">${record.subsidiary.custrecord_mx_sat_industry_type?upper_case}</td>
                            </#if>
                            <td style="font-size: 7pt;"><STRONG>Institucion Bancaria:</STRONG></td>
                                <td style="font-size: 7pt;">HSBC México, S.A.</td>
                        </tr>
                        <tr>
                        <td style="font-size: 7pt;"><strong>Tipo de comprobante:</strong></td>
                        <td style="font-size: 7pt;"><#assign recType=record.type>
                        <#if recType == "custinvc">
                            <#assign recType="I - INGRESO">
                            <#elseif recType == "custcred">
                                <#assign recType="E - EGRESO"></#if>
                                ${recType}</td>
                        <td style="font-size: 7pt;">&nbsp;</td>
                            <td style="font-size: 7pt;"><STRONG>Cuenta:</STRONG></td>
                                <td style="font-size: 7pt;">04020321113</td>
                        </tr>
                        <tr>
                        <td colspan="3" style="font-size: 7pt;">&nbsp;</td>
                            <td style="font-size: 7pt;"><STRONG>Clabe:</STRONG></td>
                                <td style="font-size: 7pt;">021180040203211131</td>
                        </tr>
                            <tr>
                        <td colspan="3" style="font-size: 7pt;">&nbsp;</td>
                            <td style="font-size: 7pt;"><STRONG>Swift:</STRONG></td>
                                <td style="font-size: 7pt;">BIMEMXMM</td>
                        </tr>
                            
                        </table>
                    <#elseif record.subsidiary?contains("MX05")>
                        <table style="width: 100%;">
                        <tr>
                            <td style="font-size: 7pt;"><strong>Moneda:</strong></td>
                        <td style="font-size: 7pt;">${record.currency.name}</td>
                        <td style="font-size: 7pt;">&nbsp;</td>
                            <td style="background-color: #ffffff; font-size:7pt;">Nuestros datos bancarios</td>
                        <td style="font-size: 7pt;">&nbsp;</td>
                        </tr>
                        <tr>
                          <#assign forma_pago = record.custbody_mx_txn_sat_payment_method?keep_before(" ")>
                            <td style="font-size: 7pt;"><strong>Forma de pago:</strong></td>
                        <#if forma_pago == "01">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">01 - EFECTIVO</td>
                            <#elseif forma_pago == "02">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">02 - CHEQUE NOMINATIVO</td>
                            <#elseif forma_pago == "03">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">03 - TRANSFERENCIA ELECTRÓNICA DE FONDOS</td>
                            <#elseif forma_pago == "04">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">04 - TARJETA DE CRÉDITO</td>
                            <#elseif forma_pago == "05">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">05 - MONEDERO ELECTRÓNICO</td>
                            <#elseif forma_pago == "06">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">06 - DINERO ELECTRÓNICO</td>
                            <#elseif forma_pago == "07">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">07 - TARJETAS DIGITALES</td>
                            <#elseif forma_pago == "08">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">08 - VALES DE DESPENSA</td>
                            <#elseif forma_pago == "09">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">09 - BIENES</td>
                            <#elseif forma_pago == "10">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">10 - SERVICIO</td>
                            <#elseif forma_pago == "11">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">11 - POR CUENTA DE TERCERO</td>
                            <#elseif forma_pago == "12">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">12 - DACIÓN EN PAGO</td>
                            <#elseif forma_pago == "13">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">13 - PAGO POR SUBROGACIÓN</td>
                            <#elseif forma_pago == "14">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">14 - PAGO POR CONSIGNACIÓN</td>
                            <#elseif forma_pago == "15">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">15 - CONDONACIÓN</td>
                            <#elseif forma_pago == "16">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">16 - CANCELACIÓN</td>
                            <#elseif forma_pago == "17">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">17 - COMPENSACIÓN</td>
                            <#elseif forma_pago == "23">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">23 - NOVACIÓN</td>
                            <#elseif forma_pago == "24">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">24 - CONFUSIÓN</td>
                            <#elseif forma_pago == "25">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">25 - REMISIÓN DE DEUDA</td>
                            <#elseif forma_pago == "26">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">26 - PRESCRIPCIÓN O CADUCIDAD</td>
                            <#elseif forma_pago == "27">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">27 - A SATISFACCIÓN DEL ACREEDOR</td>
                            <#elseif forma_pago == "28">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">28 - TARJETA DE DÉBITO</td>
                            <#elseif forma_pago == "29">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">29 - TARJETA DE SERVICIOS</td>
                            <#elseif forma_pago == "30">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">30 - APLICACIÓN DE ANTICIPOS</td>
                            <#elseif forma_pago == "31">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">31 - INTERMEDIARIO PAGOS</td>
                            <#elseif forma_pago == "98">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">98 - N/A</td>
                            <#elseif forma_pago == "99">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">99 - POR DEFINIR</td>
                            <#else>
                                <td colspan="2" style="font-size: 7pt; padding: 2px;"></td>
                               </#if>
                       
                            <td style="font-size: 7pt;"><STRONG>Institución bancaria:</STRONG></td>
                            <td style="font-size: 7pt;">Banco HSBC México, S.A.</td>
                        </tr>
                        <tr>
                         <#assign metodo_pago = record.custbody_mx_txn_sat_payment_term?keep_before(" ")>
                        <td style="font-size: 7pt;"><strong>Método de pago:</strong></td>
                            <#if metodo_pago == "PUE">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">PUE - PAGO EN UNA SOLA EXHIBICION</td>
                            <#elseif metodo_pago == "PPD">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">PPD - PAGO EN PARCIALIDADES O DIFERIDO</td>
                            <#else>
                                <td colspan="2" style="font-size: 7pt; padding: 2px;"></td>
                            </#if>
                            <td style="font-size: 7pt;"><STRONG>Número de cuenta:</STRONG></td>
                            <td style="font-size: 7pt;">4000848499</td>
                        </tr>
                        <tr>
                            <#assign regfiscal = record.subsidiary.custrecord_mx_sat_industry_type?keep_before(" ")>
                            <td style="font-size: 7pt;"><strong>Regimen fiscal:</strong></td>
                            <#if regfiscal == "601">
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">601 - GENERAL DE LEY PERSONAS MORALES</td>
                            <#else>
                                <td colspan="2" style="font-size: 7pt; padding: 2px;">${record.subsidiary.custrecord_mx_sat_industry_type?upper_case}</td>
                            </#if>
                            <td style="font-size: 7pt;"><STRONG>Clabe:</STRONG></td>
                                <td style="font-size: 7pt;">021180040008484998</td>
                        </tr>
                        <tr>
                        <td style="font-size: 7pt;"><strong>Tipo de comprobante:</strong></td>
                        <td style="font-size: 7pt;"><#assign recType=record.type>
                        <#if recType == "custinvc">
                            <#assign recType="I - INGRESO">
                            <#elseif recType == "custcred">
                                <#assign recType="E - EGRESO"></#if>
                                ${recType}</td>
                        <td style="font-size: 7pt;">&nbsp;</td>
                            <td colspan="2" style="font-size: 7pt;"><STRONG>Cuenta en pesos mexicanos</STRONG></td>
                        </tr>
                        </table>
                    </#if>
                    <!-- Termina Tabla Bancos -->
                    
                    
                    
                    
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

                    <#assign qrcodeImage = "data:image/png;base64, " + certData.custbody_mx_cfdi_qr_code >
                    <table style="width: 100%; margin-top: 10px;">
                        <tr>
                            <td valign="top" align="left" width="25%">
                                <#if certData.custbody_mx_cfdi_qr_code != ''>
                                    <!-- undefined<a href="https://www.the-qrcode-generator.com/"> <img
                                    src="https://chart.googleapis.com/chart?chs=110x110&amp;cht=qr&amp;chld=|1&amp;chl=${record.custbody_efx_fe_qr}"
                                    /> </a> -->
                                    <img style="width: 45mm;height:45mm" src="${qrcodeImage}"/>
                                </#if>
                            </td>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                    <td><strong>Fecha y hora de certificación: </strong>${certData.custbody_mx_cfdi_issue_datetime}</td>
                                    </tr>
                                    <tr>
                                    <td><strong>No. Serie Certificado SAT: </strong>${certData.custbody_mx_cfdi_sat_serial}</td>
                                    </tr>
                                    <tr>
                                        <td ><strong>Cadena original del complemento de certificación digital del SAT</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="align: left; font-size: 7px">${certData.custbody_mx_cfdi_cadena_original}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Sello digital del CFDI</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="align: left;font-size: 7px">${certData.custbody_mx_cfdi_signature}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Sello digital del SAT</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="align: left;font-size: 7px">${certData.custbody_mx_cfdi_sat_signature}</td>
                                    </tr>

                                    <#if certData.custbody_efx_fe_cfdi_rel != ''>
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

        <!-- Pendiente a revision por nombre de campo -->
        <#if record.recmachcustrecord_mx_rcs_orig_trans?has_content>
            <table style="width: 100%; margin-top: 10px;">
                <tr>
                    <th colspan="12" align="center" style="border: 1px;">CFDI Relacionados</th>
                </tr>
                <tr>
                    <th colspan="4" align="center">
                    Tipo de relación
                    </th>
                    <th colspan="4" align="center">
                    Pago Relacionado
                    </th>
                    <th colspan="4" align="center">
                    UUID
                    </th>
                </tr>
                <#list record.recmachcustrecord_mx_rcs_orig_trans as cfdiRel>
                    <tr>
                        <td colspan="4">${cfdiRel.custrecord_mx_rcs_rel_type}</td>
                        <td colspan="4">${cfdiRel.custrecord_mx_rcs_rel_cfdi?keep_after("#")}</td>
                        <td colspan="4">${cfdiRel.custrecord_mx_rcs_uuid}</td>
                    </tr>
                </#list>
            </table>
        </#if>
    </body>
</pdf>