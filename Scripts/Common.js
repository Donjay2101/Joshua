

function generateValidation(elem,msg)
{
    var htmlString = '<table cellspacing="0" cellpadding="0" border="0" style="width:100%;border-collapse:collapse;">' +
			'<tbody><tr>' +
				'<td style="padding-right:5px;"><img id="InputEmail_EI" src="/DXR.axd?r=2_81" alt="" style="height:14px;width:14px;border-width:0px;"></td><td id="InputEmail_ETC" style="color:#666666;font-family:Verdana;font-size:12px;width:100%;white-space:nowrap;">'+msg+'</td>' +
			'</tr>' +
		'</tbody></table>';
    var html=elem.parent().append(htmlString);
    //html += htmlString;
    //elem.parent().html(html);
}



