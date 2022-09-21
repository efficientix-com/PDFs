<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <head>
        <link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
        <#if .locale == "zh_CN">
            <link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}" src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2" />
        <#elseif .locale == "zh_TW">
            <link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}" src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2" />
        <#elseif .locale == "ja_JP">
            <link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}" src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2" />
        <#elseif .locale == "ko_KR">
            <link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}" src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2" />
        <#elseif .locale == "th_TH">
            <link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}" src-bold="${nsfont.NotoSansThai_Bold}" bytes="2" />
        </#if>
        <macrolist>
            <macro id="nlheader">
                <table class="header" style="width: 100%;">
                    <tr rowspan="3">
                        <td colspan="3">
                            <#if companyInformation.logoUrl?length != 0>
                                <img height="30%" width="30%" src="${companyInformation.logoUrl}" style="float: left; margin: 7px" />
                            </#if>
                        </td>
                        <td colspan="3">
                            <span class="nameandaddress">${companyInformation.addressText}</span>
                        </td>
                        <td colspan="3" align="right">
                            <span style="text-align: right" class="title" >Orden de<br /><span class="title">Traslado</span></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" align="right">
                            <span class="number">#${results.tranid}</span>
                        </td>
                    </tr>
                </table>
            </macro>
            <macro id="nlfooter">
                <table class="footer" style="width: 100%;">
                    <tr>
                        <td align="right"><pagenumber/> de <totalpages/></td>
                    </tr>
                </table>
            </macro>
        </macrolist>
        <style type="text/css">* {
            <#if .locale == "zh_CN">
                font-family: NotoSans, NotoSansCJKsc, sans-serif;
            <#elseif .locale == "zh_TW">
                font-family: NotoSans, NotoSansCJKtc, sans-serif;
            <#elseif .locale == "ja_JP">
                font-family: NotoSans, NotoSansCJKjp, sans-serif;
            <#elseif .locale == "ko_KR">
                font-family: NotoSans, NotoSansCJKkr, sans-serif;
            <#elseif .locale == "th_TH">
                font-family: NotoSans, NotoSansThai, sans-serif;
            <#else>
                font-family: NotoSans, sans-serif;
            </#if>
            }
            table {
                font-size: 9pt;
                table-layout: fixed;
            }
            th {
                font-weight: bold;
                font-size: 8pt;
                vertical-align: middle;
                padding: 5px 6px 3px;
                background-color: #e3e3e3;
                color: #333333;
            }
            td {
                padding: 4px 6px;
            }
            td p { align:left }
            b {
                font-weight: bold;
                color: #333333;
            }
            table.header td {
                padding: 0px;
                font-size: 10pt;
            }
            table.footer td {
                padding: 0px;
                font-size: 8pt;
            }
            table.itemtable th {
                padding-bottom: 10px;
                padding-top: 10px;
            }
            table.body td {
                padding-top: 2px;
            }
            table.total {
                page-break-inside: avoid;
            }
            tr.totalrow {
                background-color: #e3e3e3;
                line-height: 200%;
            }
            td.totalboxtop {
                font-size: 12pt;
                background-color: #e3e3e3;
            }
            td.addressheader {
                font-size: 8pt;
                padding-top: 6px;
                padding-bottom: 2px;
            }
            td.address {
                padding-top: 0px;
            }
            td.totalboxmid {
                font-size: 28pt;
                padding-top: 20px;
                background-color: #e3e3e3;
            }
            td.totalboxbot {
                background-color: #e3e3e3;
                font-weight: bold;
            }
            span.title {
                font-size: 18pt;
            }
            span.number {
                font-size: 16pt;
            }
            span.itemname {
                font-weight: bold;
                line-height: 150%;
            }
            hr {
                width: 100%;
                color: #d3d3d3;
                background-color: #d3d3d3;
                height: 1px;
            }
            #cuadriculado{
                border:1px solid #d3d3d3;
            }
            #cuadriculado td{
                border:1px solid #d3d3d3;
            }
        </style>
    </head>
    <body header="nlheader" header-height="12%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th class="addressheader" colspan="27">Información Primaria:</th>
        </tr>

        <tr>
            <td class="addressheader" colspan="7"><b>Ubicación de origen: </b></td>
            <td class="addressheader" colspan="7"><b>Ubicación de destino: </b></td>
            <td class="addressheader" colspan="5"><b>Creado por empleado (a):</b></td>
            <td class="addressheader" colspan="5"><b>Nota:</b></td>
            <td class="addressheader" colspan="3"><b>Fecha:</b></td>
        </tr>

        <tr>
            <td class="address" colspan="7" rowspan="2">${results.location}</td>
            <td class="address" colspan="7" rowspan="2">${results.transferlocation}</td>
            <td class="address" colspan="5" rowspan="2">${results.employee}</td>
            <td class="address" colspan="5" rowspan="2">${results.memo}</td>
            <td class="address" colspan="3" rowspan="2">${results.trandate}</td>
        </tr>
    </table>

    <#if results.item?has_content>
        <#assign cantTotal = 0>
        <#assign montTotal = 0>

        <table class="itemtable" style="width: 100%; margin-top: 10px;">
            <!-- start items -->
            <#list results.item as item>
                <#if item_index==0>
                    <thead>
                    <tr>
                        <th colspan="12">Articulo</th>
                        <th align="center" colspan="3">Cantidad</th>
                        <th align="center" colspan="3">Unidad de medida</th>
                        <th align="right" colspan="4">Valor Unitario</th>
                        <th align="right" colspan="4">Importe</th>
                    </tr>
                    </thead>
                </#if>
                <#assign montoLinea = item.rate * item.quantity>

                <tr id="cuadriculado">
                    <td  colspan="12"><span class="itemname">${item.item}</span><br />${item.description}</td>
                    <td align="center" colspan="3" line-height="150%">${item.quantity}</td>
                    <#if item.units == "1">
                        <td align="center" colspan="3" >kg</td>
                    <#elseif item.units == "2">
                        <td align="center" colspan="3" >pza</td>
                    <#elseif item.units == "3">
                        <td align="center" colspan="3" >lt</td>
                    <#elseif item.units == "4">
                        <td align="center" colspan="3" >caj12</td>
                    <#elseif item.units == "5">
                        <td align="center" colspan="3" >caj24</td>
                    <#elseif item.units == "6">
                        <td align="center" colspan="3" >SERV</td>
                    <#elseif item.units == "7">
                        <td align="center" colspan="3" >caj6</td>
                    <#elseif item.units == "8">
                        <td align="center" colspan="3" >ACT</td>
                    <#elseif item.units == "9">
                        <td align="center" colspan="3" >Vehículo</td>

                    <#else>
                        <td align="center" colspan="3" >${item.units}</td>
                    </#if>
                    <td align="right" colspan="4">${item.rate}</td>
                    <td align="right" colspan="4">${nsformat_rate(montoLinea)}</td>
                </tr>

                <#assign montTotal = montTotal + montoLinea>
                <#assign cantTotal = cantTotal + item.quantity>
            </#list>
            <!-- end items -->
        </table>

        <hr />
    </#if>
    <table class="total" style="width: 100%; margin-top: 10px;">
        <tr>
            <td colspan="4">&nbsp;</td>
            <td align="right"><b>Monto Total </b></td>
            <td align="right">${nsformat_rate(montTotal)}</td>
        </tr>

    </table>

    <table class = "total" style="width: 100%;  margin-top: 60px;">
        <tr>
            <td colspan="2">&nbsp;</td>
            <td colspan="6" style="border-top: solid 1px black;" align="center"><b>Sello<br />Almacén</b></td>
            <td colspan="2">&nbsp;</td>
            <td colspan="6" style="border-top: solid 1px black;" align="center"><b>Firma de<br />Recepción</b></td>
            <td colspan="2" align="right">&nbsp;</td>
        </tr>

    </table>
    </body>
</pdf>