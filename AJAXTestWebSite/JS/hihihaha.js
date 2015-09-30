//check value radio button
function checkvalue()
{
	var radios = document.getElementsByName("name");
	for (var i = 0, length = radios.length; i < length; i++)
	{
		if (radios[i].checked)
		{
			alert(radios[i].value);
			break;
		}
	}
}

Cao cang kinh te ky thuat Vinatex - 586 Kha Van Can - Phuong Linh Dong - TD
Cao dang Cong Nghe Thu Duc - 53 Vo Van Ngan - Phuong Linh Chieu - TD
Cao dang Xay Dung so 2 - 190 Vo Van Ngan - f Binh Tho

The Greens Coffe Lounge - 55 Ung Van Khiem 
http://giaotrinhhay.com/tai-lieu-hoc-javascript-tieng-viet-danh-cho-newbie/

xmlHttp.open("GET","frmForAjaxCalls.aspx?cont=Asia",true);