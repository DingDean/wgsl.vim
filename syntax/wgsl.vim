" Vim syntax file
" Language: wgsl
" Maintainer: Ke Ding

if exists("b:current_syntax")
  finish
endif

" Builtin Types
syn keyword wgslTypes void
syn keyword wgslNumberTypes u32 i32 f32 bool
" TODO: match the whole vecN<T> pattern
syn keyword wgslTypes vec2 vec3 vec4
" TODO mat2x2 and 432 has different syntax
syn keyword wgslTypes mat2x2 mat2x3 mat2x4 mat3x2 mat3x3 mat3x4 mat4x2 mat4x3 mat4x4
syn keyword wgslTypes array
" TODO: match struct
syn keyword wgslTypes struct
syn keyword wgslTypes type
syn keyword wgslTypes atomic
" TODO: since token 'handle' is reserved and it's never used in a wgsl
" program, shoud we set this to a keyword?
syn keyword wgslStorageClasses handle
syn keyword wgslStorageClasses function private workgroup uniform storage handle
syn keyword wgslPointerTypes ptr ref

" Texel Format
syn keyword wgslTexelFormat R8UNORM R8SNORM R8UINT R8SINT R16UINT R16SINT R16FLOAT RG8UNORM
syn keyword wgslTexelFormat RG8SNORM RG8UINT RG8SINT R32UINT R32SINT R32FLOAT RG16UINT RG16SINT
syn keyword wgslTexelFormat RG16FLOAT RGBA8UNORM RGBA8UNORM-SRGB RGBA8SNORM RGBA8UINT RGBA8SINT BGRA8UNORM
syn keyword wgslTexelFormat RGB10A2UNORM RG11B10FLOAT RG32UINT RG32SINT RG32FLOAT RGBA16UINT
syn keyword wgslTexelFormat RGBA16SINT RGBA16FLOAT RGBA32UINT RGBA32SINT RGBA32FLOAT
" Texture Types
syn keyword wgslTextureTypes texture_1d texture_2d texture_2d_array
syn keyword wgslTextureTypes texture_3d texture_cube texture_cube_array
syn keyword wgslTextureTypes texture_multisampled_2d texture_storage_3d
syn keyword wgslTextureTypes texture_storage_1d texture_storage_2d texture_storage_2d_array
syn keyword wgslTextureTypes texture_depth_2d texture_depth_2d_array texture_depth_cube texture_depth_cube_array
" Sampler Types
syn keyword wgslSamplerTypes sampler sampler_comparison

" Comments
syn region wgslCommentLine start="//" end="$"
syn region wgslCommentBlock start="/\*" end="\*/"

" Expressions

" Builtin Variables
syn keyword wgslBuiltinVariables vertex_index instance_index
syn keyword wgslBuiltinVariables position
syn keyword wgslBuiltinVariables frag_coord front_facing frag_depth
syn keyword wgslBuiltinVariables local_invocation_id local_invocation_index global_invocation_id workgroup_id workgroup_size
syn keyword wgslBuiltinVariables sample_index sample_mask_in smaple_mask_out

" Builtin Functions
syn keyword wgslBuiltinFunctions all any select
syn keyword wgslBuiltinFunctions isFinite isInf isNan isNormal
syn keyword wgslBuiltinFunctions abs acos asin atan atan2 ceil clamp cos cosh cross distance exp exp2 faceForward floor fma
syn keyword wgslBuiltinFunctions fract frexp inverseSqrt ldexp length log log2 max min mix modf normalize pow reflect round
syn keyword wgslBuiltinFunctions sign sin sinh smoothStep sqrt step tan tanh trunc
syn keyword wgslBuiltinFunctions countOneBits countOneBits reverseBits
syn keyword wgslBuiltinFunctions determinant dot
syn keyword wgslBuiltinFunctions dpdx dpdxCoarse dpdxFine dpdy dpdyCoarse dpdyFine fwidth fwidthCoarse fwidthFine
syn keyword wgslBuiltinTextureFunctions textureDimensions textureLoad textureNumLayers textureNumLevels textureSample
syn keyword wgslBuiltinTextureFunctions  textureSampleBias textureSampleCompare textureSampleGrad textureSampleLevel textureStore

" Data Packing builtin Functions
syn keyword wgslDataPackingBuiltinFunctions pack4x8snorm pack4x8unorm pack2x16snorm pack2x16unorm pack2x16float
syn keyword wgslDataPackingBuiltinFunctions unpack4x8snorm unpack4x8unorm unpack2x16snorm unpack2x16unorm unpack2x16float

syn keyword wgslAttributes binding block builtin fragment group location stage vertex

" Keyword
syn keyword wgslKeywords fn
syn keyword wgslKeywords const let var override
syn keyword wgslKeywords break continue discard for if else loop return switch case bitcast fallthrough

syn match wgslFuncCall    "\w\(\w\)*("he=e-1,me=e-1

" Float
syntax match wgslNumber "\v<\d+(\.\d+)?([Ee][-+]?\d+)?>"
syntax match wgslNumber "\v\.\d+([Ee][-+]?\d+)?>"
syntax match wgslNumber "\v<0x\x+(\.\x+)?([Pp][-+]?\d+)?>"
syntax match wgslNumber "\v<0x\.\x+([Pp][-+]?\d+)?>"

" Integer
syntax match wgslNumber "\v<\d+u>"
syntax match wgslNumber "\v<0x\x+u>"

" Boolean
syntax keyword wgslBoolean true false

hi def link wgslTypes Type
hi def link wgslNumberTypes Float
hi def link wgslStorageClasses Type
hi def link wgslPointerTypes Type
hi def link wgslTextureTypes Type
hi def link wgslTexelFormat Type
hi def link wgslSamplerTypes Type

hi def link wgslBuiltinVariables Identifier
hi def link wgslBuiltinFunctions Function
hi def link wgslBuiltinTextureFunctions Function
hi def link wgslFuncCall Function

hi def link wgslAttributes Keyword
hi def link wgslKeywords Keyword
hi def link wgslLocation Number

hi def link wgslCommentLine Comment
hi def link wgslCommentBlock Comment

hi def link wgslNumber Number
hi def link wgslBoolean Boolean

let b:current_syntax = "wgsl"
