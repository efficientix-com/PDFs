<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <#if statements?has_content>
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
                        <tr>
                            <td rowspan="2"><#if companyInformation.logoUrl?length != 0><img height="55px" src="${companyInformation.logoUrl}" style="float: left; margin: 7px" width="200px" /> </#if></td>
                            <td>&nbsp;</td>
                            <td align="left" style="font-size: 18px; font-weight: bold;">${record@title}<br />&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="font-weight: bold;">Fecha</td>
                            <#list statements as statement>
                                <#if statement.currency=="MXN">
                                    <td>${statement.trandate}</td> 
                                </#if>   
                            </#list>
                        </tr>
                    </table>
                </macro>
                <macro id="nlfooter">
                    <table class="footer" style="width: 100%;">
                        <tr>
                            <td align="right"><pagenumber/> of <totalpages/></td>
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
                    padding: 0;
                    font-size: 10pt;
                }
                table.footer td {
                    padding: 0;
                    font-size: 8pt;
                }
                table.itemtable th {
                    padding-bottom: 10px;
                    padding-top: 10px;
                }
                table.body td {
                    padding-top: 2px;
                }
                td.addressheader {
                    font-weight: bold;
                    font-size: 8pt;
                    padding-top: 6px;
                    padding-bottom: 2px;
                }
                td.address {
                    padding-top: 0;
                }
                span.title {
                    font-size: 28pt;
                }
                span.number {
                    font-size: 16pt;
                }
                div.remittanceSlip {
                    width: 100%;
                    /* To ensure minimal height of remittance slip */
                    height: 200pt;
                    page-break-inside: avoid;
                    page-break-after: avoid;
                }
                hr {
                    border-top: 1px dashed #d3d3d3;
                    width: 100%;
                    color: #ffffff;
                    background-color: #ffffff;
                    height: 1px;
                }
            </style>
        </head>
        <body header="nlheader" header-height="10%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
            <#list statements as statement>
                <#if statement.currency=="MXN">
                    <table style="width: 877px; margin-top: 10px;">
                        <tr>
                            <td style="width: 391px;"><span class="nameandaddress">${companyInformation.addressText}</span></td>
                        </tr>
                        <tr>
                            <td style="width: 391px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="addressheader" colspan="3">Facturar a</td>
                        </tr>
                        <tr>
                            <td class="address" colspan="3">${statement.billaddress}</td>
                        </tr>
                        <tr>
                            <td class="address" colspan="3"><br />
                            <br /><strong>RESUMEN</strong></td>
                        </tr>
                        <tr>
                            <td class="address" colspan="3"><br />
                            <br /><strong>${statement.currency}</strong></td>
                        </tr>
                    </table>
                    <#if statement.lines?has_content>
                        <table class="aging" style="width: 100%; margin-top: 10px;">
                            <tr>
                                <th align="center">${statement.aging1@label}</th>
                                <th align="center">${statement.aging2@label}</th>
                                <th align="center">${statement.aging3@label}</th>
                                <th align="center">${statement.aging4@label}</th>
                                <th align="center">${statement.aging5@label}</th>
                                <th align="center">Total</th>
                            </tr>
                            <tr>
                                <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging1}</td>
                                <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging2}</td>
                                <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging3}</td>
                                <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging4}</td>
                                <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging5}</td>
                                <td align="center" style="border: 1px solid #e3e3e3;">${statement.agingbal}</td>
                            </tr>
                        </table>

                        <table class="aging" style="width: 33%; margin-top: 10px;">
                            <tr>
                                <th align="center">Vigente</th>
                                <th align="center">Vencido</th>
                            </tr>
                            <tr>
                                <#assign sueldoVencido = nsformat_rate(statement.aging2+statement.aging3+statement.aging4+statement.aging5)>
                                <td style="border: 1px solid #e3e3e3;">${statement.aging1}</td>
                                <td style="border: 1px solid #e3e3e3;">${nsformat_rate(statement.aging2+statement.aging3+statement.aging4+statement.aging5)}</td>
                            </tr>
                        </table>
                    </#if>
                    
                    <#else>
                        <#if statement.lines?has_content>
                            <table class="aging" style="width: 100%; margin-top: 10px;">
                                <tr>
                                    <td class="address" colspan="3"><br />
                                    <br /><strong>${statement.currency}</strong><br /></td>
                                </tr>
                                <tr>
                                    <th align="center">${statement.aging1@label}</th>
                                    <th align="center">${statement.aging2@label}</th>
                                    <th align="center">${statement.aging3@label}</th>
                                    <th align="center">${statement.aging4@label}</th>
                                    <th align="center">${statement.aging5@label}</th>
                                    <th align="center">Total</th>
                                </tr>
                                <tr>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging1}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging2}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging3}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging4}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging5}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.amountDue}</td>
                                </tr>
                            </table>

                            <table class="aging" style="width: 33%; margin-top: 10px;">
                                <tr>
                                    <th align="center">Vigente</th>
                                    <th align="center">Vencido</th>
                                </tr>
                                <tr>
                                <#assign sueldoVencido = nsformat_rate(statement.aging2+statement.aging3+statement.aging4+statement.aging5)>
                                    <td style="border: 1px solid #e3e3e3;">${statement.aging1}</td>
                                    <td style="border: 1px solid #e3e3e3;">${sueldoVencido}</td>
                                </tr>
                            </table>
                        
                        </#if>
                    <div align="center" style="font-size: 10;">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <p align="center">Ver detalle del estado de cuenta en las siguientes páginas.</p>
                        <p>Para dudas y aclaraciones favor de contactar a <strong>cobranza@cymaq.mx</strong></p>
                    </div>
                    <pbr />
                </#if>

                <#if statement.currency=="USD">
                    <table class="header" style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><strong>Importe adeudado</strong></td>
                            <#list statements as statement>
                                <#if statement.currency=="MXN">
                                    <td>${statement.amountDue}</td>
                                </#if>   
                            </#list>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><strong>Moneda</strong></td>
                            <#list statements as statement>
                                <#if statement.currency=="MXN">
                                    <td>${statement.currency}</td>
                                </#if>   
                            </#list>
                        </tr>
                    </table>
                    <#list statements as statement>
                        <#if statement.currency=="MXN">
                            <table class="aging" style="width: 100%; margin-top: 10px;">
                                <#if statement.lines?has_content>
                                    <#list statement.lines as line>
                                        <#if line_index==0>    
                                            <tr>
                                                <th align="center" colspan="3">Fecha</th>
                                                <th align="center" colspan="9">Descripción</th>
                                                <th align="center" colspan="4"><p>Vencimiento en</p><p align="center">Rangos</p></th>
                                                <th align="center" colspan="4">Importe Original</th>
                                                <th align="center" colspan="4">Importe Pendiente</th>
                                            </tr>
                                        </#if>
                                        <tr>
                                            <#if line.description == "Balance acumulado" || line.description == "Balance Forward">
                                            </#if>
                                            <#--   <td align="center" colspan="3" style="border: 1px solid #e3e3e3;">${line.datecol}</td>
                                            <td align="center" colspan="9" style="border: 1px solid #e3e3e3;">${line.description}</td>
                                            <td align="center" colspan="4" style="border: 1px solid #e3e3e3;"> </td>
                                            <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.charge}</td>
                                            <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.amountRemaining}</td>  -->

                                            <#if line.description?contains("Invoice") || line.description?contains("Factura")>
                                                <td align="center" colspan="3" style="border: 1px solid #e3e3e3;">${line.datecol}</td>
                                                <td align="center" colspan="9" style="border: 1px solid #e3e3e3;">${line.description}</td>
                                                <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">
                                                    <#assign fecha = .now>
                                                    <#assign date = (fecha?date?long - line.duedate?date?long) / (1000 * 60 * 60 * 24)>
                                                    <#--  ${date?string["0.00"]}<br />  -->
                                                    <#if date?number == 0>
                                                        ${statement.aging1@label}
                                                    <#elseif (date?number >= 1) && (date?number <= 30)>
                                                        ${statement.aging2@label}
                                                    <#elseif (date?number >= 31) && (date?number <= 60)>
                                                        ${statement.aging3@label}
                                                    <#elseif (date?number >= 61) && (date?number <= 90)>
                                                        ${statement.aging4@label}
                                                    <#elseif (date?number >= 90)>
                                                        ${statement.aging5@label}
                                                    </#if>
                                                </td>
                                                <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.charge}</td>
                                                <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.amountRemaining}</td>
                                            </#if>
                                        </tr>
                                    </#list>
                                </#if>
                            </table>

                            <table class="aging" style="width: 100%; margin-top: 10px;">
                                <tr>
                                    <th align="center">${statement.aging1@label}</th>
                                    <th align="center">${statement.aging2@label}</th>
                                    <th align="center">${statement.aging3@label}</th>
                                    <th align="center">${statement.aging4@label}</th>
                                    <th align="center">${statement.aging5@label}</th>
                                    <th align="center">Total</th>
                                </tr>
                                <tr>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging1}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging2}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging3}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging4}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging5}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.agingbal}</td>
                                </tr>
                            </table>
                        </#if>   
                    </#list>
                </#if>    
            </#list>

            <#list statements as statement>
                <#if statement.currency=="MXN">
                    <pbr />                    
                </#if>
                <#if statement.currency=="MXN">
                    <table class="header" style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><strong>Importe adeudado</strong></td>
                            <#list statements as statement>
                                <#if statement.currency=="USD">
                                    <td>${statement.amountDue}</td>
                                </#if>   
                            </#list>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><strong>Moneda</strong></td>
                            <#list statements as statement>
                                <#if statement.currency=="USD">
                                    <td>${statement.currency}</td>
                                </#if>   
                            </#list>
                        </tr>
                    </table>
                    <#list statements as statement>
                        <#if statement.currency=="USD">
                            <table class="aging" style="width: 100%; margin-top: 10px;">
                                <#if statement.lines?has_content>
                                    <#list statement.lines as line>
                                        <#if line_index==0>    
                                            <tr>
                                                <th align="center" colspan="3">Fecha</th>
                                                <th align="center" colspan="9">Descripción</th>
                                                <th align="center" colspan="4"><p>Vencimiento en</p><p align="center">Rangos</p></th>
                                                <th align="center" colspan="4">Importe Original</th>
                                                <th align="center" colspan="4">Importe Pendiente</th>
                                            </tr>
                                        </#if>
                                        <tr>
                                            <#if line.description == "Balance acumulado" || line.description == "Balance Forward">
                                            </#if>
                                            <#--  <td align="center" colspan="3" style="border: 1px solid #e3e3e3;">${line.datecol}</td>
                                            <td align="center" colspan="9" style="border: 1px solid #e3e3e3;">${line.description}</td>
                                            <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">Fecha</td>
                                            <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.charge}</td>
                                            <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.amountRemaining}</td>  -->
                                            <#if line.description?contains("Invoice") || line.description?contains("Factura")>
                                                <td align="center" colspan="3" style="border: 1px solid #e3e3e3;">${line.datecol}</td>
                                                <td align="center" colspan="9" style="border: 1px solid #e3e3e3;">${line.description}</td>
                                                <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">
                                                    <#assign fecha = .now>
                                                    <#assign date = (fecha?date?long - line.duedate?date?long) / (1000 * 60 * 60 * 24)>
                                                    <#--  ${date?string["0.00"]}<br />  -->
                                                    <#if date?number == 0>
                                                        ${statement.aging1@label}
                                                    <#elseif (date?number >= 1) && (date?number <= 30)>
                                                        ${statement.aging2@label}
                                                    <#elseif (date?number >= 31) && (date?number <= 60)>
                                                        ${statement.aging3@label}
                                                    <#elseif (date?number >= 61) && (date?number <= 90)>
                                                        ${statement.aging4@label}
                                                    <#elseif (date?number >= 90)>
                                                        ${statement.aging5@label}
                                                    </#if>
                                                </td>
                                                <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.charge}</td>
                                                <td align="center" colspan="4" style="border: 1px solid #e3e3e3;">${line.amountRemaining}</td>
                                            </#if>
                                        </tr>
                                    </#list>
                                </#if>
                            </table>

                            <table class="aging" style="width: 100%; margin-top: 10px;">
                                <tr>
                                    <th align="center">${statement.aging1@label}</th>
                                    <th align="center">${statement.aging2@label}</th>
                                    <th align="center">${statement.aging3@label}</th>
                                    <th align="center">${statement.aging4@label}</th>
                                    <th align="center">${statement.aging5@label}</th>
                                    <th align="center">Total</th>
                                </tr>
                                <tr>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging1}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging2}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging3}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging4}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.aging5}</td>
                                    <td align="center" style="border: 1px solid #e3e3e3;">${statement.agingbal}</td>
                                </tr>
                            </table>
                        </#if>   
                    </#list>
                </#if>
                
            </#list>
        </body>

        <#else>
            <pdf>
                <head></head>
                <body>
                    <p>Please use Single Currency Advanced Printing Template</p>
                </body>
            </pdf>
    </#if>
</pdf>