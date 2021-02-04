using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Formulaire : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_PreRender(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            HiddenField hf_id_ville = (HiddenField)FormView1.FindControl("HiddenField1");
            hf_id_ville.Value = ddl.SelectedValue;

        }
    }
}