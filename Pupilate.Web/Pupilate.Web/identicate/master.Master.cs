using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Diagnostics;

namespace Pupilate.Web.identicate
{
    public partial class master : System.Web.UI.MasterPage
    {
        protected String LoginUserName { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               
            }
            catch(InvalidOperationException invEx)
            {
                Debug.WriteLine(invEx.Message, "General Error");
            }
        }

        protected string GetTime()
        {

            return DateTime.Now.ToShortTimeString();

        }
    }
}