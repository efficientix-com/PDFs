<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
<#setting locale = "en_US">
    <#assign "dataXML" = "">
    <#if custom?has_content>
        <#if custom.dataXML?has_content>
            <#assign "dataXML" = custom.dataXML>

        </#if>
        <#setting locale=custom.locale>
        <#assign labels = custom.labels>
        <#if custom.certData?has_content>
            <#assign "certData" = custom.certData>
        <#else>
            <#assign "certData" = record>
        </#if>
        <#assign "satCodes" = custom.satcodes>

        <#if custom.multiCurrencyFeature == "true">
            <#assign "currencyCode" = record.currencysymbol>
            <#assign exchangeRate = record.exchangerate?string.number>
        <#else>
            <#assign "currencyCode" = "MXN">
            <#assign exchangeRate = 1>
        </#if>
        <#if custom.oneWorldFeature == "true">
            <#assign customCompanyInfo = record.subsidiary>
        <#else>
            <#assign "customCompanyInfo" = companyInformation>
        </#if>
        <#if customer.isperson == "T">
            <#assign customerName = customer.firstname + ' ' + customer.lastname>
        <#else>
            <#assign "customerName" = customer.companyname>
        </#if>
        <#assign "summary" = custom.summary>
        <#assign "totalAmount" = summary.subtotal - summary.totalDiscount>
        <#assign "companyTaxRegNumber" = custom.companyInfo.rfc>
        <#assign currencySymbolMap = {"USD":"$","CAD":"$","EUR":"€","AED":"د.إ.‏","AFN":"؋","ALL":"Lek","AMD":"դր.","ARS":"$","AUD":"$","AZN":"ман.","BAM":"KM","BDT":"৳","BGN":"лв.","BHD":"د.ب.‏","BIF":"FBu","BND":"$","BOB":"Bs","BRL":"R$","BWP":"P","BYR":"BYR","BZD":"$","CDF":"FrCD","CHF":"CHF","CLP":"$","CNY":"CN¥","COP":"$","CRC":"₡","CVE":"CV$","CZK":"Kč","DJF":"Fdj","DKK":"kr","DOP":"RD$","DZD":"د.ج.‏","EEK":"kr","EGP":"ج.م.‏","ERN":"Nfk","ETB":"Br","GBP":"£","GEL":"GEL","GHS":"GH₵","GNF":"FG","GTQ":"Q","HKD":"$","HNL":"L","HRK":"kn","HUF":"Ft","IDR":"Rp","ILS":"₪","INR":"টকা","IQD":"د.ع.‏","IRR":"﷼","ISK":"kr","JMD":"$","JOD":"د.أ.‏","JPY":"￥","KES":"Ksh","KHR":"៛","KMF":"FC","KRW":"₩","KWD":"د.ك.‏","KZT":"тңг.","LBP":"ل.ل.‏","LKR":"SL Re","LTL":"Lt","LVL":"Ls","LYD":"د.ل.‏","MAD":"د.م.‏","MDL":"MDL","MGA":"MGA","MKD":"MKD","MMK":"K","MOP":"MOP$","MUR":"MURs","MXN":"$","MYR":"RM","MZN":"MTn","NAD":"N$","NGN":"₦","NIO":"C$","NOK":"kr","NPR":"नेरू","NZD":"$","OMR":"ر.ع.‏","PAB":"B/.","PEN":"S/.","PHP":"₱","PKR":"₨","PLN":"zł","PYG":"₲","QAR":"ر.ق.‏","RON":"RON","RSD":"дин.","RUB":"руб.","RWF":"FR","SAR":"ر.س.‏","SDG":"SDG","SEK":"kr","SGD":"$","SOS":"Ssh","SYP":"ل.س.‏","THB":"฿","TND":"د.ت.‏","TOP":"T$","TRY":"TL","TTD":"$","TWD":"NT$","TZS":"TSh","UAH":"₴","UGX":"USh","UYU":"$","UZS":"UZS","VEF":"Bs.F.","VND":"₫","XAF":"FCFA","XOF":"CFA","YER":"ر.ي.‏","ZAR":"R","ZMK":"ZK"}>
        <#function fmtc_NS value>
            <#return currencySymbolMap[currencyCode] + value?string[",##0.00"]>
        </#function>

        <#function fmtc value>
            <#assign dst =  currencySymbolMap[currencyCode] + value?number?string[",##0.00"]>
            <#return dst>
        </#function>
    <#else>
        <#assign "certData" = record>
    </#if>


    <#assign infoEmpresa = record.subsidiary>
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
      <#assign addressCancelado=''>
        <#if record.custbody_efx_fe_cancelled== true >
            <#assign addressCancelado= 'PAGO CANCELADO'>
        </#if>
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
                        <span style="font-size:8px;">${record.custbody_efx_fe_dirsubs?upper_case?keep_before("EKU900")} <br />
                        <strong>Régimen Fiscal: </strong> ${record.subsidiary.custrecord_mx_sat_industry_type}</span>
                    </td>
                    <td align="right"  rowspan="3" style="padding: 0px; width: 20%;">
                        <span>
                            <strong>Pago</strong></span>
                        <br />
                            #${record.tranid}
                        <br />
                        Fecha<br />
                            ${certData.custbody_mx_cfdi_certify_timestamp?keep_before("T")}
                        <br/>
                        Lugar y fecha de Expedición<br/>
                           <span style="font-size:10px;"> ${record.custbody_efx_fe_lugar_expedicion} ${record.custbody_mx_cfdi_certify_timestamp}
                      <#if record.location?contains("Ciudad") > Ciudad de México
                            <#elseif record.location?contains("Juarez")> Ciudad Juarez <br/> <b>Sucursal Juarez</b>
                              <#elseif record.location?contains("Guadalajara")> Guadalajara <br/> <b>Sucursal Guadalajara</b>
                                <#elseif record.location?contains("Monterrey")> Monterrey <br/> <b>Sucursal Monterrey</b>
                                  <#elseif record.location?contains("Tijuana")> Tijuana <br/> <b>Sucursal Tijuana</b>
                                  <#else>
                         </#if>
                         </span>
                        <br/>
                        Tipo de comprobante: P
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
</head>
    <#if record.custbody_efx_fe_cancelled== true >
        <body  background-macro="watermark" header="nlheader" header-height="10%" footer="nlfooter" footer-height="10pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    <#else>
        <body header="nlheader" header-height="10%" footer="nlfooter" footer-height="10pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    </#if>

        <#assign efx_total=''> 
        <#assign efx_currency=''> 
        <#assign efx_currency_symbol=''> 
        <#assign efx_currency_name=''> 
        <#assign efx_exchangerate=''>
        <#assign efx_currencyCustom=''> 

        <#if record.total?has_content>
            <#assign efx_total=record.total> 

        </#if> 
        <#if record.currency?has_content>
            <#assign efx_currency=record.currency>

            <#if record.currency.symbol?has_content>
                <#assign efx_currency_symbol=record.currency.symbol> 
            </#if>
            <#if record.currency.name?has_content>
                <#assign efx_currency_name=record.currency.name> 
            </#if>


        </#if> 
        <#if record.exchangerate?has_content>
            <#assign efx_exchangerate=record.exchangerate>
        </#if> 

        <#if record.custbody_efx_fe_moneda?has_content>
            <#assign efx_currencyCustom=record.custbody_efx_fe_moneda> 

        </#if> 
        <#if efx_currencyCustom != efx_currency>
            <#if record.custbody_efx_fe_importe?has_content>
                <#assign efx_total=record.custbody_efx_fe_importe> 
            </#if> 

                <#if record.custbody_efx_fe_moneda?has_content>
                    <#assign efx_currency=record.custbody_efx_fe_moneda> 

                    <#if record.custbody_efx_fe_moneda.symbol?has_content>
                        <#assign efx_currency_symbol=record.custbody_efx_fe_moneda.symbol> 
                    </#if>
                    <#if record.custbody_efx_fe_moneda.name?has_content>
                        <#assign efx_currency_name=record.custbody_efx_fe_moneda.name> 
                    </#if>
                </#if>

            <#if record.custbody_efx_fe_tipo_cambio?has_content>
                <#assign efx_exchangerate=record.custbody_efx_fe_tipo_cambio>
            </#if>

        </#if> 
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <td colspan="8" style="padding: 0px; font-size: 8pt"><span style="font-size:10px;">
                    <strong>Receptor: </strong>  ${record.custbody_tkio_dir_pago_client_nyce}</span>
                </td>
               
            </tr>
            <tr>
                <td colspan="8" style="padding: 0px; width: 25%; font-size: 8pt;"><br/>
                    <span style="font-size:10px;">
                    <strong>RFC:</strong>  ${record.custbody_mx_customer_rfc}</span>
                </td>
            </tr>
            <tr>
                <td colspan="8" style="padding: 0px; width: 25%; font-size: 8pt"><br/>
                    <span style="font-size:10px;">
                        <strong>Uso de CFDI: </strong> ${record.custbody_mx_cfdi_usage}</span>
                </td>
               
            </tr>
            
        </table>
        
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th>Moneda:</th>
              	<th>Fecha de pago:</th>
                <th>Forma de Pago:</th>
                <th>Serie/Folio:</th>
            </tr>
            <tr>
                <td style="padding-top: 2px; font-size: 8pt">${efx_currency_symbol} - ${efx_currency_name}${record.terms}</td>
               <#if record.custbody_efx_fe_fecha_de_pago?has_content>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_efx_fe_fecha_de_pago}</td>
                 <#else>
                   <td style="padding-top: 2px; font-size: 8pt">${record.trandate}</td>
        </#if> 
                 <td style="padding-top: 2px; font-size: 8pt">${record.custbody_mx_txn_sat_payment_method}</td>
                <td style="padding-top: 2px; font-size: 8pt">#${record.tranid}</td>
            </tr>
        </table>

        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th>Cant.</th>
                <th>Cve Uni.</th>
                <th>Clave</th>
                <th>Producto/Servicio</th>
                <th>Precio unitario</th>
                <th>Importe</th>
            </tr>
            <tr>
                <td style="padding-top: 2px; font-size: 8pt">1</td>
                <td style="padding-top: 2px; font-size: 8pt">ACT</td>
                <td style="padding-top: 2px; font-size: 8pt">84111506</td>
                <td style="padding-top: 2px; font-size: 8pt">Pago</td>
                <td style="padding-top: 2px; font-size: 8pt">$ 0.00</td>
                <td style="padding-top: 2px; font-size: 8pt">$ 0.00</td>
            </tr>
            
            <tr>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td align="right" style="padding-top: 2px; font-size: 8pt">Subtotal: </td>
                <td align="right" style="padding-top: 2px; font-size: 8pt">$ 0.00</td>
            </tr>
            <tr>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td style="padding-top: 2px; font-size: 8pt"></td>
                <td align="right" style="padding-top: 2px; font-size: 8pt">Total: </td>
                <td align="right" style="padding-top: 2px; font-size: 8pt">$ 0.00</td>
            </tr>
        </table>
        

        <#if custbody_efx_fe_num_operacion?has_content || custbody_efx_fe_banco_receptor?has_content || custbody_efx_fe_rfc_banco_receptor?has_content>
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th width="100%">
                <#if record.custbody_efx_fe_num_operacion?has_content>
                    Numero de Operacion:
                </#if>
                </th>
                <th width="100%">
                <#if record.custbody_efx_fe_banco_receptor?has_content>
                    Banco Receptor:
                </#if>
                </th>
                <th width="100%">
                <#if record.custbody_efx_fe_rfc_banco_receptor?has_content>
                    RFC Banco Receptor:
                </#if>
                </th>
                    
            </tr>
            <tr>
                <td>${record.custbody_efx_fe_num_operacion}</td>
                <td>${record.custbody_efx_fe_banco_receptor}</td>
                <td>${record.custbody_efx_fe_rfc_banco_receptor}</td>
            </tr>
        </table>
        </#if>  
        <#if record.custbody_efx_fe_banco_emisor?has_content || record.custbody_efx_fe_cuenta_emisora?has_content || record.custbody_efx_fe_rfc_banco_emisor?has_content>
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th width="100%"><#if record.custbody_efx_fe_banco_emisor?has_content>
                    Banco Emisor:
                </#if>
                </th>
                <th width="100%"><#if record.custbody_efx_fe_cuenta_emisora?has_content>
                    No. Cuenta Emisora:
                </#if>
                </th>
                <th width="100%"><#if record.custbody_efx_fe_rfc_banco_emisor?has_content>
                    RFC Banco Emisor:
                </#if>
                </th>
            </tr>
            <tr>
                <td >${record.custbody_efx_fe_banco_emisor}</td>
                <td >${record.custbody_efx_fe_cuenta_emisora}</td>
                <td >${record.custbody_efx_fe_rfc_banco_emisor}</td>
            </tr>
        </table>
        </#if>
        <#if record.custbody_efx_fe_num_operacion?has_content>
            <table style="width: 100%; margin-top: 10px;">
                <tr>
                    <th width="100%">Numero de Operacion:</th>
                </tr>
                <tr>
                    <td >${record.custbody_efx_fe_num_operacion}</td>
                </tr>
        
            </table>
        </#if>
        <#if certData.apply?has_content>
            <table class="itemtable" style="width: 100%; margin-top: 10px;"><!-- start apply sublist -->
            <#list certData.apply as apply>
                <#if apply_index==0>
                    <thead>
                        <tr>
                        <th align="center" colspan="3">${apply.applydate@label}</th>
                        <th colspan="4">${apply.type@label}</th>
                        <th colspan="3">No.</th>
                        <th align="right" colspan="4">${apply.total@label}</th>
                        <th align="right" colspan="4">${apply.due@label}</th>
                        <th align="right" colspan="3">Descuento</th>
                        <th align="right" colspan="4">${apply.amount@label}</th>
                        </tr>
                    </thead>
                </#if>
                <#if apply.amount gt 0>
                    <tr>
                        <td align="center" colspan="3" line-height="150%">${apply.applydate}</td>
                        <td colspan="4">${apply.type}</td>
                        <td colspan="3">${apply.refnum}</td>
                        <td align="right" colspan="4">${apply.total}</td>
                        <td align="right" colspan="4">${apply.due}</td>
                        <td align="right" colspan="3">${apply.disc}</td>
                        <td align="right" colspan="4">${apply.amount}</td>
                    </tr>
                </#if>
            </#list><!-- end apply -->
            </table>
            <hr />
        </#if>
        

    <table class="itemtable" style="width: 100%; margin-top: 10px; margin-left: 10px; margin-right: 10px;">
        <tr style="margin-bottom:6px">
            <td align="left" colspan="5" style="border-bottom:2px"><b>Monto en letra</b></td>
            <td align="right" colspan="5" style="border-bottom:2px">${record.custbody_efx_fe_total_text}</td>
        </tr>
    </table>


    <#if custom?has_content>
        <#if custom.appliedTxns?has_content>
            <#list custom.appliedTxns as key, value>
                Key: ${key}  Value: ${value}<br/>
            </#list>
            <#assign documentTotal = 0>
            <#assign amountTotal = 0>
            <table class="itemtable" style="width: 100%; margin-top: 10px; margin-left: 10px; margin-right: 10px;"><!-- start items -->
                <#assign conteoPagos = 0>
                <#list custom.appliedTxns as appliedTxn>
                    <#assign "txnitem" = record.apply[appliedTxn.line?number]>
                    <#assign "nlineas" = appliedTxn.line?number>

                    <#assign "invPaymentTerm" = satCodes.paymentTermInvMap["d"+appliedTxn.id]>
                    <#if record.custbody_efx_fe_parcialidad?has_content>
                        <#assign "parcialidad_f_eval" = record.custbody_efx_fe_parcialidad?eval>
                    </#if>
                    <#list parcialidad_f_eval as parcialidad_f>
                        <#if txnitem.refnum == parcialidad_f.facturaRef>
                            <tr style="margin-bottom:6px">
                                <td align="left" colspan="5" style="border-bottom:2px"><b>Documento Relacionado</b></td>
                            </tr>
                            <tr style="margin-top:6px">
                                <td align="left" colspan="1">ID del Documento:</td>
                                <td align="left" colspan="2">${appliedTxn.custbody_mx_cfdi_uuid}</td>
                                <td align="left" colspan="1">Parcialidad:</td>
                                <td align="right" colspan="1">
                                    <#if record.custbody_efx_fe_parcialidad?has_content>
                                        ${parcialidad_f.parcialidad}
                                    </#if>
                                </td>

                            </tr>
                            <tr>
                                <td align="left" colspan="1">Serie/Folio:</td>
                                <td align="left" colspan="2">${parcialidad_f.facturaRef}</td>
                                <td align="left" colspan="1">Importe del Saldo Anterior:</td>

                                <#if record.custbody_efx_fe_chbx_factorage == true>
                                    <#assign prevAmount = parcialidad_f.imp + txnitem.disc>
                                <#else>
                                    <#assign prevAmount = parcialidad_f.imp>
                                </#if>

                                <td align="right" colspan="1">${nsformat_rate(prevAmount)}</td>

                            </tr>

                            <tr>
                                <td align="left" colspan="1" line-height="150%">Moneda:</td>
                                <td align="left" colspan="2" line-height="150%">${appliedTxn.currencysymbol}</td>
                                <td align="left" colspan="1" line-height="150%">Importe Pagado:</td>
                                <td align="right" colspan="1" line-height="150%">${nsformat_rate(txnitem.amount)}</td>

                            </tr>

                            <tr>
                                <td align="left" colspan="1">Tipo de Cambio:</td>
                                <td align="left" colspan="2">${record.exchangerate}</td>
                                <td align="left" colspan="1">Importe de Saldo Insoluto:</td>
                                <#assign impinsoluto =  prevAmount- txnitem.amount>

                                <td align="right" colspan="1">${nsformat_rate(impinsoluto)}</td>

                            </tr>
                            <tr>
                                <td align="left" colspan="1">Metodo de Pago:</td>
                                <td align="left" colspan="2">
                                    <#if invPaymentTerm == 'PPD'>PPD - PAGO EN PARCIALIDADES O DIFERIDO</#if>
                                    <#if invPaymentTerm == 'PUE'>PUE - PAGO EN UNA SOLA EXHIBICIÓN</#if>
                                </td>
                                <td align="left" colspan="1"></td>
                                <td align="left" colspan="1"></td>
                            </tr>
                            <#assign conteoPagos = conteoPagos+1>
                        </#if>
                    </#list>
                </#list>
                
                <#if record.custbody_efx_fe_chbx_factorage == true>
                    <!-- Factoraje -->
                    <#list custom.appliedTxns as appliedTxn>

                        <#assign "txnitem" = record.apply[appliedTxn.line?number]>
                        <#assign "nlineas" = appliedTxn.line?number>
                        <#if record.custbody_efx_fe_parcialidad?has_content>
                            <#assign "parcialidad_f_eval" = record.custbody_efx_fe_parcialidad?eval>
                            <#assign "parcialidad_f" = parcialidad_f_eval[nlineas]>
                        </#if>
                        <#assign "invPaymentTerm" = satCodes.paymentTermInvMap["d"+appliedTxn.id]>
                        <tr style="margin-bottom:6px">
                            <td align="left" colspan="5" style="border-bottom:2px"><b>Documento Relacionado</b></td>

                        </tr>
                        <tr style="margin-top:6px">
                            <td align="left" colspan="1">ID del Documento:</td>
                            <td align="left" colspan="2">${appliedTxn.custbody_mx_cfdi_uuid}</td>
                            <td align="left" colspan="1">Parcialidad:</td>
                            <td align="right" colspan="1">
                                <#if record.custbody_efx_fe_parcialidad?has_content>
                                    ${parcialidad_f.parcialidad?number + 1}
                                </#if>
                            </td>

                        </tr>
                        <tr>
                            <td align="left" colspan="1">Serie/Folio:</td>
                            <td align="left" colspan="2">${parcialidad_f.facturaRef}</td>
                            <td align="left" colspan="1">Importe del Saldo Anterior:</td>

                            <td align="right" colspan="1">${nsformat_rate(txnitem.disc)}</td>

                        </tr>

                        <tr>
                            <td align="left" colspan="1" line-height="150%">Moneda:</td>
                            <td align="left" colspan="2" line-height="150%">${appliedTxn.currencysymbol}</td>
                            <td align="left" colspan="1" line-height="150%">Importe Pagado:</td>
                            <td align="right" colspan="1" line-height="150%">${nsformat_rate(txnitem.disc)}</td>

                        </tr>

                        <tr>
                            <td align="left" colspan="1">Tipo de Cambio:</td>
                            <td align="left" colspan="2"><!--${record.exchangerate}--></td>
                            <td align="left" colspan="1">Importe de Saldo Insoluto:</td>
                            <td align="right" colspan="1">0.00</td>

                        </tr>
                        <tr>
                            <td align="left" colspan="1">Metodo de Pago:</td>
                            <td align="left" colspan="2">
                                <#if invPaymentTerm == 'PPD'>PPD - PAGO EN PARCIALIDADES O DIFERIDO</#if>
                                <#if invPaymentTerm == 'PUE'>PUE - PAGO EN UNA SOLA EXHIBICIÓN</#if>
                            </td>
                            <td align="left" colspan="1"></td>
                            <td align="left" colspan="1"></td>
                        </tr>
                    </#list>
                </#if>

            </table>
        </#if>
    </#if>

        <!-- tabla detalle parcialidad -->
        <#if record.custbody_efx_fe_parcialidad?has_content>
            <#assign parcialidadObj = record.custbody_efx_fe_parcialidad?eval>
            <table  style="width: 100%; margin-top: 10px;">
                <tr>
                    <td align="left" valign="top" width="25%"></td>
                    <th align="center" colspan="2"></th>
                    <th align="center" colspan="5">CFDI Relacionados</th>
                    <th align="center" colspan="3"></th>
                </tr>
                <tr>
                    <td align="left" valign="top" width="25%"></td>
                    <th align="center" colspan="2">Parcialidad</th>
                    <th align="center" colspan="5">Referencia de factura</th>
                    <th align="center" colspan="3">Importe</th>
                </tr>
                <#list parcialidadObj as invoice>
                    <tr>
                    <td align="left" valign="top" width="25%"></td>
                        <td align="center" colspan="2">
                        <#if  invoice.parcialidad?has_content>
                            ${invoice.parcialidad} 
                        </#if>
                        </td>
                        <td align="center" colspan="5">
                        <#if  invoice.facturaRef?has_content>
                            ${invoice.facturaRef} 
                        </#if>
                        </td>
                        <td align="center" colspan="3">
                        <#if  invoice.imp?has_content>
                           ${invoice.imp} ${record.currencysymbol}
                        </#if>
                        </td>
                    </tr>
                </#list>
            </table>
        <#else> 
            <#if record.custbody_efx_fe_cfdi_rel != ''>
                <table  style="width: 100%; margin-top: 10px;">
                    <tr>
                        <td align="left" valign="top" width="25%"></td>
                        <th>CFDI Relacionados</th>
                    </tr>
                    <tr>
                        <td align="left" valign="top" width="25%"></td>
                        <td style="align: left;">${record.custbody_efx_fe_cfdi_rel}</td>
                    </tr>
                </table>
            </#if>
        </#if>

        <#if certData.custbody_mx_cfdi_qr_code != ''>
            <table style="width: 100%; margin-top: 10px;">
                <tr>
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <th colspan="8" style="text-align:center; padding-left:45%">Información Fiscal</th>
                            </tr>
                            <tr>
                                <td colspan="2">Fecha y hora de certificación: </td>
                                <td colspan="6"> ${certData.custbody_mx_cfdi_issue_datetime}</td>
                            </tr>
                            <tr>
                                <td colspan="2">No. de Serie de Certificación: </td>
                                <td colspan="6"> ${certData.custbody_mx_cfdi_issuer_serial}</td>
                            </tr>
                            <tr>
                                <td colspan="2">Folio fiscal: </td>
                                <td colspan="6"> ${certData.custbody_mx_cfdi_uuid}</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <#assign qrcodeImage = "data:image/png;base64, " + certData.custbody_mx_cfdi_qr_code >
                        <table style="width: 100%;">
                            <tr>
                                <td align="left" valign="top" width="25%">
                                    <#if certData.custbody_mx_cfdi_qr_code != ''>
                                        <img style="width: 45mm;height:45mm" src="${qrcodeImage}"/>
                                    </#if>
                                </td>
                                <td>
                                    <table style="width: 100%;">
                                        <tr>
                                            <th style="font-size:10px;">Cadena original del complemento de certificación digital del SAT</th>
                                        </tr>
                                        <tr>
                                            <td style="align: left; font-size:8px;">${certData.custbody_mx_cfdi_cadena_original}</td>
                                        </tr>
                                        <tr>
                                            <th style="font-size:10px;">Sello digital del CFDI</th>
                                        </tr>
                                        <tr>
                                            <td style="align: left; font-size:8px;">${certData.custbody_mx_cfdi_signature}</td>
                                        </tr>
                                        <tr>
                                            <th style="font-size:10px;">Sello digital del SAT</th>
                                        </tr>
                                        <tr>
                                            <td style="align: left; font-size:8px;">${certData.custbody_mx_cfdi_sat_signature}</td>
                                        </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </#if>

    </body>
</pdf>