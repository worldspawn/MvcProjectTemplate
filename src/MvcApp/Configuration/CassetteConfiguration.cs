using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cassette;
using Cassette.Scripts;
using Cassette.Stylesheets;

namespace MvcApp.Configuration
{
    public class CassetteConfiguration : IConfiguration<BundleCollection>
    {
        public void Configure(BundleCollection configurable)
        {
            configurable.Add<Bundle>("~/content/less",
                new FileSearch() { Pattern = "site.less" });


        }
    }
}