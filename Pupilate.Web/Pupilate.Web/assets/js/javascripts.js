// SOCIAL LINKS ICON FOLDER (FOR FULL SITE)

var socfolder		= "images/"		  // SOCIAL LINKS FOLDER

// ERROR BLOCKING SCRIPT
function blockError(){return true;}
window.onerror = blockError;

function readURL(input) 
{
	if (input.files && input.files[0]) 
	{
		var reader = new FileReader();
		reader.onload = function (e) 
		{
			$('#blah')
			.attr('src', e.target.result)
			.width(150)
			.height(150);
		};
		reader.readAsDataURL(input.files[0]);
	}
}