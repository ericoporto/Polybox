#pragma once

#include "LuaCommon.h"

struct lua_State;

namespace Bind
{
    int BindMesh(lua_State* pLua);
}