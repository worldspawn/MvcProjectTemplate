using System.Web.Mvc;

namespace $safeprojectname$.Handlers.SampleArea
{
    public class SampleAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "SampleArea";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "SampleArea_default",
                "sampleArea/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new [] { "$safeprojectname$.Handlers.SampleArea.*" }
            );
        }
    }
}
