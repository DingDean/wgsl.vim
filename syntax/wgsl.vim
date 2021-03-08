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
" TODO: since token 'handle' is reserved and it's never used in a wgsl
" program, shoud we set this to a keyword?
syn keyword wgslStorageClasses handle
syn keyword wgslStorageClasses in out function private workgroup uniform storage handle
syn keyword wgslPointerTypes ptr

" Expressions

" Builtin Variables
syn keyword wgslBuiltinVariables vertex_index instance_index position 
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


" Keyword
syn keyword wgslKeywords var
syn keyword wgslKeywords location stage vertex fragment builtin
syn keyword wgslKeywords fn nextgroup=wgslFuncName skipwhite skipempty
syn keyword wgslKeywords location nextgroup=wgslLocation skipwhite skipempty
syn keyword wgslKeywords binding nextgroup=wgslLocation skipwhite skipempty
syn keyword wgslKeywords group nextgroup=wgslLocation skipwhite skipempty
syn match wgslFuncName "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match nextLocation "\(\d\)"



hi def link wgslTypes Type
hi def link wgslNumberTypes Float
hi def link wgslStorageClasses Type
hi def link wgslPointerTypes Type

hi def link wgslBuiltinVariables Identifier
hi def link wgslBuiltinFunctions Function
hi def link wgslBuiltinTextureFunctions Function
hi def link wgslFuncName Function

hi def link wgslKeywords Keyword
hi def link wgslLocation Number

let b:current_syntax = "wgsl"
