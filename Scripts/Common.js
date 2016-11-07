

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



function openPopup(msg)
{
    var htmlString ='<div class="banner">' +
    '<div class="head">' +
    '<img src="/Contents/image.png" id="btnClose" style="width: 3% ; float:right;margin-top: 5px;margin-right: 5px;margin-bottom: 3px;cursor:pointer">' +
    '</div>' +
    '<div class="middle" id="contentHolder">' +msg+'</div>' +
    '<div class="last">' +
    '<button class="button" id="btnOk">OK</button>' +
    '</div>' +
    '</div>';
    
    $('#popup').html(htmlString);
    $('#popup').css('display', 'block');
}


$(document).on('click', '#btnClose,#btnOk', function () {
    $('#popup').css('display','none');
});

