using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;
using System.Collections;
using System.Web.Script.Serialization;

namespace ScrumTime.Helpers
{
    public class SecureJsonResult : ActionResult
    {
        public string ContentType { get; set; }
        public Encoding ContentEncoding { get; set; }
        public object Data { get; set; }

        public SecureJsonResult() { }
        public SecureJsonResult(object data)
        {
            Data = data;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }
            HttpResponseBase response = context.HttpContext.Response;
            if (!string.IsNullOrEmpty(ContentType))
            {
                response.ContentType = ContentType;
            }
            else
            {
                response.ContentType = "application/json";
            }
            if (ContentEncoding != null)
            {
                response.ContentEncoding = ContentEncoding;
            }
            if (Data != null)
            {
                var enumerable = Data as IEnumerable;
                if (enumerable != null)
                {
                    Data = new { d = enumerable };
                }
                var serializer = new JavaScriptSerializer();
                response.Write(serializer.Serialize(Data));
            }
        }
    }
}