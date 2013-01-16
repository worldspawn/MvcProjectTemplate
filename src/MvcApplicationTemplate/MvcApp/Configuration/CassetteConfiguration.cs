using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cassette;
using Cassette.Scripts;
using Cassette.Stylesheets;

namespace $safeprojectname$.Configuration
{
    public class CassetteConfiguration : IConfiguration<BundleCollection>
    {
        public void Configure(BundleCollection configurable)
        {
            configurable.Add<StylesheetBundle>("content/less",
                new FileSearch() { Pattern = "site.less" });

            var coreFiles = new[]
            {
                "jquery-1.8.3.min.js",
                "knockout-2.2.0",
                "bootstrap.min.js"
            };

            configurable.Add<ScriptBundle>("content/js/core",
                coreFiles.Select(x=> "content/js/" + x).ToArray()
                );

            var formFiles = new[]
            {
                "jquery.validate.min.js"
            };

            configurable.Add<ScriptBundle>("content/js/form",
                formFiles.Select(x => "content/js/" + x).ToArray()
                );
        }
    }
}