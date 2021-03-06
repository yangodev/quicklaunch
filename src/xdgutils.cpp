#include "xdgutils.h"

#include <string>
#include <vector>
#include <glibmm/miscutils.h>
// awkward mix of glibmm and glib, but what can you do
#include <glib/gfileutils.h>

#include <stdexcept>
#include <iostream>

using std::string;
using std::vector;

namespace util
{

    vector<string> get_data_dirs()
    {
        return Glib::get_system_data_dirs();
    }

    string get_history_file()
    {
        const string quicklaunch_home = Glib::get_user_data_dir() + "/quicklaunch";
        
        if (g_mkdir_with_parents(quicklaunch_home.c_str(), 0700))
        {
            // something screwed up
            throw std::runtime_error("Failed to create directory " + quicklaunch_home);
        }
        return quicklaunch_home + "/history";
    }
}
