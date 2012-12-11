; ModuleID = 'default_module'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%_Z11ServerState = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor9container3MapIiNS_4lang6DomainEEE*, i32 }
%_ZN4thor4lang6ObjectE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor9container3MapIiNS_4lang6DomainEEE = type { i8*, %_ZN4thor4lang6ObjectE*, i8*, %_ZN4thor9unmanaged4ptr_IiEE* }
%_ZN4thor9unmanaged4ptr_IiEE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4lang6DomainE = type { i8*, %_ZN4thor4lang6ObjectE*, i64, %_ZN4thor4lang6ObjectE* }
%gc_stackentry = type { %gc_stackentry*, %gc_map* }
%gc_map = type { i32, i32 }
%_ZN4thor4lang5ArrayIaEE = type { i8*, %_ZN4thor4lang6ObjectE*, i8*, %_ZN4thor9unmanaged4ptr_IaEE*, i64 }
%_ZN4thor9unmanaged4ptr_IaEE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4lang17CollectableObjectE = type {}
%_ZN4thor4lang4FlagE = type { i8*, %_ZN4thor4lang6ObjectE*, i64, i64, i64 }
%_ZN4thor4lang6StringE = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE = type { i8*, %_ZN4thor4lang6ObjectE*, i8*, %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*, i64, i64 }
%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4util4UUIDE = type { i8*, %_ZN4thor4lang6ObjectE*, i64, i64 }
%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE = type { i8*, %_ZN4thor4lang6ObjectE*, i64, %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* }
%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4lang13MutableStringE = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor4lang6ObjectE*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4lang6LambdaE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10 = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor9unmanaged4ptr_IaEE*, %_ZN4thor9unmanaged4ptr_IaEE* }
%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE = type { i8*, %_ZN4thor4lang6ObjectE*, i32, %_ZN4thor4lang6DomainE* }
%_ZN4thor9container6VectorINS_4lang6ObjectEEE = type { i8*, %_ZN4thor4lang6ObjectE*, i8*, %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*, i64, i64 }
%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor9unmanaged4ptr_IaEE*, %_ZN4thor9unmanaged4ptr_IaEE* }
%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor9unmanaged4ptr_IaEE*, %_ZN4thor9unmanaged4ptr_IaEE* }
%_ZN4thor4util7ConvertE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4util13StringBuilderE = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor9unmanaged4ptr_IlEE* }
%_ZN4thor9unmanaged4ptr_IlEE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4util7UniformE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4util6NormalE = type { i8*, %_ZN4thor4lang6ObjectE* }
%_ZN4thor4util4TimeE = type { i8*, %_ZN4thor4lang6ObjectE*, %_ZN4thor9unmanaged4ptr_IaEE* }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@__8883438839576798734_15735338558280898991_tid = weak global i64 0
@__8883438839576798734_15735338558280898991_sid = weak global i64 0
@__8883438839576798734_15735338558280898991_fid = weak global i64 0
@__2038851641496481442_5474651858227579309_tid = weak global i64 0
@__2038851641496481442_5474651858227579309_sid = weak global i64 0
@__2038851641496481442_5474651858227579309_fid = weak global i64 0
@_ZTVN4thor4lang5ArrayIaEE = weak constant [10 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang5ArrayIaEE*)* @_ZN4thor4lang5ArrayIaED1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang5ArrayIaEE*)* @_ZN4thor4lang5ArrayIaED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*), i8* bitcast (void (%_ZN4thor4lang5ArrayIaEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZN4thor4lang5ArrayIaE19getContainedObjectsEPNS0_17CollectableObjectE to i8*), i8* inttoptr (i64 -16 to i8*), i8* null, i8* bitcast (void (%_ZN4thor4lang5ArrayIaEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZThn16_N4thor4lang5ArrayIaE19getContainedObjectsEPNS0_17CollectableObjectE to i8*)]
@_ZTVN4thor4lang4FlagE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang4FlagE*)* @_ZN4thor4lang4FlagD1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang4FlagE*)* @_ZN4thor4lang4FlagD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZN4thor4lang14SingleThreadedE = internal global i32 0
@_ZGVN4thor4lang14SingleThreadedE = internal global i64 0
@_ZN4thor4lang13MultiThreadedE = internal global i32 0
@_ZGVN4thor4lang13MultiThreadedE = internal global i64 0
@_ZN4thor4lang11AcceleratorE = internal global i32 0
@_ZGVN4thor4lang11AcceleratorE = internal global i64 0
@_ZN4thor4lang9ConnectedE = internal global i32 0
@_ZGVN4thor4lang9ConnectedE = internal global i64 0
@_ZN4thor4lang12DisconnectedE = internal global i32 0
@_ZGVN4thor4lang12DisconnectedE = internal global i64 0
@_ZN4thor4lang11UnreachableE = internal global i32 0
@_ZGVN4thor4lang11UnreachableE = internal global i64 0
@_ZN4thor4lang7ResumedE = internal global i32 0
@_ZGVN4thor4lang7ResumedE = internal global i64 0
@_ZN4thor4lang7CrashedE = internal global i32 0
@_ZGVN4thor4lang7CrashedE = internal global i64 0
@_ZTVN4thor4lang6DomainE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang6DomainE*)* @_ZN4thor4lang6DomainD1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang6DomainE*)* @_ZN4thor4lang6DomainD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4lang18GarbageCollectableE = weak constant [3 x i8*] [i8* null, i8* null, i8* bitcast (void ()* @__cxa_pure_virtual to i8*)]
@_ZTVN4thor4lang6StringE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang6StringE*)* @_ZN4thor4lang6StringD1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang6StringE*)* @_ZN4thor4lang6StringD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4lang13MutableStringE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang13MutableStringE*)* @_ZN4thor4lang13MutableStringD1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang13MutableStringE*)* @_ZN4thor4lang13MutableStringD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4lang6LambdaE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang6LambdaE*)* @_ZN4thor4lang6LambdaD1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang6LambdaE*)* @_ZN4thor4lang6LambdaD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4lang7Lambda1IvNS0_6DomainEEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*)* @_ZN4thor4lang7Lambda1IvNS0_6DomainEED1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*)* @_ZN4thor4lang7Lambda1IvNS0_6DomainEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4lang6ObjectE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6ObjectD1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6ObjectD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9container3MapIiNS_4lang6DomainEEE = weak constant [10 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9container3MapIiNS_4lang6DomainEEE*)* @_ZN4thor9container3MapIiNS_4lang6DomainEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9container3MapIiNS_4lang6DomainEEE*)* @_ZN4thor9container3MapIiNS_4lang6DomainEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*), i8* bitcast (void (%_ZN4thor9container3MapIiNS_4lang6DomainEEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZN4thor9container3MapIiNS_4lang6DomainEE19getContainedObjectsEPNS2_17CollectableObjectE to i8*), i8* inttoptr (i64 -16 to i8*), i8* null, i8* bitcast (void (%_ZN4thor9container3MapIiNS_4lang6DomainEEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZThn16_N4thor9container3MapIiNS_4lang6DomainEE19getContainedObjectsEPNS2_17CollectableObjectE to i8*)]
@_ZTVN4thor9container11MapIteratorIiNS_4lang6DomainEEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*)* @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*)* @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9container8MapEntryIiNS_4lang6DomainEEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*)* @_ZN4thor9container8MapEntryIiNS_4lang6DomainEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*)* @_ZN4thor9container8MapEntryIiNS_4lang6DomainEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9container6VectorINS_4lang6ObjectEEE = weak constant [10 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang6ObjectEEE*)* @_ZN4thor9container6VectorINS_4lang6ObjectEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang6ObjectEEE*)* @_ZN4thor9container6VectorINS_4lang6ObjectEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*), i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZN4thor9container6VectorINS_4lang6ObjectEE19getContainedObjectsEPNS2_17CollectableObjectE to i8*), i8* inttoptr (i64 -16 to i8*), i8* null, i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZThn16_N4thor9container6VectorINS_4lang6ObjectEE19getContainedObjectsEPNS2_17CollectableObjectE to i8*)]
@_ZTVN4thor9container14VectorIteratorINS_4lang6ObjectEEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*)* @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*)* @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE = weak constant [10 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*)* @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*)* @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*), i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE19getContainedObjectsEPNS2_17CollectableObjectE to i8*), i8* inttoptr (i64 -16 to i8*), i8* null, i8* bitcast (void (%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, %_ZN4thor4lang17CollectableObjectE*)* @_ZThn16_N4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE19getContainedObjectsEPNS2_17CollectableObjectE to i8*)]
@_ZTVN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*)* @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*)* @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4util7ConvertE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4util7ConvertE*)* @_ZN4thor4util7ConvertD1Ev to i8*), i8* bitcast (void (%_ZN4thor4util7ConvertE*)* @_ZN4thor4util7ConvertD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4util7UniformE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4util7UniformE*)* @_ZN4thor4util7UniformD1Ev to i8*), i8* bitcast (void (%_ZN4thor4util7UniformE*)* @_ZN4thor4util7UniformD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4util6NormalE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4util6NormalE*)* @_ZN4thor4util6NormalD1Ev to i8*), i8* bitcast (void (%_ZN4thor4util6NormalE*)* @_ZN4thor4util6NormalD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4util13StringBuilderE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4util13StringBuilderE*)* @_ZN4thor4util13StringBuilderD1Ev to i8*), i8* bitcast (void (%_ZN4thor4util13StringBuilderE*)* @_ZN4thor4util13StringBuilderD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4util4UUIDE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4util4UUIDE*)* @_ZN4thor4util4UUIDD1Ev to i8*), i8* bitcast (void (%_ZN4thor4util4UUIDE*)* @_ZN4thor4util4UUIDD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor4util4TimeE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4util4TimeE*)* @_ZN4thor4util4TimeD1Ev to i8*), i8* bitcast (void (%_ZN4thor4util4TimeE*)* @_ZN4thor4util4TimeD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9unmanaged4ptr_IaEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9unmanaged4ptr_IaEE*)* @_ZN4thor9unmanaged4ptr_IaED1Ev to i8*), i8* bitcast (void (%_ZN4thor9unmanaged4ptr_IaEE*)* @_ZN4thor9unmanaged4ptr_IaED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9unmanaged4ptr_IlEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9unmanaged4ptr_IlEE*)* @_ZN4thor9unmanaged4ptr_IlED1Ev to i8*), i8* bitcast (void (%_ZN4thor9unmanaged4ptr_IlEE*)* @_ZN4thor9unmanaged4ptr_IlED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9unmanaged4ptr_INS_4lang6ObjectEEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*)* @_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*)* @_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*)* @_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEED1Ev to i8*), i8* bitcast (void (%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*)* @_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTVN4thor9unmanaged4ptr_IiEE = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor9unmanaged4ptr_IiEE*)* @_ZN4thor9unmanaged4ptr_IiED1Ev to i8*), i8* bitcast (void (%_ZN4thor9unmanaged4ptr_IiEE*)* @_ZN4thor9unmanaged4ptr_IiED0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@server_state = common global %_Z11ServerState* null
@_ZTV11ServerState = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_Z11ServerState*)* @_ZN11ServerStateD1Ev to i8*), i8* bitcast (void (%_Z11ServerState*)* @_ZN11ServerStateD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@_ZTV43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10 = weak constant [6 x i8*] [i8* null, i8* null, i8* bitcast (void (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6ObjectD1Ev to i8*), i8* bitcast (void (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6ObjectD0Ev to i8*), i8* bitcast (%_ZN4thor4lang6ObjectE* (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object5cloneEv to i8*), i8* bitcast (i64 (%_ZN4thor4lang6ObjectE*)* @_ZN4thor4lang6Object4hashEv to i8*)]
@server = common global %_ZN4thor4lang6DomainE* null
@_ZN3stm4SelfE = external thread_local global i8*
@llvm_gc_root_chain = linkonce thread_local global %gc_stackentry* null

declare double @_ZN4thor4math4acosEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4asinEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4atanEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5atan2Edd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3cosEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3sinEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3tanEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5acoshEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5asinhEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5atanhEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4coshEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4sinhEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4tanhEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3expEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4exp2Ed(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5expm1Ed(double) gc "shadow-stack-mt"

declare i64 @_ZN4thor4math5ilogbEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5ldexpEdl(double, i64) gc "shadow-stack-mt"

declare double @_ZN4thor4math3logEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5log10Ed(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5log1pEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4log2Ed(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4logbEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math6scalbnEdl(double, i64) gc "shadow-stack-mt"

declare double @_ZN4thor4math4cbrtEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4fabsEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5hypotEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3powEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4sqrtEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3erfEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4erfcEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math6lgammaEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math6tgammaEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4ceilEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5floorEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math9nearbyintEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math4rintEd(double) gc "shadow-stack-mt"

declare i64 @_ZN4thor4math5irintEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5roundEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math6iRoundEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math5truncEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3modEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math9remainderEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math8copysignEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math9nextafterEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math10nexttowardEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3dimEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3maxEdd(double, double) gc "shadow-stack-mt"

declare double @_ZN4thor4math3minEd(double) gc "shadow-stack-mt"

declare double @_ZN4thor4math2maEddd(double, double, double) gc "shadow-stack-mt"

declare i8 @_ZN4thor4math9isgreaterEdd(double, double) gc "shadow-stack-mt"

declare i8 @_ZN4thor4math14isgreaterequalEdd(double, double) gc "shadow-stack-mt"

declare i8 @_ZN4thor4math6islessEdd(double, double) gc "shadow-stack-mt"

declare i8 @_ZN4thor4math11islessequalEdd(double, double) gc "shadow-stack-mt"

declare i8 @_ZN4thor4math13islessgreaterEdd(double, double) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang5ArrayIaEC1Ev(%_ZN4thor4lang5ArrayIaEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang5ArrayIaEC1El(%_ZN4thor4lang5ArrayIaEE*, i64) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor4lang5ArrayIaE3getEl(%_ZN4thor4lang5ArrayIaEE*, i64) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang5ArrayIaE3setEla(%_ZN4thor4lang5ArrayIaEE*, i64, i8) gc "shadow-stack-mt"

declare weak i64 @_ZN4thor4lang5ArrayIaE4sizeEv(%_ZN4thor4lang5ArrayIaEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang5ArrayIaE19getContainedObjectsEPNS0_17CollectableObjectE(%_ZN4thor4lang5ArrayIaEE*, %_ZN4thor4lang17CollectableObjectE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang5ArrayIaED1Ev(%_ZN4thor4lang5ArrayIaEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang5ArrayIaED0Ev(%_ZN4thor4lang5ArrayIaEE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang4FlagC1Ev(%_ZN4thor4lang4FlagE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang4Flag13createIntegerEPNS0_6StringES3_b(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*, i8) gc "shadow-stack-mt"

declare void @_ZN4thor4lang4Flag11createFloatEPNS0_6StringES3_b(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*, i8) gc "shadow-stack-mt"

declare void @_ZN4thor4lang4Flag12createStringEPNS0_6StringES3_b(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*, i8) gc "shadow-stack-mt"

declare void @_ZN4thor4lang4Flag10positionalEPNS0_6StringE(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang4Flag5parseEv(%_ZN4thor4lang4FlagE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang4Flag3hasEPNS0_6StringE(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i64 @_ZN4thor4lang4Flag13lookupIntegerEPNS0_6StringE(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare double @_ZN4thor4lang4Flag11lookupFloatEPNS0_6StringE(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang4Flag12lookupStringEPNS0_6StringE(%_ZN4thor4lang4FlagE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang4Flag4helpEv(%_ZN4thor4lang4FlagE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang4FlagD1Ev(%_ZN4thor4lang4FlagE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang4FlagD0Ev(%_ZN4thor4lang4FlagE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang9daemonizeEv() gc "shadow-stack-mt"

declare void @_ZN4thor4lang4exitEi(i32) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang24__getCurrentInvocationIdEv() gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang29__cuda_getCurrentInvocationIdEv() gc "shadow-stack-mt"

declare i64 @_ZN4thor4lang21__getCurrentSessionIdEi(i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang6ObjectE* @_ZN4thor4lang18__getSessionObjectEl(i64) gc "shadow-stack-mt"

declare void @_ZN4thor4lang18__setSessionObjectElPNS0_6ObjectE(i64, %_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang22__setLocalDomainObjectEPNS0_6ObjectE(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang17__addDomainObjectElPNS0_6ObjectE(i64, %_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6DomainE* @_ZN4thor4lang18__findDomainObjectEl(i64) gc "shadow-stack-mt"

declare void @_ZN4thor4lang20__getDomainCallbacksEiPNS_9container6VectorINS0_7Lambda1IvNS0_6DomainEEEEE(i32, %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang16__invokeFunctionEPNS0_6ObjectEl(%_ZN4thor4lang6ObjectE*, i64) gc "shadow-stack-mt"

declare void @_ZN4thor4lang12escape_pointEv() gc "shadow-stack-mt"

declare void @_ZN4thor4lang22__RSTMSystemInitializeEv() gc "shadow-stack-mt"

declare void @_ZN4thor4lang6DomainC1Ev(%_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6DomainE* @_ZN4thor4lang6Domain6createEv() gc "shadow-stack-mt"

declare %_ZN4thor4lang6DomainE* @_ZN4thor4lang6Domain5localEv() gc "shadow-stack-mt"

declare %_ZN4thor4lang6DomainE* @_ZN4thor4lang6Domain6callerEv() gc "shadow-stack-mt"

declare %_ZN4thor4lang6ObjectE* @_ZN4thor4lang6Domain10getContextEv(%_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6Domain10setContextEPNS0_6ObjectE(%_ZN4thor4lang6DomainE*, %_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare %_ZN4thor4util4UUIDE* @_ZN4thor4lang6Domain5getIdEv(%_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6Domain5setIdEPNS_4util4UUIDE(%_ZN4thor4lang6DomainE*, %_ZN4thor4util4UUIDE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6Domain4typeEv(%_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6Domain12setSessionIdEl(%_ZN4thor4lang6DomainE*, i64) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6Domain7isEqualEPS1_(%_ZN4thor4lang6DomainE*, %_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6Domain5watchEiPNS0_7Lambda1IvS1_EE(i32, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6DomainD1Ev(%_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6DomainD0Ev(%_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang15domain_callbackEi(i32) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEb(i8) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEa(i8) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEs(i16) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEi(i32) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEl(i64) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEf(float) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEd(double) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang5traceEPNS0_6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang19thread_init_gc_rootEv() gc "shadow-stack-mt"

declare void @_ZN4thor4lang17CollectableObjectC1Ev(%_ZN4thor4lang17CollectableObjectE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang17CollectableObjectD1Ev(%_ZN4thor4lang17CollectableObjectE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang17CollectableObjectD0Ev(%_ZN4thor4lang17CollectableObjectE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6StringC1Ev(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6StringD1Ev(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6StringD0Ev(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String6createEv() gc "shadow-stack-mt"

declare i64 @_ZN4thor4lang6String4hashEv(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String7isEqualEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String10isLessThanEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String6lengthEv(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String7concateEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String4findEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String9compareToEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String19compareToIgnoreCaseEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String8endsWithEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String6equalsEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String16equalsIgnoreCaseEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String7indexOfEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String7indexOfEPS1_i(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*, i32) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String11lastIndexOfEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4lang6String11lastIndexOfEPS1_i(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*, i32) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String13regionMatchesEbiPS1_ii(%_ZN4thor4lang6StringE*, i8, i32, %_ZN4thor4lang6StringE*, i32, i32) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String13regionMatchesEiPS1_ii(%_ZN4thor4lang6StringE*, i32, %_ZN4thor4lang6StringE*, i32, i32) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String10startsWithEPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4lang6String10startsWithEPS1_i(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*, i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String9substringEi(%_ZN4thor4lang6StringE*, i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String9substringEii(%_ZN4thor4lang6StringE*, i32, i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String11toLowerCaseEv(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String11toUpperCaseEv(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String4trimEv(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang6String8toStringEv(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__Ea(%_ZN4thor4lang6StringE*, i8) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__Es(%_ZN4thor4lang6StringE*, i16) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__Ei(%_ZN4thor4lang6StringE*, i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__El(%_ZN4thor4lang6StringE*, i64) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__Ef(%_ZN4thor4lang6StringE*, float) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__Ed(%_ZN4thor4lang6StringE*, double) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__EPS1_(%_ZN4thor4lang6StringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang13MutableStringC1EPNS0_6StringE(%_ZN4thor4lang13MutableStringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang13MutableStringD1Ev(%_ZN4thor4lang13MutableStringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang13MutableStringD0Ev(%_ZN4thor4lang13MutableStringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString6createEPNS0_6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7concateEa(%_ZN4thor4lang13MutableStringE*, i8) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7concateEs(%_ZN4thor4lang13MutableStringE*, i16) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7concateEi(%_ZN4thor4lang13MutableStringE*, i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7concateEl(%_ZN4thor4lang13MutableStringE*, i64) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7concateEf(%_ZN4thor4lang13MutableStringE*, float) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7concateEd(%_ZN4thor4lang13MutableStringE*, double) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7concateEPNS0_6StringE(%_ZN4thor4lang13MutableStringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__Ea(%_ZN4thor4lang13MutableStringE*, i8) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__Es(%_ZN4thor4lang13MutableStringE*, i16) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__Ei(%_ZN4thor4lang13MutableStringE*, i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__El(%_ZN4thor4lang13MutableStringE*, i64) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__Ef(%_ZN4thor4lang13MutableStringE*, float) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__Ed(%_ZN4thor4lang13MutableStringE*, double) gc "shadow-stack-mt"

declare %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__EPNS0_6StringE(%_ZN4thor4lang13MutableStringE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6LambdaC1Ev(%_ZN4thor4lang6LambdaE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6LambdaD1Ev(%_ZN4thor4lang6LambdaE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6LambdaD0Ev(%_ZN4thor4lang6LambdaE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang7Lambda1IvNS0_6DomainEED1Ev(%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang7Lambda1IvNS0_6DomainEED0Ev(%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang7Lambda1IvNS0_6DomainEE6invokeEPS2_(%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*, %_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang7Lambda1IvNS0_6DomainEEC1Ev(%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor4lang7Lambda1IvNS0_6DomainEEC1I43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10EEPT_(%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang10initializeEv() gc "shadow-stack-mt"

declare void @_ZN4thor4lang6ObjectD1Ev(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6ObjectD0Ev(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6ObjectE* @_ZN4thor4lang6Object5cloneEv(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare i64 @_ZN4thor4lang6Object4hashEv(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6DomainE* @_ZN4thor4lang6Object6domainEv(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64, i64) gc "shadow-stack-mt"

declare void @_ZN4thor4lang15__destroyObjectEPNS0_6ObjectE(%_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container3MapIiNS_4lang6DomainEEC1Ev(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak %_ZN4thor4lang6DomainE* @_ZN4thor9container3MapIiNS_4lang6DomainEE3getEi(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*, i32) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container3MapIiNS_4lang6DomainEE3setEiPS3_(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*, i32, %_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container3MapIiNS_4lang6DomainEE6removeEi(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*, i32) gc "shadow-stack-mt"

declare weak %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* @_ZN4thor9container3MapIiNS_4lang6DomainEE4iterEv(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container3MapIiNS_4lang6DomainEE3hasEi(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*, i32) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container3MapIiNS_4lang6DomainEE5emptyEv(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak i64 @_ZN4thor9container3MapIiNS_4lang6DomainEE4sizeEv(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container3MapIiNS_4lang6DomainEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*, %_ZN4thor4lang17CollectableObjectE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container3MapIiNS_4lang6DomainEED1Ev(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container3MapIiNS_4lang6DomainEED0Ev(%_ZN4thor9container3MapIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEC1EPNS0_3MapIiS3_EE(%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*, %_ZN4thor9container3MapIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEED1Ev(%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEED0Ev(%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEE7hasNextEv(%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEE4nextEv(%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEE3getEv(%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

define weak %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEE6createEPNS0_3MapIiS3_EE(%_ZN4thor9container3MapIiNS_4lang6DomainEEE* %c) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*
  %c_parameter_alloca = alloca %_ZN4thor9container3MapIiNS_4lang6DomainEEE*
  %new_temp_8b83c496_84ac_40d4_874e_2b35f53747a0 = alloca %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*
  %0 = bitcast %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %c_parameter_alloca to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %c, %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %c_parameter_alloca
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE** %new_temp_8b83c496_84ac_40d4_874e_2b35f53747a0 to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__8883438839576798734_15735338558280898991_tid
  %3 = add i64 %2, 1
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 32, i64 %3)
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE** %retval
  ret %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* %6

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* [ null, %cast.null ], [ %9, %cast.adjust ]
  store %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* %10, %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE** %new_temp_8b83c496_84ac_40d4_874e_2b35f53747a0
  %11 = load %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE** %new_temp_8b83c496_84ac_40d4_874e_2b35f53747a0
  %12 = bitcast %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE*
  %15 = load %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %c_parameter_alloca
  call void @_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEC1EPNS0_3MapIiS3_EE(%_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* %14, %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %15)
  %16 = load %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE** %new_temp_8b83c496_84ac_40d4_874e_2b35f53747a0
  store %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE* %16, %_ZN4thor9container11MapIteratorIiNS_4lang6DomainEEE** %retval
  br label %return
}

declare weak void @_ZN4thor9container8MapEntryIiNS_4lang6DomainEEC1EPS4_(%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*, %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container8MapEntryIiNS_4lang6DomainEEC1EiPS3_(%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*, i32, %_ZN4thor4lang6DomainE*) gc "shadow-stack-mt"

define weak %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* @_ZN4thor9container8MapEntryIiNS_4lang6DomainEE6createEiPS3_(i32 %k, %_ZN4thor4lang6DomainE* %v) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*
  %k_parameter_alloca = alloca i32
  %v_parameter_alloca = alloca %_ZN4thor4lang6DomainE*
  %new_temp_0ad33b4c_08a9_4e92_a372_987b4a041f3a = alloca %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*
  store i32 %k, i32* %k_parameter_alloca
  %0 = bitcast %_ZN4thor4lang6DomainE** %v_parameter_alloca to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4lang6DomainE* %v, %_ZN4thor4lang6DomainE** %v_parameter_alloca
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE** %new_temp_0ad33b4c_08a9_4e92_a372_987b4a041f3a to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__8883438839576798734_15735338558280898991_tid
  %3 = add i64 %2, 2
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 32, i64 %3)
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE** %retval
  ret %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* %6

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* [ null, %cast.null ], [ %9, %cast.adjust ]
  store %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* %10, %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE** %new_temp_0ad33b4c_08a9_4e92_a372_987b4a041f3a
  %11 = load %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE** %new_temp_0ad33b4c_08a9_4e92_a372_987b4a041f3a
  %12 = bitcast %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*
  %15 = load i32* %k_parameter_alloca
  %16 = load %_ZN4thor4lang6DomainE** %v_parameter_alloca
  call void @_ZN4thor9container8MapEntryIiNS_4lang6DomainEEC1EiPS3_(%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* %14, i32 %15, %_ZN4thor4lang6DomainE* %16)
  %17 = load %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE** %new_temp_0ad33b4c_08a9_4e92_a372_987b4a041f3a
  store %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE* %17, %_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE** %retval
  br label %return
}

declare weak void @_ZN4thor9container8MapEntryIiNS_4lang6DomainEED1Ev(%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container8MapEntryIiNS_4lang6DomainEED0Ev(%_ZN4thor9container8MapEntryIiNS_4lang6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEEC1Ev(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEEC1El(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, i64) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEED1Ev(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEED0Ev(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEE9push_backEPS3_(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, %_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEE3addEPS3_(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, %_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEE8pop_backEv(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEE3setElPS3_(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, i64, %_ZN4thor4lang6ObjectE*) gc "shadow-stack-mt"

declare weak %_ZN4thor4lang6ObjectE* @_ZN4thor9container6VectorINS_4lang6ObjectEE3getEl(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, i64) gc "shadow-stack-mt"

declare weak %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* @_ZN4thor9container6VectorINS_4lang6ObjectEE4iterEv(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak i64 @_ZN4thor9container6VectorINS_4lang6ObjectEE4sizeEv(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak i64 @_ZN4thor9container6VectorINS_4lang6ObjectEE8capacityEv(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*, %_ZN4thor4lang17CollectableObjectE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang6ObjectEE15extend_capacityEv(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEC1EPNS0_6VectorIS3_EE(%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*, %_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEED1Ev(%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEED0Ev(%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEE7hasNextEv(%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEE4nextEv(%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

declare weak %_ZN4thor4lang6ObjectE* @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEE3getEv(%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

define weak %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEE6createEPNS0_6VectorIS3_EE(%_ZN4thor9container6VectorINS_4lang6ObjectEEE* %c) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*
  %c_parameter_alloca = alloca %_ZN4thor9container6VectorINS_4lang6ObjectEEE*
  %new_temp_6f998079_90ca_4695_a256_7b39e37a5121 = alloca %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*
  %0 = bitcast %_ZN4thor9container6VectorINS_4lang6ObjectEEE** %c_parameter_alloca to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor9container6VectorINS_4lang6ObjectEEE* %c, %_ZN4thor9container6VectorINS_4lang6ObjectEEE** %c_parameter_alloca
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121 to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 11
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 32, i64 %3)
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE** %retval
  ret %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* %6

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* [ null, %cast.null ], [ %9, %cast.adjust ]
  store %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* %10, %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121
  %11 = load %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121
  %12 = bitcast %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE*
  %15 = load %_ZN4thor9container6VectorINS_4lang6ObjectEEE** %c_parameter_alloca
  call void @_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEC1EPNS0_6VectorIS3_EE(%_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* %14, %_ZN4thor9container6VectorINS_4lang6ObjectEEE* %15)
  %16 = load %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121
  store %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE* %16, %_ZN4thor9container14VectorIteratorINS_4lang6ObjectEEE** %retval
  br label %return
}

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEC1Ev(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEC1El(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, i64) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEED1Ev(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEED0Ev(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE9push_backEPS5_(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE3addEPS5_(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE8pop_backEv(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE3setElPS5_(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, i64, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*) gc "shadow-stack-mt"

declare weak %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE3getEl(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, i64) gc "shadow-stack-mt"

declare weak %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE4iterEv(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak i64 @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE4sizeEv(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak i64 @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE8capacityEv(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, %_ZN4thor4lang17CollectableObjectE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE15extend_capacityEv(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEC1EPNS0_6VectorIS5_EE(%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*, %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEED1Ev(%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak void @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEED0Ev(%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEE7hasNextEv(%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak i8 @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEE4nextEv(%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

declare weak %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEE3getEv(%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*) gc "shadow-stack-mt"

define weak %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEE6createEPNS0_6VectorIS5_EE(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %c) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*
  %c_parameter_alloca = alloca %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*
  %new_temp_6f998079_90ca_4695_a256_7b39e37a5121 = alloca %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*
  %0 = bitcast %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %c_parameter_alloca to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %c, %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %c_parameter_alloca
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121 to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 13
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 32, i64 %3)
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %retval
  ret %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %6

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* [ null, %cast.null ], [ %9, %cast.adjust ]
  store %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %10, %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121
  %11 = load %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121
  %12 = bitcast %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE*
  %15 = load %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %c_parameter_alloca
  call void @_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEC1EPNS0_6VectorIS5_EE(%_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %14, %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %15)
  %16 = load %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %new_temp_6f998079_90ca_4695_a256_7b39e37a5121
  store %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %16, %_ZN4thor9container14VectorIteratorINS_4lang7Lambda1IvNS2_6DomainEEEEE** %retval
  br label %return
}

declare void @_ZN4thor4util7ConvertC1Ev(%_ZN4thor4util7ConvertE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util7ConvertD1Ev(%_ZN4thor4util7ConvertE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util7ConvertD0Ev(%_ZN4thor4util7ConvertE*) gc "shadow-stack-mt"

declare i8 @_ZN4thor4util7Convert6toInt8EPNS_4lang6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i16 @_ZN4thor4util7Convert7toInt16EPNS_4lang6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4util7Convert7toInt32EPNS_4lang6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare i64 @_ZN4thor4util7Convert7toInt64EPNS_4lang6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare float @_ZN4thor4util7Convert9toFloat32EPNS_4lang6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare double @_ZN4thor4util7Convert9toFloat64EPNS_4lang6StringE(%_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert8toStringEa(i8) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert8toStringEs(i16) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert8toStringEi(i32) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert8toStringEl(i64) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert8toStringEf(float) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert8toStringEd(double) gc "shadow-stack-mt"

define weak %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert11buildStringIaEEPNS_4lang6StringET_(i8 %value) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor4lang6StringE*
  %value_parameter_alloca = alloca i8
  %builder = alloca %_ZN4thor4util13StringBuilderE*, !dbg !401
  %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d = alloca %_ZN4thor4util13StringBuilderE*, !dbg !403
  store i8 %value, i8* %value_parameter_alloca
  %0 = bitcast %_ZN4thor4util13StringBuilderE** %builder to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4util13StringBuilderE* null, %_ZN4thor4util13StringBuilderE** %builder, !dbg !401
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 17
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 24, i64 %3), !dbg !403
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  call void @llvm.dbg.declare(metadata !{i8* %value_parameter_alloca}, metadata !404), !dbg !406
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %builder}, metadata !407), !dbg !401
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d}, metadata !415), !dbg !403
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor4lang6StringE** %retval
  ret %_ZN4thor4lang6StringE* %6, !dbg !416

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor4util13StringBuilderE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor4util13StringBuilderE* [ null, %cast.null ], [ %9, %cast.adjust ], !dbg !403
  store %_ZN4thor4util13StringBuilderE* %10, %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !403
  %11 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d
  %12 = bitcast %_ZN4thor4util13StringBuilderE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor4util13StringBuilderE*
  call void @_ZN4thor4util13StringBuilderC1Ev(%_ZN4thor4util13StringBuilderE* %14), !dbg !403
  %15 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !401
  store %_ZN4thor4util13StringBuilderE* %15, %_ZN4thor4util13StringBuilderE** %builder, !dbg !401
  call void @_ZN4thor4lang12escape_pointEv()
  %16 = load %_ZN4thor4util13StringBuilderE** %builder
  %17 = bitcast %_ZN4thor4util13StringBuilderE* %16 to i8*
  %18 = getelementptr i8* %17, i64 0
  %19 = bitcast i8* %18 to %_ZN4thor4util13StringBuilderE*
  %20 = load i8* %value_parameter_alloca
  call void @_ZN4thor4util13StringBuilder6appendEa(%_ZN4thor4util13StringBuilderE* %19, i8 %20), !dbg !417
  call void @_ZN4thor4lang12escape_pointEv()
  %21 = load %_ZN4thor4util13StringBuilderE** %builder
  %22 = bitcast %_ZN4thor4util13StringBuilderE* %21 to i8*
  %23 = getelementptr i8* %22, i64 0
  %24 = bitcast i8* %23 to %_ZN4thor4util13StringBuilderE*
  %25 = call %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEv(%_ZN4thor4util13StringBuilderE* %24), !dbg !418
  store %_ZN4thor4lang6StringE* %25, %_ZN4thor4lang6StringE** %retval, !dbg !419
  br label %return, !dbg !419
}

define weak %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert11buildStringIsEEPNS_4lang6StringET_(i16 %value) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor4lang6StringE*
  %value_parameter_alloca = alloca i16
  %builder = alloca %_ZN4thor4util13StringBuilderE*, !dbg !420
  %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d = alloca %_ZN4thor4util13StringBuilderE*, !dbg !422
  store i16 %value, i16* %value_parameter_alloca
  %0 = bitcast %_ZN4thor4util13StringBuilderE** %builder to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4util13StringBuilderE* null, %_ZN4thor4util13StringBuilderE** %builder, !dbg !420
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 17
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 24, i64 %3), !dbg !422
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  call void @llvm.dbg.declare(metadata !{i16* %value_parameter_alloca}, metadata !423), !dbg !425
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %builder}, metadata !426), !dbg !420
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d}, metadata !427), !dbg !422
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor4lang6StringE** %retval
  ret %_ZN4thor4lang6StringE* %6, !dbg !428

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor4util13StringBuilderE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor4util13StringBuilderE* [ null, %cast.null ], [ %9, %cast.adjust ], !dbg !422
  store %_ZN4thor4util13StringBuilderE* %10, %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !422
  %11 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d
  %12 = bitcast %_ZN4thor4util13StringBuilderE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor4util13StringBuilderE*
  call void @_ZN4thor4util13StringBuilderC1Ev(%_ZN4thor4util13StringBuilderE* %14), !dbg !422
  %15 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !420
  store %_ZN4thor4util13StringBuilderE* %15, %_ZN4thor4util13StringBuilderE** %builder, !dbg !420
  call void @_ZN4thor4lang12escape_pointEv()
  %16 = load %_ZN4thor4util13StringBuilderE** %builder
  %17 = bitcast %_ZN4thor4util13StringBuilderE* %16 to i8*
  %18 = getelementptr i8* %17, i64 0
  %19 = bitcast i8* %18 to %_ZN4thor4util13StringBuilderE*
  %20 = load i16* %value_parameter_alloca
  call void @_ZN4thor4util13StringBuilder6appendEs(%_ZN4thor4util13StringBuilderE* %19, i16 %20), !dbg !429
  call void @_ZN4thor4lang12escape_pointEv()
  %21 = load %_ZN4thor4util13StringBuilderE** %builder
  %22 = bitcast %_ZN4thor4util13StringBuilderE* %21 to i8*
  %23 = getelementptr i8* %22, i64 0
  %24 = bitcast i8* %23 to %_ZN4thor4util13StringBuilderE*
  %25 = call %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEv(%_ZN4thor4util13StringBuilderE* %24), !dbg !430
  store %_ZN4thor4lang6StringE* %25, %_ZN4thor4lang6StringE** %retval, !dbg !431
  br label %return, !dbg !431
}

define weak %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert11buildStringIiEEPNS_4lang6StringET_(i32 %value) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor4lang6StringE*
  %value_parameter_alloca = alloca i32
  %builder = alloca %_ZN4thor4util13StringBuilderE*, !dbg !432
  %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d = alloca %_ZN4thor4util13StringBuilderE*, !dbg !434
  store i32 %value, i32* %value_parameter_alloca
  %0 = bitcast %_ZN4thor4util13StringBuilderE** %builder to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4util13StringBuilderE* null, %_ZN4thor4util13StringBuilderE** %builder, !dbg !432
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 17
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 24, i64 %3), !dbg !434
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  call void @llvm.dbg.declare(metadata !{i32* %value_parameter_alloca}, metadata !435), !dbg !436
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %builder}, metadata !437), !dbg !432
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d}, metadata !438), !dbg !434
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor4lang6StringE** %retval
  ret %_ZN4thor4lang6StringE* %6, !dbg !439

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor4util13StringBuilderE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor4util13StringBuilderE* [ null, %cast.null ], [ %9, %cast.adjust ], !dbg !434
  store %_ZN4thor4util13StringBuilderE* %10, %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !434
  %11 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d
  %12 = bitcast %_ZN4thor4util13StringBuilderE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor4util13StringBuilderE*
  call void @_ZN4thor4util13StringBuilderC1Ev(%_ZN4thor4util13StringBuilderE* %14), !dbg !434
  %15 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !432
  store %_ZN4thor4util13StringBuilderE* %15, %_ZN4thor4util13StringBuilderE** %builder, !dbg !432
  call void @_ZN4thor4lang12escape_pointEv()
  %16 = load %_ZN4thor4util13StringBuilderE** %builder
  %17 = bitcast %_ZN4thor4util13StringBuilderE* %16 to i8*
  %18 = getelementptr i8* %17, i64 0
  %19 = bitcast i8* %18 to %_ZN4thor4util13StringBuilderE*
  %20 = load i32* %value_parameter_alloca
  call void @_ZN4thor4util13StringBuilder6appendEi(%_ZN4thor4util13StringBuilderE* %19, i32 %20), !dbg !440
  call void @_ZN4thor4lang12escape_pointEv()
  %21 = load %_ZN4thor4util13StringBuilderE** %builder
  %22 = bitcast %_ZN4thor4util13StringBuilderE* %21 to i8*
  %23 = getelementptr i8* %22, i64 0
  %24 = bitcast i8* %23 to %_ZN4thor4util13StringBuilderE*
  %25 = call %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEv(%_ZN4thor4util13StringBuilderE* %24), !dbg !441
  store %_ZN4thor4lang6StringE* %25, %_ZN4thor4lang6StringE** %retval, !dbg !442
  br label %return, !dbg !442
}

define weak %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert11buildStringIlEEPNS_4lang6StringET_(i64 %value) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor4lang6StringE*
  %value_parameter_alloca = alloca i64
  %builder = alloca %_ZN4thor4util13StringBuilderE*, !dbg !443
  %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d = alloca %_ZN4thor4util13StringBuilderE*, !dbg !445
  store i64 %value, i64* %value_parameter_alloca
  %0 = bitcast %_ZN4thor4util13StringBuilderE** %builder to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4util13StringBuilderE* null, %_ZN4thor4util13StringBuilderE** %builder, !dbg !443
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 17
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 24, i64 %3), !dbg !445
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  call void @llvm.dbg.declare(metadata !{i64* %value_parameter_alloca}, metadata !446), !dbg !447
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %builder}, metadata !448), !dbg !443
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d}, metadata !449), !dbg !445
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor4lang6StringE** %retval
  ret %_ZN4thor4lang6StringE* %6, !dbg !450

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor4util13StringBuilderE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor4util13StringBuilderE* [ null, %cast.null ], [ %9, %cast.adjust ], !dbg !445
  store %_ZN4thor4util13StringBuilderE* %10, %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !445
  %11 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d
  %12 = bitcast %_ZN4thor4util13StringBuilderE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor4util13StringBuilderE*
  call void @_ZN4thor4util13StringBuilderC1Ev(%_ZN4thor4util13StringBuilderE* %14), !dbg !445
  %15 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !443
  store %_ZN4thor4util13StringBuilderE* %15, %_ZN4thor4util13StringBuilderE** %builder, !dbg !443
  call void @_ZN4thor4lang12escape_pointEv()
  %16 = load %_ZN4thor4util13StringBuilderE** %builder
  %17 = bitcast %_ZN4thor4util13StringBuilderE* %16 to i8*
  %18 = getelementptr i8* %17, i64 0
  %19 = bitcast i8* %18 to %_ZN4thor4util13StringBuilderE*
  %20 = load i64* %value_parameter_alloca
  call void @_ZN4thor4util13StringBuilder6appendEl(%_ZN4thor4util13StringBuilderE* %19, i64 %20), !dbg !451
  call void @_ZN4thor4lang12escape_pointEv()
  %21 = load %_ZN4thor4util13StringBuilderE** %builder
  %22 = bitcast %_ZN4thor4util13StringBuilderE* %21 to i8*
  %23 = getelementptr i8* %22, i64 0
  %24 = bitcast i8* %23 to %_ZN4thor4util13StringBuilderE*
  %25 = call %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEv(%_ZN4thor4util13StringBuilderE* %24), !dbg !452
  store %_ZN4thor4lang6StringE* %25, %_ZN4thor4lang6StringE** %retval, !dbg !453
  br label %return, !dbg !453
}

define weak %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert11buildStringIfEEPNS_4lang6StringET_(float %value) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor4lang6StringE*
  %value_parameter_alloca = alloca float
  %builder = alloca %_ZN4thor4util13StringBuilderE*, !dbg !454
  %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d = alloca %_ZN4thor4util13StringBuilderE*, !dbg !456
  store float %value, float* %value_parameter_alloca
  %0 = bitcast %_ZN4thor4util13StringBuilderE** %builder to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4util13StringBuilderE* null, %_ZN4thor4util13StringBuilderE** %builder, !dbg !454
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 17
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 24, i64 %3), !dbg !456
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  call void @llvm.dbg.declare(metadata !{float* %value_parameter_alloca}, metadata !457), !dbg !459
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %builder}, metadata !460), !dbg !454
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d}, metadata !461), !dbg !456
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor4lang6StringE** %retval
  ret %_ZN4thor4lang6StringE* %6, !dbg !462

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor4util13StringBuilderE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor4util13StringBuilderE* [ null, %cast.null ], [ %9, %cast.adjust ], !dbg !456
  store %_ZN4thor4util13StringBuilderE* %10, %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !456
  %11 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d
  %12 = bitcast %_ZN4thor4util13StringBuilderE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor4util13StringBuilderE*
  call void @_ZN4thor4util13StringBuilderC1Ev(%_ZN4thor4util13StringBuilderE* %14), !dbg !456
  %15 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !454
  store %_ZN4thor4util13StringBuilderE* %15, %_ZN4thor4util13StringBuilderE** %builder, !dbg !454
  call void @_ZN4thor4lang12escape_pointEv()
  %16 = load %_ZN4thor4util13StringBuilderE** %builder
  %17 = bitcast %_ZN4thor4util13StringBuilderE* %16 to i8*
  %18 = getelementptr i8* %17, i64 0
  %19 = bitcast i8* %18 to %_ZN4thor4util13StringBuilderE*
  %20 = load float* %value_parameter_alloca
  call void @_ZN4thor4util13StringBuilder6appendEf(%_ZN4thor4util13StringBuilderE* %19, float %20), !dbg !463
  call void @_ZN4thor4lang12escape_pointEv()
  %21 = load %_ZN4thor4util13StringBuilderE** %builder
  %22 = bitcast %_ZN4thor4util13StringBuilderE* %21 to i8*
  %23 = getelementptr i8* %22, i64 0
  %24 = bitcast i8* %23 to %_ZN4thor4util13StringBuilderE*
  %25 = call %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEv(%_ZN4thor4util13StringBuilderE* %24), !dbg !464
  store %_ZN4thor4lang6StringE* %25, %_ZN4thor4lang6StringE** %retval, !dbg !465
  br label %return, !dbg !465
}

define weak %_ZN4thor4lang6StringE* @_ZN4thor4util7Convert11buildStringIdEEPNS_4lang6StringET_(double %value) gc "shadow-stack-mt" {
entry:
  %retval = alloca %_ZN4thor4lang6StringE*
  %value_parameter_alloca = alloca double
  %builder = alloca %_ZN4thor4util13StringBuilderE*, !dbg !466
  %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d = alloca %_ZN4thor4util13StringBuilderE*, !dbg !468
  store double %value, double* %value_parameter_alloca
  %0 = bitcast %_ZN4thor4util13StringBuilderE** %builder to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4util13StringBuilderE* null, %_ZN4thor4util13StringBuilderE** %builder, !dbg !466
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__2038851641496481442_5474651858227579309_tid
  %3 = add i64 %2, 17
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 24, i64 %3), !dbg !468
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  call void @llvm.dbg.declare(metadata !{double* %value_parameter_alloca}, metadata !469), !dbg !471
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %builder}, metadata !472), !dbg !466
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d}, metadata !473), !dbg !468
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  %6 = load %_ZN4thor4lang6StringE** %retval
  ret %_ZN4thor4lang6StringE* %6, !dbg !474

cast.adjust:                                      ; preds = %entry
  %7 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %8 = getelementptr i8* %7, i64 0
  %9 = bitcast i8* %8 to %_ZN4thor4util13StringBuilderE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %10 = phi %_ZN4thor4util13StringBuilderE* [ null, %cast.null ], [ %9, %cast.adjust ], !dbg !468
  store %_ZN4thor4util13StringBuilderE* %10, %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !468
  %11 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d
  %12 = bitcast %_ZN4thor4util13StringBuilderE* %11 to i8*
  %13 = getelementptr i8* %12, i64 0
  %14 = bitcast i8* %13 to %_ZN4thor4util13StringBuilderE*
  call void @_ZN4thor4util13StringBuilderC1Ev(%_ZN4thor4util13StringBuilderE* %14), !dbg !468
  %15 = load %_ZN4thor4util13StringBuilderE** %new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d, !dbg !466
  store %_ZN4thor4util13StringBuilderE* %15, %_ZN4thor4util13StringBuilderE** %builder, !dbg !466
  call void @_ZN4thor4lang12escape_pointEv()
  %16 = load %_ZN4thor4util13StringBuilderE** %builder
  %17 = bitcast %_ZN4thor4util13StringBuilderE* %16 to i8*
  %18 = getelementptr i8* %17, i64 0
  %19 = bitcast i8* %18 to %_ZN4thor4util13StringBuilderE*
  %20 = load double* %value_parameter_alloca
  call void @_ZN4thor4util13StringBuilder6appendEd(%_ZN4thor4util13StringBuilderE* %19, double %20), !dbg !475
  call void @_ZN4thor4lang12escape_pointEv()
  %21 = load %_ZN4thor4util13StringBuilderE** %builder
  %22 = bitcast %_ZN4thor4util13StringBuilderE* %21 to i8*
  %23 = getelementptr i8* %22, i64 0
  %24 = bitcast i8* %23 to %_ZN4thor4util13StringBuilderE*
  %25 = call %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEv(%_ZN4thor4util13StringBuilderE* %24), !dbg !476
  store %_ZN4thor4lang6StringE* %25, %_ZN4thor4lang6StringE** %retval, !dbg !477
  br label %return, !dbg !477
}

declare void @_ZN4thor4util7UniformC1Ev(%_ZN4thor4util7UniformE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util7UniformD1Ev(%_ZN4thor4util7UniformE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util7UniformD0Ev(%_ZN4thor4util7UniformE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util6NormalC1Ev(%_ZN4thor4util6NormalE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util6NormalD1Ev(%_ZN4thor4util6NormalE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util6NormalD0Ev(%_ZN4thor4util6NormalE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilderC1Ev(%_ZN4thor4util13StringBuilderE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilderC1EPNS_4lang6StringE(%_ZN4thor4util13StringBuilderE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilderD1Ev(%_ZN4thor4util13StringBuilderE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilderD0Ev(%_ZN4thor4util13StringBuilderE*) gc "shadow-stack-mt"

declare i32 @_ZN4thor4util13StringBuilder6lengthEv(%_ZN4thor4util13StringBuilderE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder7reverseEv(%_ZN4thor4util13StringBuilderE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEv(%_ZN4thor4util13StringBuilderE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util13StringBuilder8toStringEii(%_ZN4thor4util13StringBuilderE*, i32, i32) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6appendEPNS_4lang6StringE(%_ZN4thor4util13StringBuilderE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder17appendAsCharacterEa(%_ZN4thor4util13StringBuilderE*, i8) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder17appendAsCharacterEs(%_ZN4thor4util13StringBuilderE*, i16) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder17appendAsCharacterEi(%_ZN4thor4util13StringBuilderE*, i32) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6appendEa(%_ZN4thor4util13StringBuilderE*, i8) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6appendEs(%_ZN4thor4util13StringBuilderE*, i16) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6appendEi(%_ZN4thor4util13StringBuilderE*, i32) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6appendEl(%_ZN4thor4util13StringBuilderE*, i64) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6appendEf(%_ZN4thor4util13StringBuilderE*, float) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6appendEd(%_ZN4thor4util13StringBuilderE*, double) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6insertEiPNS_4lang6StringE(%_ZN4thor4util13StringBuilderE*, i32, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6insertEia(%_ZN4thor4util13StringBuilderE*, i32, i8) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6insertEis(%_ZN4thor4util13StringBuilderE*, i32, i16) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6insertEii(%_ZN4thor4util13StringBuilderE*, i32, i32) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6insertEil(%_ZN4thor4util13StringBuilderE*, i32, i64) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6insertEif(%_ZN4thor4util13StringBuilderE*, i32, float) gc "shadow-stack-mt"

declare void @_ZN4thor4util13StringBuilder6insertEid(%_ZN4thor4util13StringBuilderE*, i32, double) gc "shadow-stack-mt"

declare void @_ZN4thor4util4UUIDC1Ev(%_ZN4thor4util4UUIDE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4UUIDC1EPNS_4lang6StringE(%_ZN4thor4util4UUIDE*, %_ZN4thor4lang6StringE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4UUID6randomEv(%_ZN4thor4util4UUIDE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4UUID10invalidateEv(%_ZN4thor4util4UUIDE*) gc "shadow-stack-mt"

declare %_ZN4thor4lang6StringE* @_ZN4thor4util4UUID8toStringEv(%_ZN4thor4util4UUIDE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4UUIDD1Ev(%_ZN4thor4util4UUIDE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4UUIDD0Ev(%_ZN4thor4util4UUIDE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4TimeC1Ev(%_ZN4thor4util4TimeE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4TimeD1Ev(%_ZN4thor4util4TimeE*) gc "shadow-stack-mt"

declare void @_ZN4thor4util4TimeD0Ev(%_ZN4thor4util4TimeE*) gc "shadow-stack-mt"

declare %_ZN4thor4util4TimeE* @_ZN4thor4util4Time7currentEv() gc "shadow-stack-mt"

declare i64 @_ZN4thor4util4Time7secondsEv(%_ZN4thor4util4TimeE*) gc "shadow-stack-mt"

declare i64 @_ZN4thor4util4Time12millisecondsEv(%_ZN4thor4util4TimeE*) gc "shadow-stack-mt"

declare i64 @_ZN4thor4util4Time12microsecondsEv(%_ZN4thor4util4TimeE*) gc "shadow-stack-mt"

declare %_ZN4thor4util4TimeE* @_ZN4thor4util4Time6createEv() gc "shadow-stack-mt"

declare void @_ZN4thor2gc16performAndWaitGCEv() gc "shadow-stack-mt"

declare %_ZN4thor9container6VectorINS_4lang6ObjectEEE* @_ZN4thor2gc15getActiveObjectEv() gc "shadow-stack-mt"

declare i64 @_ZN4thor2gc15getGenerationIdEv() gc "shadow-stack-mt"

declare i8 @_ZN4thor2gc11isGCWorkingEv() gc "shadow-stack-mt"

declare void @_ZN4thor2gc11setGCEnableEb(i8) gc "shadow-stack-mt"

declare void @_ZN4thor2gc23getActiveObjectInternalEPNS_9container6VectorINS_4lang6ObjectEEE(%_ZN4thor9container6VectorINS_4lang6ObjectEEE*) gc "shadow-stack-mt"

define weak void @_ZN4thor9unmanaged4ptr_IaEC1Ev(%_ZN4thor9unmanaged4ptr_IaEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IaEE*
  store %_ZN4thor9unmanaged4ptr_IaEE* %this, %_ZN4thor9unmanaged4ptr_IaEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IaEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IaEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE* %3)
  %4 = load %_ZN4thor9unmanaged4ptr_IaEE** %this_alloca
  %5 = getelementptr inbounds %_ZN4thor9unmanaged4ptr_IaEE* %4, i32 0, i32 0
  %addr_of_vptr = bitcast i8** %5 to i8***
  store i8** getelementptr inbounds ([6 x i8*]* @_ZTVN4thor9unmanaged4ptr_IaEE, i64 0, i64 2), i8*** %addr_of_vptr
  call void @llvm.dbg.declare(metadata !{%_ZN4thor9unmanaged4ptr_IaEE** %this_alloca}, metadata !478), !dbg !480
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !480
}

define weak void @_ZN4thor9unmanaged4ptr_IaED1Ev(%_ZN4thor9unmanaged4ptr_IaEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IaEE*
  store %_ZN4thor9unmanaged4ptr_IaEE* %this, %_ZN4thor9unmanaged4ptr_IaEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IaEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IaEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectD1Ev(%_ZN4thor4lang6ObjectE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_IaED0Ev(%_ZN4thor9unmanaged4ptr_IaEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IaEE*
  store %_ZN4thor9unmanaged4ptr_IaEE* %this, %_ZN4thor9unmanaged4ptr_IaEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IaEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IaEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor9unmanaged4ptr_IaEE*
  call void @_ZN4thor9unmanaged4ptr_IaED1Ev(%_ZN4thor9unmanaged4ptr_IaEE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_IlEC1Ev(%_ZN4thor9unmanaged4ptr_IlEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IlEE*
  store %_ZN4thor9unmanaged4ptr_IlEE* %this, %_ZN4thor9unmanaged4ptr_IlEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IlEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IlEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE* %3)
  %4 = load %_ZN4thor9unmanaged4ptr_IlEE** %this_alloca
  %5 = getelementptr inbounds %_ZN4thor9unmanaged4ptr_IlEE* %4, i32 0, i32 0
  %addr_of_vptr = bitcast i8** %5 to i8***
  store i8** getelementptr inbounds ([6 x i8*]* @_ZTVN4thor9unmanaged4ptr_IlEE, i64 0, i64 2), i8*** %addr_of_vptr
  call void @llvm.dbg.declare(metadata !{%_ZN4thor9unmanaged4ptr_IlEE** %this_alloca}, metadata !481), !dbg !482
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !482
}

define weak void @_ZN4thor9unmanaged4ptr_IlED1Ev(%_ZN4thor9unmanaged4ptr_IlEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IlEE*
  store %_ZN4thor9unmanaged4ptr_IlEE* %this, %_ZN4thor9unmanaged4ptr_IlEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IlEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IlEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectD1Ev(%_ZN4thor4lang6ObjectE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_IlED0Ev(%_ZN4thor9unmanaged4ptr_IlEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IlEE*
  store %_ZN4thor9unmanaged4ptr_IlEE* %this, %_ZN4thor9unmanaged4ptr_IlEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IlEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IlEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor9unmanaged4ptr_IlEE*
  call void @_ZN4thor9unmanaged4ptr_IlED1Ev(%_ZN4thor9unmanaged4ptr_IlEE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEC1Ev(%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*
  store %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %this, %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE* %3)
  %4 = load %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca
  %5 = getelementptr inbounds %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %4, i32 0, i32 0
  %addr_of_vptr = bitcast i8** %5 to i8***
  store i8** getelementptr inbounds ([6 x i8*]* @_ZTVN4thor9unmanaged4ptr_INS_4lang6ObjectEEE, i64 0, i64 2), i8*** %addr_of_vptr
  call void @llvm.dbg.declare(metadata !{%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca}, metadata !483), !dbg !485
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !485
}

define weak void @_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEED1Ev(%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*
  store %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %this, %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectD1Ev(%_ZN4thor4lang6ObjectE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEED0Ev(%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*
  store %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %this, %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*
  call void @_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEED1Ev(%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEC1Ev(%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*
  store %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %this, %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE* %3)
  %4 = load %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca
  %5 = getelementptr inbounds %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %4, i32 0, i32 0
  %addr_of_vptr = bitcast i8** %5 to i8***
  store i8** getelementptr inbounds ([6 x i8*]* @_ZTVN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE, i64 0, i64 2), i8*** %addr_of_vptr
  call void @llvm.dbg.declare(metadata !{%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca}, metadata !486), !dbg !488
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !488
}

define weak void @_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEED1Ev(%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*
  store %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %this, %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectD1Ev(%_ZN4thor4lang6ObjectE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEED0Ev(%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*
  store %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %this, %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*
  call void @_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEED1Ev(%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_IiEC1Ev(%_ZN4thor9unmanaged4ptr_IiEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IiEE*
  store %_ZN4thor9unmanaged4ptr_IiEE* %this, %_ZN4thor9unmanaged4ptr_IiEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IiEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IiEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE* %3)
  %4 = load %_ZN4thor9unmanaged4ptr_IiEE** %this_alloca
  %5 = getelementptr inbounds %_ZN4thor9unmanaged4ptr_IiEE* %4, i32 0, i32 0
  %addr_of_vptr = bitcast i8** %5 to i8***
  store i8** getelementptr inbounds ([6 x i8*]* @_ZTVN4thor9unmanaged4ptr_IiEE, i64 0, i64 2), i8*** %addr_of_vptr
  call void @llvm.dbg.declare(metadata !{%_ZN4thor9unmanaged4ptr_IiEE** %this_alloca}, metadata !489), !dbg !490
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !490
}

define weak void @_ZN4thor9unmanaged4ptr_IiED1Ev(%_ZN4thor9unmanaged4ptr_IiEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IiEE*
  store %_ZN4thor9unmanaged4ptr_IiEE* %this, %_ZN4thor9unmanaged4ptr_IiEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IiEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IiEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectD1Ev(%_ZN4thor4lang6ObjectE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define weak void @_ZN4thor9unmanaged4ptr_IiED0Ev(%_ZN4thor9unmanaged4ptr_IiEE* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_ZN4thor9unmanaged4ptr_IiEE*
  store %_ZN4thor9unmanaged4ptr_IiEE* %this, %_ZN4thor9unmanaged4ptr_IiEE** %this_alloca
  %0 = load %_ZN4thor9unmanaged4ptr_IiEE** %this_alloca
  %1 = bitcast %_ZN4thor9unmanaged4ptr_IiEE* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor9unmanaged4ptr_IiEE*
  call void @_ZN4thor9unmanaged4ptr_IiED1Ev(%_ZN4thor9unmanaged4ptr_IiEE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define void @_Z18handle_user_comingPN4thor4lang6DomainE(%_ZN4thor4lang6DomainE* %a_client) gc "shadow-stack-mt" {
entry:
  %a_client_parameter_alloca = alloca %_ZN4thor4lang6DomainE*
  %0 = bitcast %_ZN4thor4lang6DomainE** %a_client_parameter_alloca to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4lang6DomainE* %a_client, %_ZN4thor4lang6DomainE** %a_client_parameter_alloca
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = load %_Z11ServerState** @server_state
  %2 = bitcast %_Z11ServerState* %1 to i8*
  %3 = getelementptr i8* %2, i64 0
  %4 = bitcast i8* %3 to %_Z11ServerState*
  %5 = load %_ZN4thor4lang6DomainE** %a_client_parameter_alloca
  call void @_ZN11ServerState9addClientEPN4thor4lang6DomainE(%_Z11ServerState* %4, %_ZN4thor4lang6DomainE* %5), !dbg !491
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4lang6DomainE** %a_client_parameter_alloca}, metadata !493), !dbg !494
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !495
}

define i32 @_Z11server_mainv() gc "shadow-stack-mt" {
entry:
  %retval = alloca i32
  %lambda_temp_eaabd3e4_02f9_4aca_8fba_2353b97cce86 = alloca %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*
  %lambda_temp_d3cf687f_5730_44f6_a30f_67e808e8f571 = alloca %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  %new_temp_99284782_be99_47f6_aa12_7c01abf7b74c = alloca %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  %new_temp_5310d7bc_3f10_4b96_bf1d_5f103e006de7 = alloca %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*
  call void @_ZN4thor4lang12escape_pointEv()
  %0 = bitcast %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %lambda_temp_eaabd3e4_02f9_4aca_8fba_2353b97cce86 to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* null, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %lambda_temp_eaabd3e4_02f9_4aca_8fba_2353b97cce86
  store %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* null, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %lambda_temp_eaabd3e4_02f9_4aca_8fba_2353b97cce86
  %1 = bitcast %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %lambda_temp_d3cf687f_5730_44f6_a30f_67e808e8f571 to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  store %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* null, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %lambda_temp_d3cf687f_5730_44f6_a30f_67e808e8f571
  call void @_ZN4thor4lang12escape_pointEv()
  %2 = bitcast %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %new_temp_99284782_be99_47f6_aa12_7c01abf7b74c to i8**
  call void @llvm.gcroot(i8** %2, i8* null)
  %3 = load i64* @__8883438839576798734_15735338558280898991_tid
  %4 = add i64 %3, 5
  %5 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 16, i64 %4)
  %6 = icmp eq %_ZN4thor4lang6ObjectE* %5, null
  br i1 %6, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final3
  %7 = load i32* %retval
  ret i32 %7, !dbg !496

cast.adjust:                                      ; preds = %entry
  %8 = bitcast %_ZN4thor4lang6ObjectE* %5 to i8*
  %9 = getelementptr i8* %8, i64 0
  %10 = bitcast i8* %9 to %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %11 = phi %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* [ null, %cast.null ], [ %10, %cast.adjust ]
  store %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %11, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %new_temp_99284782_be99_47f6_aa12_7c01abf7b74c
  %12 = load %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %new_temp_99284782_be99_47f6_aa12_7c01abf7b74c
  %13 = bitcast %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %12 to i8*
  %14 = getelementptr i8* %13, i64 0
  %15 = bitcast i8* %14 to %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  call void @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10C1Ev(%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %15)
  %16 = load %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %new_temp_99284782_be99_47f6_aa12_7c01abf7b74c
  store %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %16, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %lambda_temp_d3cf687f_5730_44f6_a30f_67e808e8f571
  call void @_ZN4thor4lang12escape_pointEv()
  %17 = bitcast %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %new_temp_5310d7bc_3f10_4b96_bf1d_5f103e006de7 to i8**
  call void @llvm.gcroot(i8** %17, i8* null)
  %18 = load i64* @__2038851641496481442_5474651858227579309_tid
  %19 = add i64 %18, 8
  %20 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 32, i64 %19)
  %21 = icmp eq %_ZN4thor4lang6ObjectE* %20, null
  br i1 %21, label %cast.null2, label %cast.adjust1

cast.adjust1:                                     ; preds = %cast.final
  %22 = bitcast %_ZN4thor4lang6ObjectE* %20 to i8*
  %23 = getelementptr i8* %22, i64 0
  %24 = bitcast i8* %23 to %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*
  br label %cast.final3

cast.null2:                                       ; preds = %cast.final
  br label %cast.final3

cast.final3:                                      ; preds = %cast.adjust1, %cast.null2
  %25 = phi %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* [ null, %cast.null2 ], [ %24, %cast.adjust1 ]
  store %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* %25, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %new_temp_5310d7bc_3f10_4b96_bf1d_5f103e006de7
  %26 = load %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %new_temp_5310d7bc_3f10_4b96_bf1d_5f103e006de7
  %27 = bitcast %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* %26 to i8*
  %28 = getelementptr i8* %27, i64 0
  %29 = bitcast i8* %28 to %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE*
  %30 = load %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %lambda_temp_d3cf687f_5730_44f6_a30f_67e808e8f571
  call void @_ZN4thor4lang7Lambda1IvNS0_6DomainEEC1I43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10EEPT_(%_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* %29, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %30)
  %31 = load %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %new_temp_5310d7bc_3f10_4b96_bf1d_5f103e006de7
  store %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* %31, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %lambda_temp_eaabd3e4_02f9_4aca_8fba_2353b97cce86
  call void @_ZN4thor4lang12escape_pointEv()
  %32 = load %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %lambda_temp_d3cf687f_5730_44f6_a30f_67e808e8f571
  %33 = bitcast %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %32 to i8*
  %34 = getelementptr i8* %33, i64 0
  %35 = bitcast i8* %34 to %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  call void @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e1012set_capturedEv(%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %35)
  %36 = load %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE** %lambda_temp_eaabd3e4_02f9_4aca_8fba_2353b97cce86
  call void @_ZN4thor4lang6Domain5watchEiPNS0_7Lambda1IvS1_EE(i32 0, %_ZN4thor4lang7Lambda1IvNS0_6DomainEEE* %36), !dbg !497
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang9daemonizeEv(), !dbg !499
  store i32 0, i32* %retval, !dbg !500
  br label %return, !dbg !500
}

define void @_Z9broadcastv() gc "shadow-stack-mt" {
entry:
  %i = alloca i32, !dbg !501
  %client = alloca %_ZN4thor4lang6DomainE*, !dbg !504
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  %0 = load i64* @__8883438839576798734_15735338558280898991_sid
  %1 = add i64 %0, 0
  %2 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %1)
  call void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE* %2), !dbg !506
  store i32 0, i32* %i, !dbg !507
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !508), !dbg !507
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4lang6DomainE** %client}, metadata !509), !dbg !504
  br label %for.init

return:                                           ; preds = %for.finalized
  ret void, !dbg !510

for.init:                                         ; preds = %entry
  br label %for.cond, !dbg !511

for.cond:                                         ; preds = %for.step, %for.init
  %3 = load %_Z11ServerState** @server_state, !dbg !512
  %4 = getelementptr inbounds %_Z11ServerState* %3, i32 0, i32 3, !dbg !512
  %5 = load i32* %i, !dbg !512
  %6 = load i32* %4, !dbg !512
  %7 = icmp sle i32 %5, %6
  %8 = zext i1 %7 to i8, !dbg !512
  %9 = trunc i8 %8 to i1
  br i1 %9, label %for.action, label %for.finalized, !dbg !514

for.step:                                         ; preds = %cast.final3
  %10 = load i32* %i, !dbg !515
  %11 = add i32 %10, 1, !dbg !515
  store i32 %11, i32* %i
  br label %for.cond, !dbg !516

for.action:                                       ; preds = %for.cond
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  %12 = load i64* @__8883438839576798734_15735338558280898991_sid
  %13 = add i64 %12, 1
  %14 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %13)
  %15 = bitcast %_ZN4thor4lang6StringE* %14 to i8*
  %16 = getelementptr i8* %15, i64 0
  %17 = bitcast i8* %16 to %_ZN4thor4lang6StringE*
  %18 = load i32* %i
  %19 = call %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__Ei(%_ZN4thor4lang6StringE* %17, i32 %18)
  %20 = bitcast %_ZN4thor4lang13MutableStringE* %19 to i8*
  %21 = getelementptr i8* %20, i64 0
  %22 = bitcast i8* %21 to %_ZN4thor4lang13MutableStringE*
  call void @_ZN4thor4lang12escape_pointEv()
  %23 = load i64* @__8883438839576798734_15735338558280898991_sid
  %24 = add i64 %23, 2
  %25 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %24)
  %26 = call %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__EPNS0_6StringE(%_ZN4thor4lang13MutableStringE* %22, %_ZN4thor4lang6StringE* %25)
  %27 = icmp eq %_ZN4thor4lang13MutableStringE* %26, null
  br i1 %27, label %cast.null, label %cast.adjust, !dbg !517

for.finalized:                                    ; preds = %for.cond
  br label %return

cast.adjust:                                      ; preds = %for.action
  %28 = bitcast %_ZN4thor4lang13MutableStringE* %26 to i8*
  %29 = getelementptr i8* %28, i64 0
  %30 = bitcast i8* %29 to %_ZN4thor4lang6StringE*
  br label %cast.final

cast.null:                                        ; preds = %for.action
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %31 = phi %_ZN4thor4lang6StringE* [ null, %cast.null ], [ %30, %cast.adjust ]
  call void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE* %31), !dbg !518
  %32 = bitcast %_ZN4thor4lang6DomainE** %client to i8**
  call void @llvm.gcroot(i8** %32, i8* null)
  call void @_ZN4thor4lang12escape_pointEv()
  %33 = load %_Z11ServerState** @server_state
  %34 = getelementptr inbounds %_Z11ServerState* %33, i32 0, i32 2
  %35 = load %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %34
  %36 = bitcast %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %35 to i8*
  %37 = getelementptr i8* %36, i64 0
  %38 = bitcast i8* %37 to %_ZN4thor9container3MapIiNS_4lang6DomainEEE*
  %39 = load i32* %i
  %40 = call %_ZN4thor4lang6DomainE* @_ZN4thor9container3MapIiNS_4lang6DomainEE3getEi(%_ZN4thor9container3MapIiNS_4lang6DomainEEE* %38, i32 %39), !dbg !519
  store %_ZN4thor4lang6DomainE* %40, %_ZN4thor4lang6DomainE** %client, !dbg !504
  call void @_ZN4thor4lang12escape_pointEv()
  %41 = load %_ZN4thor4lang6DomainE** %client
  %42 = icmp eq %_ZN4thor4lang6DomainE* %41, null
  br i1 %42, label %cast.null2, label %cast.adjust1

cast.adjust1:                                     ; preds = %cast.final
  %43 = bitcast %_ZN4thor4lang6DomainE* %41 to i8*
  %44 = getelementptr i8* %43, i64 0
  %45 = bitcast i8* %44 to %_ZN4thor4lang6ObjectE*
  br label %cast.final3

cast.null2:                                       ; preds = %cast.final
  br label %cast.final3

cast.final3:                                      ; preds = %cast.adjust1, %cast.null2
  %46 = phi %_ZN4thor4lang6ObjectE* [ null, %cast.null2 ], [ %45, %cast.adjust1 ]
  %47 = load i64* @__8883438839576798734_15735338558280898991_fid
  %48 = add i64 %47, 4
  call void @_ZN4thor4lang16__invokeFunctionEPNS0_6ObjectEl(%_ZN4thor4lang6ObjectE* %46, i64 %48), !dbg !520
  br label %for.step
}

define void @_ZN11ServerStateC1Ev(%_Z11ServerState* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_Z11ServerState*
  %new_temp_9e3de7fa_f256_406b_8e13_eeb6e1e26c55 = alloca %_ZN4thor9container3MapIiNS_4lang6DomainEEE*, !dbg !521
  store %_Z11ServerState* %this, %_Z11ServerState** %this_alloca
  %0 = load %_Z11ServerState** %this_alloca
  %1 = bitcast %_Z11ServerState* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE* %3)
  %4 = load %_Z11ServerState** %this_alloca
  %5 = getelementptr inbounds %_Z11ServerState* %4, i32 0, i32 2, !dbg !523
  store %_ZN4thor9container3MapIiNS_4lang6DomainEEE* null, %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %5, !dbg !523
  call void @_ZN4thor4lang12escape_pointEv()
  %6 = bitcast %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %new_temp_9e3de7fa_f256_406b_8e13_eeb6e1e26c55 to i8**
  call void @llvm.gcroot(i8** %6, i8* null)
  %7 = load i64* @__8883438839576798734_15735338558280898991_tid
  %8 = add i64 %7, 0
  %9 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 32, i64 %8), !dbg !521
  %10 = icmp eq %_ZN4thor4lang6ObjectE* %9, null
  call void @llvm.dbg.declare(metadata !{%_Z11ServerState** %this_alloca}, metadata !524), !dbg !525
  call void @llvm.dbg.declare(metadata !{%_ZN4thor9container3MapIiNS_4lang6DomainEEE** %new_temp_9e3de7fa_f256_406b_8e13_eeb6e1e26c55}, metadata !526), !dbg !521
  br i1 %10, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  ret void, !dbg !527

cast.adjust:                                      ; preds = %entry
  %11 = bitcast %_ZN4thor4lang6ObjectE* %9 to i8*
  %12 = getelementptr i8* %11, i64 0
  %13 = bitcast i8* %12 to %_ZN4thor9container3MapIiNS_4lang6DomainEEE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %14 = phi %_ZN4thor9container3MapIiNS_4lang6DomainEEE* [ null, %cast.null ], [ %13, %cast.adjust ], !dbg !521
  store %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %14, %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %new_temp_9e3de7fa_f256_406b_8e13_eeb6e1e26c55, !dbg !521
  %15 = load %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %new_temp_9e3de7fa_f256_406b_8e13_eeb6e1e26c55
  %16 = bitcast %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %15 to i8*
  %17 = getelementptr i8* %16, i64 0
  %18 = bitcast i8* %17 to %_ZN4thor9container3MapIiNS_4lang6DomainEEE*
  call void @_ZN4thor9container3MapIiNS_4lang6DomainEEC1Ev(%_ZN4thor9container3MapIiNS_4lang6DomainEEE* %18), !dbg !521
  %19 = load %_Z11ServerState** %this_alloca
  %20 = getelementptr inbounds %_Z11ServerState* %19, i32 0, i32 2, !dbg !521
  %21 = load %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %new_temp_9e3de7fa_f256_406b_8e13_eeb6e1e26c55, !dbg !521
  store %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %21, %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %20, !dbg !521
  %22 = load %_Z11ServerState** %this_alloca
  %23 = getelementptr inbounds %_Z11ServerState* %22, i32 0, i32 3, !dbg !528
  store i32 -1, i32* %23, !dbg !528
  %24 = load %_Z11ServerState** %this_alloca
  %25 = getelementptr inbounds %_Z11ServerState* %24, i32 0, i32 0
  %addr_of_vptr = bitcast i8** %25 to i8***
  store i8** getelementptr inbounds ([6 x i8*]* @_ZTV11ServerState, i64 0, i64 2), i8*** %addr_of_vptr
  br label %return
}

define void @_ZN11ServerState9addClientEPN4thor4lang6DomainE(%_Z11ServerState* %this, %_ZN4thor4lang6DomainE* %a_client) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_Z11ServerState*
  %a_client_parameter_alloca = alloca %_ZN4thor4lang6DomainE*
  store %_Z11ServerState* %this, %_Z11ServerState** %this_alloca
  %0 = bitcast %_ZN4thor4lang6DomainE** %a_client_parameter_alloca to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4lang6DomainE* %a_client, %_ZN4thor4lang6DomainE** %a_client_parameter_alloca
  %1 = load %_Z11ServerState** %this_alloca
  %2 = getelementptr inbounds %_Z11ServerState* %1, i32 0, i32 3, !dbg !529
  %3 = load i32* %2, !dbg !531
  %4 = add i32 %3, 1, !dbg !531
  store i32 %4, i32* %2
  call void @_ZN4thor4lang12escape_pointEv()
  %5 = load %_Z11ServerState** %this_alloca
  %6 = getelementptr inbounds %_Z11ServerState* %5, i32 0, i32 2
  %7 = load %_ZN4thor9container3MapIiNS_4lang6DomainEEE** %6
  %8 = bitcast %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %7 to i8*
  %9 = getelementptr i8* %8, i64 0
  %10 = bitcast i8* %9 to %_ZN4thor9container3MapIiNS_4lang6DomainEEE*
  %11 = load %_Z11ServerState** %this_alloca
  %12 = getelementptr inbounds %_Z11ServerState* %11, i32 0, i32 3
  %13 = load i32* %12
  %14 = load %_ZN4thor4lang6DomainE** %a_client_parameter_alloca
  call void @_ZN4thor9container3MapIiNS_4lang6DomainEE3setEiPS3_(%_ZN4thor9container3MapIiNS_4lang6DomainEEE* %10, i32 %13, %_ZN4thor4lang6DomainE* %14), !dbg !532
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  %15 = load i64* @__8883438839576798734_15735338558280898991_sid
  %16 = add i64 %15, 3
  %17 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %16)
  %18 = bitcast %_ZN4thor4lang6StringE* %17 to i8*
  %19 = getelementptr i8* %18, i64 0
  %20 = bitcast i8* %19 to %_ZN4thor4lang6StringE*
  %21 = load %_Z11ServerState** %this_alloca
  %22 = getelementptr inbounds %_Z11ServerState* %21, i32 0, i32 3
  %23 = load i32* %22
  %24 = call %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang6String7__add__Ei(%_ZN4thor4lang6StringE* %20, i32 %23)
  %25 = bitcast %_ZN4thor4lang13MutableStringE* %24 to i8*
  %26 = getelementptr i8* %25, i64 0
  %27 = bitcast i8* %26 to %_ZN4thor4lang13MutableStringE*
  call void @_ZN4thor4lang12escape_pointEv()
  %28 = load i64* @__8883438839576798734_15735338558280898991_sid
  %29 = add i64 %28, 4
  %30 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %29)
  %31 = call %_ZN4thor4lang13MutableStringE* @_ZN4thor4lang13MutableString7__add__EPNS0_6StringE(%_ZN4thor4lang13MutableStringE* %27, %_ZN4thor4lang6StringE* %30)
  %32 = icmp eq %_ZN4thor4lang13MutableStringE* %31, null
  call void @llvm.dbg.declare(metadata !{%_Z11ServerState** %this_alloca}, metadata !533), !dbg !534
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4lang6DomainE** %a_client_parameter_alloca}, metadata !535), !dbg !536
  br i1 %32, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  ret void, !dbg !537

cast.adjust:                                      ; preds = %entry
  %33 = bitcast %_ZN4thor4lang13MutableStringE* %31 to i8*
  %34 = getelementptr i8* %33, i64 0
  %35 = bitcast i8* %34 to %_ZN4thor4lang6StringE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %36 = phi %_ZN4thor4lang6StringE* [ null, %cast.null ], [ %35, %cast.adjust ]
  call void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE* %36), !dbg !538
  br label %return
}

define i32 @_ZN11ServerState17get_max_client_idEv(%_Z11ServerState* %this) gc "shadow-stack-mt" {
entry:
  %retval = alloca i32
  %this_alloca = alloca %_Z11ServerState*
  store %_Z11ServerState* %this, %_Z11ServerState** %this_alloca
  %0 = load %_Z11ServerState** %this_alloca
  %1 = getelementptr inbounds %_Z11ServerState* %0, i32 0, i32 3, !dbg !539
  %2 = load i32* %1, !dbg !541
  store i32 %2, i32* %retval, !dbg !541
  call void @llvm.dbg.declare(metadata !{%_Z11ServerState** %this_alloca}, metadata !542), !dbg !543
  br label %return, !dbg !541

return:                                           ; preds = %entry
  %3 = load i32* %retval
  ret i32 %3, !dbg !544
}

define void @_ZN11ServerStateD1Ev(%_Z11ServerState* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_Z11ServerState*
  store %_Z11ServerState* %this, %_Z11ServerState** %this_alloca
  %0 = load %_Z11ServerState** %this_alloca
  %1 = bitcast %_Z11ServerState* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectD1Ev(%_ZN4thor4lang6ObjectE* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define void @_ZN11ServerStateD0Ev(%_Z11ServerState* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_Z11ServerState*
  store %_Z11ServerState* %this, %_Z11ServerState** %this_alloca
  %0 = load %_Z11ServerState** %this_alloca
  %1 = bitcast %_Z11ServerState* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_Z11ServerState*
  call void @_ZN11ServerStateD1Ev(%_Z11ServerState* %3)
  br label %return

return:                                           ; preds = %entry
  ret void
}

define internal void @_Z54__global_ctor_x86_19b7ebea_c5e0_4c3a_bdf7_60deb9143b0cv() gc "shadow-stack-mt" {
entry:
  %new_temp_7f53b210_8c55_42f0_b8a6_e089665d8cc7 = alloca %_Z11ServerState*
  %0 = call i8 @_ZN4thor4lang20__addToGlobalRootSetEPa(i8* bitcast (%_Z11ServerState** @server_state to i8*))
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = bitcast %_Z11ServerState** %new_temp_7f53b210_8c55_42f0_b8a6_e089665d8cc7 to i8**
  call void @llvm.gcroot(i8** %1, i8* null)
  %2 = load i64* @__8883438839576798734_15735338558280898991_tid
  %3 = add i64 %2, 4
  %4 = call %_ZN4thor4lang6ObjectE* @_ZN4thor4lang14__createObjectEll(i64 32, i64 %3)
  %5 = icmp eq %_ZN4thor4lang6ObjectE* %4, null
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  ret void

cast.adjust:                                      ; preds = %entry
  %6 = bitcast %_ZN4thor4lang6ObjectE* %4 to i8*
  %7 = getelementptr i8* %6, i64 0
  %8 = bitcast i8* %7 to %_Z11ServerState*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %9 = phi %_Z11ServerState* [ null, %cast.null ], [ %8, %cast.adjust ]
  store %_Z11ServerState* %9, %_Z11ServerState** %new_temp_7f53b210_8c55_42f0_b8a6_e089665d8cc7
  %10 = load %_Z11ServerState** %new_temp_7f53b210_8c55_42f0_b8a6_e089665d8cc7
  %11 = bitcast %_Z11ServerState* %10 to i8*
  %12 = getelementptr i8* %11, i64 0
  %13 = bitcast i8* %12 to %_Z11ServerState*
  call void @_ZN11ServerStateC1Ev(%_Z11ServerState* %13)
  %14 = load %_Z11ServerState** %new_temp_7f53b210_8c55_42f0_b8a6_e089665d8cc7
  store %_Z11ServerState* %14, %_Z11ServerState** @server_state
  br label %return
}

define void @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10C1Ev(%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  store %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %this, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca
  %0 = load %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca
  %1 = bitcast %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %0 to i8*
  %2 = getelementptr i8* %1, i64 0
  %3 = bitcast i8* %2 to %_ZN4thor4lang6ObjectE*
  call void @_ZN4thor4lang6ObjectC1Ev(%_ZN4thor4lang6ObjectE* %3)
  %4 = load %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca
  %5 = getelementptr inbounds %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %4, i32 0, i32 0
  %addr_of_vptr = bitcast i8** %5 to i8***
  store i8** getelementptr inbounds ([6 x i8*]* @_ZTV43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10, i64 0, i64 2), i8*** %addr_of_vptr
  call void @llvm.dbg.declare(metadata !{%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca}, metadata !545), !dbg !547
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !547
}

define void @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e1012set_capturedEv(%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %this) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  store %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %this, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca
  call void @llvm.dbg.declare(metadata !{%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca}, metadata !548), !dbg !549
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !549
}

define void @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e106invokeEPN4thor4lang6DomainE(%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %this, %_ZN4thor4lang6DomainE* %target) gc "shadow-stack-mt" {
entry:
  %this_alloca = alloca %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*
  %target_parameter_alloca = alloca %_ZN4thor4lang6DomainE*
  store %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10* %this, %_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca
  %0 = bitcast %_ZN4thor4lang6DomainE** %target_parameter_alloca to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4lang6DomainE* %target, %_ZN4thor4lang6DomainE** %target_parameter_alloca
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = load %_ZN4thor4lang6DomainE** %target_parameter_alloca
  call void @_Z18handle_user_comingPN4thor4lang6DomainE(%_ZN4thor4lang6DomainE* %1), !dbg !550
  call void @_ZN4thor4lang12escape_pointEv()
  %2 = load %_ZN4thor4lang6DomainE** %target_parameter_alloca
  %3 = icmp eq %_ZN4thor4lang6DomainE* %2, null
  call void @llvm.dbg.declare(metadata !{%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10** %this_alloca}, metadata !552), !dbg !553
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4lang6DomainE** %target_parameter_alloca}, metadata !554), !dbg !555
  br i1 %3, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  ret void, !dbg !556

cast.adjust:                                      ; preds = %entry
  %4 = bitcast %_ZN4thor4lang6DomainE* %2 to i8*
  %5 = getelementptr i8* %4, i64 0
  %6 = bitcast i8* %5 to %_ZN4thor4lang6ObjectE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %7 = phi %_ZN4thor4lang6ObjectE* [ null, %cast.null ], [ %6, %cast.adjust ]
  %8 = load i64* @__8883438839576798734_15735338558280898991_fid
  %9 = add i64 %8, 2
  call void @_ZN4thor4lang16__invokeFunctionEPNS0_6ObjectEl(%_ZN4thor4lang6ObjectE* %7, i64 %9), !dbg !557
  br label %return
}

declare %_ZN4thor4lang6StringE* @_Z9raw_inputv() gc "shadow-stack-mt"

declare i64 @_Z5inputv() gc "shadow-stack-mt"

define i32 @_Z11client_mainv() gc "shadow-stack-mt" {
entry:
  %retval = alloca i32
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang9daemonizeEv(), !dbg !558
  store i32 0, i32* %retval, !dbg !560
  br label %return, !dbg !560

return:                                           ; preds = %entry
  %0 = load i32* %retval
  ret i32 %0, !dbg !561
}

define void @_Z14one_time_inputv() gc "shadow-stack-mt" {
entry:
  %x = alloca %_ZN4thor4lang6StringE*, !dbg !562
  %0 = bitcast %_ZN4thor4lang6StringE** %x to i8**
  call void @llvm.gcroot(i8** %0, i8* null)
  store %_ZN4thor4lang6StringE* null, %_ZN4thor4lang6StringE** %x, !dbg !564
  call void @_ZN4thor4lang12escape_pointEv()
  %1 = call %_ZN4thor4lang6StringE* @_Z9raw_inputv(), !dbg !562
  store %_ZN4thor4lang6StringE* %1, %_ZN4thor4lang6StringE** %x, !dbg !562
  call void @_ZN4thor4lang12escape_pointEv()
  %2 = load %_ZN4thor4lang6StringE** %x
  call void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE* %2), !dbg !565
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_Z21make_server_broadcastv(), !dbg !566
  call void @llvm.dbg.declare(metadata !{%_ZN4thor4lang6StringE** %x}, metadata !567), !dbg !564
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !568
}

define void @_Z16client_real_mainv() gc "shadow-stack-mt" {
entry:
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  %0 = load i64* @__8883438839576798734_15735338558280898991_sid
  %1 = add i64 %0, 5
  %2 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %1)
  call void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE* %2), !dbg !569
  call void @_ZN4thor4lang12escape_pointEv()
  %3 = call %_ZN4thor4lang6DomainE* @_ZN4thor4lang6Domain6callerEv(), !dbg !571
  store %_ZN4thor4lang6DomainE* %3, %_ZN4thor4lang6DomainE** @server, !dbg !571
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  %4 = call %_ZN4thor4lang6DomainE* @_ZN4thor4lang6Domain5localEv()
  %5 = icmp eq %_ZN4thor4lang6DomainE* %4, null
  br i1 %5, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  ret void, !dbg !572

cast.adjust:                                      ; preds = %entry
  %6 = bitcast %_ZN4thor4lang6DomainE* %4 to i8*
  %7 = getelementptr i8* %6, i64 0
  %8 = bitcast i8* %7 to %_ZN4thor4lang6ObjectE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %9 = phi %_ZN4thor4lang6ObjectE* [ null, %cast.null ], [ %8, %cast.adjust ]
  %10 = load i64* @__8883438839576798734_15735338558280898991_fid
  %11 = add i64 %10, 1
  call void @_ZN4thor4lang16__invokeFunctionEPNS0_6ObjectEl(%_ZN4thor4lang6ObjectE* %9, i64 %11), !dbg !573
  br label %return
}

define void @_Z21make_server_broadcastv() gc "shadow-stack-mt" {
entry:
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  %0 = load i64* @__8883438839576798734_15735338558280898991_sid
  %1 = add i64 %0, 6
  %2 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %1)
  call void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE* %2), !dbg !574
  call void @_ZN4thor4lang12escape_pointEv()
  %3 = load %_ZN4thor4lang6DomainE** @server
  %4 = icmp eq %_ZN4thor4lang6DomainE* %3, null
  br i1 %4, label %cast.null, label %cast.adjust

return:                                           ; preds = %cast.final
  ret void, !dbg !576

cast.adjust:                                      ; preds = %entry
  %5 = bitcast %_ZN4thor4lang6DomainE* %3 to i8*
  %6 = getelementptr i8* %5, i64 0
  %7 = bitcast i8* %6 to %_ZN4thor4lang6ObjectE*
  br label %cast.final

cast.null:                                        ; preds = %entry
  br label %cast.final

cast.final:                                       ; preds = %cast.adjust, %cast.null
  %8 = phi %_ZN4thor4lang6ObjectE* [ null, %cast.null ], [ %7, %cast.adjust ]
  %9 = load i64* @__8883438839576798734_15735338558280898991_fid
  %10 = add i64 %9, 7
  call void @_ZN4thor4lang16__invokeFunctionEPNS0_6ObjectEl(%_ZN4thor4lang6ObjectE* %8, i64 %10), !dbg !577
  br label %return
}

define void @_Z19print_broadcast_msgv() gc "shadow-stack-mt" {
entry:
  call void @_ZN4thor4lang12escape_pointEv()
  call void @_ZN4thor4lang12escape_pointEv()
  %0 = load i64* @__8883438839576798734_15735338558280898991_sid
  %1 = add i64 %0, 7
  %2 = call %_ZN4thor4lang6StringE* @_ZN4thor4lang18__getStringLiteralEl(i64 %1)
  call void @_ZN4thor4lang5printEPNS0_6StringE(%_ZN4thor4lang6StringE* %2), !dbg !578
  br label %return

return:                                           ; preds = %entry
  ret void, !dbg !580
}

define internal void @_Z54__global_ctor_x86_43a9bb73_1d6e_485f_883d_8012ec061e12v() gc "shadow-stack-mt" {
entry:
  %0 = call i8 @_ZN4thor4lang20__addToGlobalRootSetEPa(i8* bitcast (%_ZN4thor4lang6DomainE** @server to i8*))
  store %_ZN4thor4lang6DomainE* null, %_ZN4thor4lang6DomainE** @server
  br label %return

return:                                           ; preds = %entry
  ret void
}

declare void @__cxa_pure_virtual()

define weak void @_ZThn16_N4thor4lang5ArrayIaE19getContainedObjectsEPNS0_17CollectableObjectE(%_ZN4thor4lang5ArrayIaEE* %this, %_ZN4thor4lang17CollectableObjectE* %o) {
entry:
  %0 = bitcast %_ZN4thor4lang5ArrayIaEE* %this to i8*
  %1 = getelementptr i8* %0, i64 -16
  %2 = bitcast i8* %1 to %_ZN4thor4lang5ArrayIaEE*
  call void @_ZN4thor4lang5ArrayIaE19getContainedObjectsEPNS0_17CollectableObjectE(%_ZN4thor4lang5ArrayIaEE* %2, %_ZN4thor4lang17CollectableObjectE* %o)
  ret void
}

define weak void @_ZThn16_N4thor9container3MapIiNS_4lang6DomainEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container3MapIiNS_4lang6DomainEEE* %this, %_ZN4thor4lang17CollectableObjectE* %o) {
entry:
  %0 = bitcast %_ZN4thor9container3MapIiNS_4lang6DomainEEE* %this to i8*
  %1 = getelementptr i8* %0, i64 -16
  %2 = bitcast i8* %1 to %_ZN4thor9container3MapIiNS_4lang6DomainEEE*
  call void @_ZN4thor9container3MapIiNS_4lang6DomainEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container3MapIiNS_4lang6DomainEEE* %2, %_ZN4thor4lang17CollectableObjectE* %o)
  ret void
}

define weak void @_ZThn16_N4thor9container6VectorINS_4lang6ObjectEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container6VectorINS_4lang6ObjectEEE* %this, %_ZN4thor4lang17CollectableObjectE* %o) {
entry:
  %0 = bitcast %_ZN4thor9container6VectorINS_4lang6ObjectEEE* %this to i8*
  %1 = getelementptr i8* %0, i64 -16
  %2 = bitcast i8* %1 to %_ZN4thor9container6VectorINS_4lang6ObjectEEE*
  call void @_ZN4thor9container6VectorINS_4lang6ObjectEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container6VectorINS_4lang6ObjectEEE* %2, %_ZN4thor4lang17CollectableObjectE* %o)
  ret void
}

define weak void @_ZThn16_N4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %this, %_ZN4thor4lang17CollectableObjectE* %o) {
entry:
  %0 = bitcast %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %this to i8*
  %1 = getelementptr i8* %0, i64 -16
  %2 = bitcast i8* %1 to %_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE*
  call void @_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEE19getContainedObjectsEPNS2_17CollectableObjectE(%_ZN4thor9container6VectorINS_4lang7Lambda1IvNS2_6DomainEEEEE* %2, %_ZN4thor4lang17CollectableObjectE* %o)
  ret void
}

declare void @_ZN3stm8sys_initEPFvPNS_8TxThreadEE(void (i8*)*) nounwind

declare void @_ZN3stm11thread_initEv() nounwind

declare void @_ZN3stm15thread_shutdownEv() nounwind

declare void @_ZN3stm12sys_shutdownEv() nounwind

declare void @_ZN3stm5beginEPNS_8TxThreadEPvj(i8*, i8*, i32) nounwind

declare void @_ZN3stm6commitEPNS_8TxThreadE(i8*) nounwind

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

declare i32 @_ZN3stm8stm_readIbEET_PS1_PNS_8TxThreadE(i8*, i8*) nounwind

declare i32 @_ZN3stm8stm_readIaEET_PS1_PNS_8TxThreadE(i8*, i8*) nounwind

declare i32 @_ZN3stm8stm_readIiEET_PS1_PNS_8TxThreadE(i32*, i8*) nounwind

declare i32 @_ZN3stm8stm_readIlEET_PS1_PNS_8TxThreadE(i64*, i8*) nounwind

declare i32 @_ZN3stm8stm_readIfEET_PS1_PNS_8TxThreadE(float*, i8*) nounwind

declare i32 @_ZN3stm8stm_readIdEET_PS1_PNS_8TxThreadE(double*, i8*) nounwind

declare i32 @_ZN3stm8stm_readIdEET_PS1_PNS_8TxThreadE1(i8**, i8*) nounwind

declare i32 @_ZN3stm9stm_writeIbEEvPT_S1_PNS_8TxThreadE(i8*, i8, i8*) nounwind

declare i32 @_ZN3stm9stm_writeIaEEvPT_S1_PNS_8TxThreadE(i8*, i8, i8*) nounwind

declare i32 @_ZN3stm9stm_writeIiEEvPT_S1_PNS_8TxThreadE(i32*, i32, i8*) nounwind

declare i32 @_ZN3stm9stm_writeIlEEvPT_S1_PNS_8TxThreadE(i64*, i64, i8*) nounwind

declare i32 @_ZN3stm9stm_writeIfEEvPT_S1_PNS_8TxThreadE(float*, float, i8*) nounwind

declare i32 @_ZN3stm9stm_writeIdEEvPT_S1_PNS_8TxThreadE(double*, double, i8*) nounwind

declare i32 @_ZN3stm9stm_writeIdEEvPT_S1_PNS_8TxThreadE2(i8*, i8*, i8*) nounwind

declare void @llvm.gcroot(i8**, i8*) nounwind

declare i8 @_ZN4thor4lang20__addToGlobalRootSetEPa(i8*)

define void @__0e26e2e0_8e50_487b_af19_d7a20c275fda_init() {
entry:
  call void @_Z54__global_ctor_x86_19b7ebea_c5e0_4c3a_bdf7_60deb9143b0cv()
  call void @_Z54__global_ctor_x86_43a9bb73_1d6e_485f_883d_8012ec061e12v()
  ret void
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

!llvm.dbg.cu = !{!0, !9, !18, !27, !36, !45, !54, !63, !72, !81, !90, !99, !108, !117, !126, !135, !144, !153, !162, !171, !180, !189, !198, !207, !216, !225, !234, !243}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/math/Math.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/math", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !3, metadata !5, metadata !7} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 786468}                       ; [ DW_TAG_base_type ]
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786468}                       ; [ DW_TAG_base_type ]
!5 = metadata !{metadata !6}
!6 = metadata !{i32 786468}                       ; [ DW_TAG_base_type ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468}                       ; [ DW_TAG_base_type ]
!9 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/math/BigFloat.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/math", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !10, metadata !12, metadata !14, metadata !16} ; [ DW_TAG_compile_unit ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!18 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/math/BigInteger.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/math", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !19, metadata !21, metadata !23, metadata !25} ; [ DW_TAG_compile_unit ]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!27 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/Array.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !28, metadata !30, metadata !32, metadata !34} ; [ DW_TAG_compile_unit ]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!36 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/Flag.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !37, metadata !39, metadata !41, metadata !43} ; [ DW_TAG_compile_unit ]
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!45 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/Process.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !46, metadata !48, metadata !50, metadata !52} ; [ DW_TAG_compile_unit ]
!46 = metadata !{metadata !47}
!47 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!50 = metadata !{metadata !51}
!51 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!52 = metadata !{metadata !53}
!53 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!54 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/Domain.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !55, metadata !57, metadata !59, metadata !61} ; [ DW_TAG_compile_unit ]
!55 = metadata !{metadata !56}
!56 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!61 = metadata !{metadata !62}
!62 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!63 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/Debug.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !64, metadata !66, metadata !68, metadata !70} ; [ DW_TAG_compile_unit ]
!64 = metadata !{metadata !65}
!65 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!66 = metadata !{metadata !67}
!67 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!68 = metadata !{metadata !69}
!69 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!70 = metadata !{metadata !71}
!71 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!72 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/GarbageCollectable.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !73, metadata !75, metadata !77, metadata !79} ; [ DW_TAG_compile_unit ]
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!75 = metadata !{metadata !76}
!76 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!77 = metadata !{metadata !78}
!78 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!81 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/String.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !82, metadata !84, metadata !86, metadata !88} ; [ DW_TAG_compile_unit ]
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!84 = metadata !{metadata !85}
!85 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!86 = metadata !{metadata !87}
!87 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!88 = metadata !{metadata !89}
!89 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!90 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/Lambda.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !91, metadata !93, metadata !95, metadata !97} ; [ DW_TAG_compile_unit ]
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!93 = metadata !{metadata !94}
!94 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!99 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang/Language.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !100, metadata !102, metadata !104, metadata !106} ; [ DW_TAG_compile_unit ]
!100 = metadata !{metadata !101}
!101 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!102 = metadata !{metadata !103}
!103 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!106 = metadata !{metadata !107}
!107 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!108 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/container/HashMap.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/container", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !109, metadata !111, metadata !113, metadata !115} ; [ DW_TAG_compile_unit ]
!109 = metadata !{metadata !110}
!110 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!113 = metadata !{metadata !114}
!114 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!115 = metadata !{metadata !116}
!116 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!117 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/container/Map.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/container", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !118, metadata !120, metadata !122, metadata !124} ; [ DW_TAG_compile_unit ]
!118 = metadata !{metadata !119}
!119 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!120 = metadata !{metadata !121}
!121 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!122 = metadata !{metadata !123}
!123 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!124 = metadata !{metadata !125}
!125 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!126 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/container/Vector.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/container", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !127, metadata !129, metadata !131, metadata !133} ; [ DW_TAG_compile_unit ]
!127 = metadata !{metadata !128}
!128 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!129 = metadata !{metadata !130}
!130 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!131 = metadata !{metadata !132}
!132 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!133 = metadata !{metadata !134}
!134 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!135 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/Convert.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !136, metadata !138, metadata !140, metadata !142} ; [ DW_TAG_compile_unit ]
!136 = metadata !{metadata !137}
!137 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!138 = metadata !{metadata !139}
!139 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!140 = metadata !{metadata !141}
!141 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!142 = metadata !{metadata !143}
!143 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!144 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/Random.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !145, metadata !147, metadata !149, metadata !151} ; [ DW_TAG_compile_unit ]
!145 = metadata !{metadata !146}
!146 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!147 = metadata !{metadata !148}
!148 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!149 = metadata !{metadata !150}
!150 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!151 = metadata !{metadata !152}
!152 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!153 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/StringBuilder.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !154, metadata !156, metadata !158, metadata !160} ; [ DW_TAG_compile_unit ]
!154 = metadata !{metadata !155}
!155 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!156 = metadata !{metadata !157}
!157 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!158 = metadata !{metadata !159}
!159 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!160 = metadata !{metadata !161}
!161 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!162 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/StringTokenizer.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !163, metadata !165, metadata !167, metadata !169} ; [ DW_TAG_compile_unit ]
!163 = metadata !{metadata !164}
!164 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!165 = metadata !{metadata !166}
!166 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!167 = metadata !{metadata !168}
!168 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!169 = metadata !{metadata !170}
!170 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!171 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/UUID.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !172, metadata !174, metadata !176, metadata !178} ; [ DW_TAG_compile_unit ]
!172 = metadata !{metadata !173}
!173 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!174 = metadata !{metadata !175}
!175 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!176 = metadata !{metadata !177}
!177 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!178 = metadata !{metadata !179}
!179 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!180 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/Collections.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !181, metadata !183, metadata !185, metadata !187} ; [ DW_TAG_compile_unit ]
!181 = metadata !{metadata !182}
!182 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!183 = metadata !{metadata !184}
!184 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!185 = metadata !{metadata !186}
!186 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!187 = metadata !{metadata !188}
!188 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!189 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/Time.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !190, metadata !192, metadata !194, metadata !196} ; [ DW_TAG_compile_unit ]
!190 = metadata !{metadata !191}
!191 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!192 = metadata !{metadata !193}
!193 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!194 = metadata !{metadata !195}
!195 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!196 = metadata !{metadata !197}
!197 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!198 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util/Locale.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !199, metadata !201, metadata !203, metadata !205} ; [ DW_TAG_compile_unit ]
!199 = metadata !{metadata !200}
!200 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!201 = metadata !{metadata !202}
!202 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!203 = metadata !{metadata !204}
!204 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!205 = metadata !{metadata !206}
!206 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!207 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/gc/gc.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/gc", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !208, metadata !210, metadata !212, metadata !214} ; [ DW_TAG_compile_unit ]
!208 = metadata !{metadata !209}
!209 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!210 = metadata !{metadata !211}
!211 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!212 = metadata !{metadata !213}
!213 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!214 = metadata !{metadata !215}
!215 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!216 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/unmanaged/UnmanagedApi.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/unmanaged", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !217, metadata !219, metadata !221, metadata !223} ; [ DW_TAG_compile_unit ]
!217 = metadata !{metadata !218}
!218 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!219 = metadata !{metadata !220}
!220 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!221 = metadata !{metadata !222}
!222 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!223 = metadata !{metadata !224}
!224 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!225 = metadata !{i32 786449, i32 0, i32 4, metadata !"/nfs/home/arton/test/mud/src/server.t", metadata !"/nfs/home/arton/test/mud/src", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !226, metadata !228, metadata !230, metadata !232} ; [ DW_TAG_compile_unit ]
!226 = metadata !{metadata !227}
!227 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!228 = metadata !{metadata !229}
!229 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!230 = metadata !{metadata !231}
!231 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!232 = metadata !{metadata !233}
!233 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!234 = metadata !{i32 786449, i32 0, i32 4, metadata !"/nfs/home/arton/test/mud/src/Input.t", metadata !"/nfs/home/arton/test/mud/src", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !235, metadata !237, metadata !239, metadata !241} ; [ DW_TAG_compile_unit ]
!235 = metadata !{metadata !236}
!236 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!237 = metadata !{metadata !238}
!238 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!239 = metadata !{metadata !240}
!240 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!241 = metadata !{metadata !242}
!242 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!243 = metadata !{i32 786449, i32 0, i32 4, metadata !"/nfs/home/arton/test/mud/src/client.t", metadata !"/nfs/home/arton/test/mud/src", metadata !"1.0 ThorScript Compiler (Zillians Inc)", i1 true, i1 false, metadata !"", i32 0, metadata !244, metadata !261, metadata !263, metadata !389} ; [ DW_TAG_compile_unit ]
!244 = metadata !{metadata !245}
!245 = metadata !{metadata !246, metadata !254}
!246 = metadata !{i32 786436, metadata !247, metadata !"DomainType", metadata !249, i32 22, i64 64, i64 64, i32 0, i32 0, null, metadata !250, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!247 = metadata !{i32 786489, metadata !248, metadata !"lang", null, i32 0} ; [ DW_TAG_namespace ]
!248 = metadata !{i32 786489, null, metadata !"thor", null, i32 0} ; [ DW_TAG_namespace ]
!249 = metadata !{i32 786473, metadata !"Domain.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", null} ; [ DW_TAG_file_type ]
!250 = metadata !{metadata !251, metadata !252, metadata !253}
!251 = metadata !{i32 786472, metadata !"SingleThreaded", i64 0} ; [ DW_TAG_enumerator ]
!252 = metadata !{i32 786472, metadata !"MultiThreaded", i64 1} ; [ DW_TAG_enumerator ]
!253 = metadata !{i32 786472, metadata !"Accelerator", i64 2} ; [ DW_TAG_enumerator ]
!254 = metadata !{i32 786436, metadata !247, metadata !"DomainEvent", metadata !249, i32 29, i64 64, i64 64, i32 0, i32 0, null, metadata !255, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!255 = metadata !{metadata !256, metadata !257, metadata !258, metadata !259, metadata !260}
!256 = metadata !{i32 786472, metadata !"Connected", i64 0} ; [ DW_TAG_enumerator ]
!257 = metadata !{i32 786472, metadata !"Disconnected", i64 1} ; [ DW_TAG_enumerator ]
!258 = metadata !{i32 786472, metadata !"Unreachable", i64 2} ; [ DW_TAG_enumerator ]
!259 = metadata !{i32 786472, metadata !"Resumed", i64 3} ; [ DW_TAG_enumerator ]
!260 = metadata !{i32 786472, metadata !"Crashed", i64 4} ; [ DW_TAG_enumerator ]
!261 = metadata !{metadata !262}
!262 = metadata !{i32 0}
!263 = metadata !{metadata !264}
!264 = metadata !{metadata !265, metadata !286, metadata !289, metadata !292, metadata !295, metadata !298, metadata !301, metadata !311, metadata !315, metadata !319, metadata !323, metadata !327, metadata !331, metadata !337, metadata !340, metadata !356, metadata !359, metadata !362, metadata !367, metadata !370, metadata !373, metadata !377, metadata !380, metadata !383, metadata !386}
!265 = metadata !{i32 786478, i32 0, metadata !266, metadata !"buildString<Value:int8>", metadata !"buildString<Value:int8>", metadata !"_ZN4thor4util7Convert11buildStringIaEEPNS_4lang6StringET_", metadata !268, i32 54, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %_ZN4thor4lang6StringE* (i8)* @_ZN4thor4util7Convert11buildStringIaEEPNS_4lang6StringET_, null, null, metadata !284, i32 54} ; [ DW_TAG_subprogram ]
!266 = metadata !{i32 786434, metadata !267, metadata !"Convert", metadata !268, i32 21, i64 128, i64 64, i32 0, i32 512, null, metadata !269, i32 0, null, null} ; [ DW_TAG_class_type ]
!267 = metadata !{i32 786489, metadata !248, metadata !"util", null, i32 0} ; [ DW_TAG_namespace ]
!268 = metadata !{i32 786473, metadata !"Convert.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", null} ; [ DW_TAG_file_type ]
!269 = metadata !{metadata !270}
!270 = metadata !{i32 786445, metadata !267, metadata !"_thor_lang_object_internal", metadata !268, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!271 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !272} ; [ DW_TAG_pointer_type ]
!272 = metadata !{i32 786434, metadata !247, metadata !"Object", metadata !273, i32 48, i64 128, i64 64, i32 0, i32 512, null, metadata !274, i32 0, null, null} ; [ DW_TAG_class_type ]
!273 = metadata !{i32 786473, metadata !"Language.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", null} ; [ DW_TAG_file_type ]
!274 = metadata !{metadata !275}
!275 = metadata !{i32 786445, metadata !247, metadata !"_thor_lang_object_internal", metadata !273, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!276 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !277, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!277 = metadata !{metadata !278}
!278 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !279} ; [ DW_TAG_pointer_type ]
!279 = metadata !{i32 786434, metadata !247, metadata !"String", metadata !280, i32 20, i64 192, i64 64, i32 0, i32 512, null, metadata !281, i32 0, null, null} ; [ DW_TAG_class_type ]
!280 = metadata !{i32 786473, metadata !"String.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/lang", null} ; [ DW_TAG_file_type ]
!281 = metadata !{metadata !282, metadata !283}
!282 = metadata !{i32 786445, metadata !247, metadata !"string_internal", metadata !280, i32 0, i64 64, i64 8, i64 128, i32 0, metadata !271} ; [ DW_TAG_member ]
!283 = metadata !{i32 786445, metadata !247, metadata !"_thor_lang_object_internal", metadata !280, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!284 = metadata !{metadata !285}
!285 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!286 = metadata !{i32 786478, i32 0, metadata !266, metadata !"buildString<Value:int16>", metadata !"buildString<Value:int16>", metadata !"_ZN4thor4util7Convert11buildStringIsEEPNS_4lang6StringET_", metadata !268, i32 54, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %_ZN4thor4lang6StringE* (i16)* @_ZN4thor4util7Convert11buildStringIsEEPNS_4lang6StringET_, null, null, metadata !287, i32 54} ; [ DW_TAG_subprogram ]
!287 = metadata !{metadata !288}
!288 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!289 = metadata !{i32 786478, i32 0, metadata !266, metadata !"buildString<Value:int32>", metadata !"buildString<Value:int32>", metadata !"_ZN4thor4util7Convert11buildStringIiEEPNS_4lang6StringET_", metadata !268, i32 54, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %_ZN4thor4lang6StringE* (i32)* @_ZN4thor4util7Convert11buildStringIiEEPNS_4lang6StringET_, null, null, metadata !290, i32 54} ; [ DW_TAG_subprogram ]
!290 = metadata !{metadata !291}
!291 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!292 = metadata !{i32 786478, i32 0, metadata !266, metadata !"buildString<Value:int64>", metadata !"buildString<Value:int64>", metadata !"_ZN4thor4util7Convert11buildStringIlEEPNS_4lang6StringET_", metadata !268, i32 54, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %_ZN4thor4lang6StringE* (i64)* @_ZN4thor4util7Convert11buildStringIlEEPNS_4lang6StringET_, null, null, metadata !293, i32 54} ; [ DW_TAG_subprogram ]
!293 = metadata !{metadata !294}
!294 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!295 = metadata !{i32 786478, i32 0, metadata !266, metadata !"buildString<Value:float32>", metadata !"buildString<Value:float32>", metadata !"_ZN4thor4util7Convert11buildStringIfEEPNS_4lang6StringET_", metadata !268, i32 54, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %_ZN4thor4lang6StringE* (float)* @_ZN4thor4util7Convert11buildStringIfEEPNS_4lang6StringET_, null, null, metadata !296, i32 54} ; [ DW_TAG_subprogram ]
!296 = metadata !{metadata !297}
!297 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!298 = metadata !{i32 786478, i32 0, metadata !266, metadata !"buildString<Value:float64>", metadata !"buildString<Value:float64>", metadata !"_ZN4thor4util7Convert11buildStringIdEEPNS_4lang6StringET_", metadata !268, i32 54, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %_ZN4thor4lang6StringE* (double)* @_ZN4thor4util7Convert11buildStringIdEEPNS_4lang6StringET_, null, null, metadata !299, i32 54} ; [ DW_TAG_subprogram ]
!299 = metadata !{metadata !300}
!300 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!301 = metadata !{i32 786478, i32 0, metadata !302, metadata !"new", metadata !"new", metadata !"_ZN4thor9unmanaged4ptr_IaEC1Ev", metadata !304, i32 21, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_ZN4thor9unmanaged4ptr_IaEE*)* @_ZN4thor9unmanaged4ptr_IaEC1Ev, null, null, metadata !309, i32 21} ; [ DW_TAG_subprogram ]
!302 = metadata !{i32 786434, metadata !303, metadata !"ptr_<T:int8>", metadata !304, i32 21, i64 128, i64 64, i32 0, i32 512, null, metadata !305, i32 0, null, null} ; [ DW_TAG_class_type ]
!303 = metadata !{i32 786489, metadata !248, metadata !"unmanaged", null, i32 0} ; [ DW_TAG_namespace ]
!304 = metadata !{i32 786473, metadata !"UnmanagedApi.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/unmanaged", null} ; [ DW_TAG_file_type ]
!305 = metadata !{metadata !306}
!306 = metadata !{i32 786445, metadata !303, metadata !"_thor_lang_object_internal", metadata !304, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!307 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !308, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!308 = metadata !{null}
!309 = metadata !{metadata !310}
!310 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!311 = metadata !{i32 786478, i32 0, metadata !312, metadata !"new", metadata !"new", metadata !"_ZN4thor9unmanaged4ptr_IlEC1Ev", metadata !304, i32 21, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_ZN4thor9unmanaged4ptr_IlEE*)* @_ZN4thor9unmanaged4ptr_IlEC1Ev, null, null, metadata !313, i32 21} ; [ DW_TAG_subprogram ]
!312 = metadata !{i32 786434, metadata !303, metadata !"ptr_<T:int64>", metadata !304, i32 21, i64 128, i64 64, i32 0, i32 512, null, metadata !305, i32 0, null, null} ; [ DW_TAG_class_type ]
!313 = metadata !{metadata !314}
!314 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!315 = metadata !{i32 786478, i32 0, metadata !316, metadata !"new", metadata !"new", metadata !"_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEC1Ev", metadata !304, i32 21, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEE*)* @_ZN4thor9unmanaged4ptr_INS_4lang6ObjectEEC1Ev, null, null, metadata !317, i32 21} ; [ DW_TAG_subprogram ]
!316 = metadata !{i32 786434, metadata !303, metadata !"ptr_<T:Object>", metadata !304, i32 21, i64 128, i64 64, i32 0, i32 512, null, metadata !305, i32 0, null, null} ; [ DW_TAG_class_type ]
!317 = metadata !{metadata !318}
!318 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!319 = metadata !{i32 786478, i32 0, metadata !320, metadata !"new", metadata !"new", metadata !"_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEC1Ev", metadata !304, i32 21, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEE*)* @_ZN4thor9unmanaged4ptr_INS_4lang7Lambda1IvNS2_6DomainEEEEC1Ev, null, null, metadata !321, i32 21} ; [ DW_TAG_subprogram ]
!320 = metadata !{i32 786434, metadata !303, metadata !"ptr_<T:Lambda1<R:void,T0:Domain>>", metadata !304, i32 21, i64 128, i64 64, i32 0, i32 512, null, metadata !305, i32 0, null, null} ; [ DW_TAG_class_type ]
!321 = metadata !{metadata !322}
!322 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!323 = metadata !{i32 786478, i32 0, metadata !324, metadata !"new", metadata !"new", metadata !"_ZN4thor9unmanaged4ptr_IiEC1Ev", metadata !304, i32 21, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_ZN4thor9unmanaged4ptr_IiEE*)* @_ZN4thor9unmanaged4ptr_IiEC1Ev, null, null, metadata !325, i32 21} ; [ DW_TAG_subprogram ]
!324 = metadata !{i32 786434, metadata !303, metadata !"ptr_<T:int32>", metadata !304, i32 21, i64 128, i64 64, i32 0, i32 512, null, metadata !305, i32 0, null, null} ; [ DW_TAG_class_type ]
!325 = metadata !{metadata !326}
!326 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!327 = metadata !{i32 786478, i32 0, metadata !328, metadata !"handle_user_coming", metadata !"handle_user_coming", metadata !"_Z18handle_user_comingPN4thor4lang6DomainE", metadata !328, i32 6, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_ZN4thor4lang6DomainE*)* @_Z18handle_user_comingPN4thor4lang6DomainE, null, null, metadata !329, i32 6} ; [ DW_TAG_subprogram ]
!328 = metadata !{i32 786473, metadata !"server.t", metadata !"/nfs/home/arton/test/mud/src", null} ; [ DW_TAG_file_type ]
!329 = metadata !{metadata !330}
!330 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!331 = metadata !{i32 786478, i32 0, metadata !328, metadata !"server_main", metadata !"server_main", metadata !"_Z11server_mainv", metadata !328, i32 13, metadata !332, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @_Z11server_mainv, null, null, metadata !335, i32 13} ; [ DW_TAG_subprogram ]
!332 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !333, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!333 = metadata !{metadata !334}
!334 = metadata !{i32 786468, null, metadata !"int32", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!335 = metadata !{metadata !336}
!336 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!337 = metadata !{i32 786478, i32 0, metadata !328, metadata !"broadcast", metadata !"broadcast", metadata !"_Z9broadcastv", metadata !328, i32 24, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_Z9broadcastv, null, null, metadata !338, i32 24} ; [ DW_TAG_subprogram ]
!338 = metadata !{metadata !339}
!339 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!340 = metadata !{i32 786478, i32 0, metadata !341, metadata !"new", metadata !"new", metadata !"_ZN11ServerStateC1Ev", metadata !328, i32 41, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_Z11ServerState*)* @_ZN11ServerStateC1Ev, null, null, metadata !354, i32 41} ; [ DW_TAG_subprogram ]
!341 = metadata !{i32 786434, metadata !328, metadata !"ServerState", metadata !328, i32 36, i64 256, i64 64, i32 0, i32 512, null, metadata !342, i32 0, null, null} ; [ DW_TAG_class_type ]
!342 = metadata !{metadata !343, metadata !352, metadata !353}
!343 = metadata !{i32 786445, metadata !328, metadata !"id_domain_table", metadata !328, i32 0, i64 64, i64 8, i64 128, i32 0, metadata !344} ; [ DW_TAG_member ]
!344 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !345} ; [ DW_TAG_pointer_type ]
!345 = metadata !{i32 786434, metadata !346, metadata !"Map<Key:int32,Value:Domain>", metadata !347, i32 83, i64 256, i64 64, i32 0, i32 512, null, metadata !348, i32 0, null, null} ; [ DW_TAG_class_type ]
!346 = metadata !{i32 786489, metadata !248, metadata !"container", null, i32 0} ; [ DW_TAG_namespace ]
!347 = metadata !{i32 786473, metadata !"Map.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/container", null} ; [ DW_TAG_file_type ]
!348 = metadata !{metadata !349, metadata !351}
!349 = metadata !{i32 786445, metadata !346, metadata !"_p", metadata !347, i32 0, i64 64, i64 8, i64 192, i32 0, metadata !350} ; [ DW_TAG_member ]
!350 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !324} ; [ DW_TAG_pointer_type ]
!351 = metadata !{i32 786445, metadata !346, metadata !"_thor_lang_object_internal", metadata !347, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!352 = metadata !{i32 786445, metadata !328, metadata !"max_client_id", metadata !328, i32 0, i64 32, i64 32, i64 192, i32 0, metadata !334} ; [ DW_TAG_member ]
!353 = metadata !{i32 786445, metadata !328, metadata !"_thor_lang_object_internal", metadata !328, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!354 = metadata !{metadata !355}
!355 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!356 = metadata !{i32 786478, i32 0, metadata !341, metadata !"addClient", metadata !"addClient", metadata !"_ZN11ServerState9addClientEPN4thor4lang6DomainE", metadata !328, i32 47, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_Z11ServerState*, %_ZN4thor4lang6DomainE*)* @_ZN11ServerState9addClientEPN4thor4lang6DomainE, null, null, metadata !357, i32 47} ; [ DW_TAG_subprogram ]
!357 = metadata !{metadata !358}
!358 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!359 = metadata !{i32 786478, i32 0, metadata !341, metadata !"get_max_client_id", metadata !"get_max_client_id", metadata !"_ZN11ServerState17get_max_client_idEv", metadata !328, i32 55, metadata !332, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%_Z11ServerState*)* @_ZN11ServerState17get_max_client_idEv, null, null, metadata !360, i32 55} ; [ DW_TAG_subprogram ]
!360 = metadata !{metadata !361}
!361 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!362 = metadata !{i32 786478, i32 0, metadata !363, metadata !"new", metadata !"new", metadata !"_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10C1Ev", metadata !328, i32 15, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*)* @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10C1Ev, null, null, metadata !365, i32 15} ; [ DW_TAG_subprogram ]
!363 = metadata !{i32 786434, metadata !328, metadata !"lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10", metadata !328, i32 15, i64 128, i64 64, i32 0, i32 512, null, metadata !364, i32 0, null, null} ; [ DW_TAG_class_type ]
!364 = metadata !{metadata !353}
!365 = metadata !{metadata !366}
!366 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!367 = metadata !{i32 786478, i32 0, metadata !363, metadata !"set_captured", metadata !"set_captured", metadata !"_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e1012set_capturedEv", metadata !328, i32 15, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*)* @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e1012set_capturedEv, null, null, metadata !368, i32 15} ; [ DW_TAG_subprogram ]
!368 = metadata !{metadata !369}
!369 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!370 = metadata !{i32 786478, i32 0, metadata !363, metadata !"invoke", metadata !"invoke", metadata !"_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e106invokeEPN4thor4lang6DomainE", metadata !328, i32 15, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%_Z43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e10*, %_ZN4thor4lang6DomainE*)* @_ZN43lambda_dda0e9fe_d134_4f72_baff_93678f4c4e106invokeEPN4thor4lang6DomainE, null, null, metadata !371, i32 15} ; [ DW_TAG_subprogram ]
!371 = metadata !{metadata !372}
!372 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!373 = metadata !{i32 786478, i32 0, metadata !374, metadata !"client_main", metadata !"client_main", metadata !"_Z11client_mainv", metadata !374, i32 5, metadata !332, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @_Z11client_mainv, null, null, metadata !375, i32 5} ; [ DW_TAG_subprogram ]
!374 = metadata !{i32 786473, metadata !"client.t", metadata !"/nfs/home/arton/test/mud/src", null} ; [ DW_TAG_file_type ]
!375 = metadata !{metadata !376}
!376 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!377 = metadata !{i32 786478, i32 0, metadata !374, metadata !"one_time_input", metadata !"one_time_input", metadata !"_Z14one_time_inputv", metadata !374, i32 12, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_Z14one_time_inputv, null, null, metadata !378, i32 12} ; [ DW_TAG_subprogram ]
!378 = metadata !{metadata !379}
!379 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!380 = metadata !{i32 786478, i32 0, metadata !374, metadata !"client_real_main", metadata !"client_real_main", metadata !"_Z16client_real_mainv", metadata !374, i32 21, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_Z16client_real_mainv, null, null, metadata !381, i32 21} ; [ DW_TAG_subprogram ]
!381 = metadata !{metadata !382}
!382 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!383 = metadata !{i32 786478, i32 0, metadata !374, metadata !"make_server_broadcast", metadata !"make_server_broadcast", metadata !"_Z21make_server_broadcastv", metadata !374, i32 29, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_Z21make_server_broadcastv, null, null, metadata !384, i32 29} ; [ DW_TAG_subprogram ]
!384 = metadata !{metadata !385}
!385 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!386 = metadata !{i32 786478, i32 0, metadata !374, metadata !"print_broadcast_msg", metadata !"print_broadcast_msg", metadata !"_Z19print_broadcast_msgv", metadata !374, i32 37, metadata !307, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @_Z19print_broadcast_msgv, null, null, metadata !387, i32 37} ; [ DW_TAG_subprogram ]
!387 = metadata !{metadata !388}
!388 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!389 = metadata !{metadata !390}
!390 = metadata !{metadata !391, metadata !393}
!391 = metadata !{i32 786484, i32 0, metadata !328, metadata !"server_state", metadata !"server_state", metadata !"server_state", metadata !328, i32 3, metadata !392, i32 1, i32 1, %_Z11ServerState** @server_state} ; [ DW_TAG_variable ]
!392 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !341} ; [ DW_TAG_pointer_type ]
!393 = metadata !{i32 786484, i32 0, metadata !374, metadata !"server", metadata !"server", metadata !"server", metadata !374, i32 1, metadata !394, i32 1, i32 1, %_ZN4thor4lang6DomainE** @server} ; [ DW_TAG_variable ]
!394 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !395} ; [ DW_TAG_pointer_type ]
!395 = metadata !{i32 786434, metadata !247, metadata !"Domain", metadata !249, i32 40, i64 256, i64 64, i32 0, i32 512, null, metadata !396, i32 0, null, null} ; [ DW_TAG_class_type ]
!396 = metadata !{metadata !397, metadata !399, metadata !400}
!397 = metadata !{i32 786445, metadata !247, metadata !"session_id", metadata !249, i32 0, i64 64, i64 64, i64 128, i32 0, metadata !398} ; [ DW_TAG_member ]
!398 = metadata !{i32 786468, null, metadata !"int64", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!399 = metadata !{i32 786445, metadata !247, metadata !"context", metadata !249, i32 0, i64 64, i64 8, i64 192, i32 0, metadata !271} ; [ DW_TAG_member ]
!400 = metadata !{i32 786445, metadata !247, metadata !"_thor_lang_object_internal", metadata !249, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!401 = metadata !{i32 56, i32 12, metadata !402, null}
!402 = metadata !{i32 786443, metadata !265, i32 59, i32 5, metadata !268, i32 0} ; [ DW_TAG_lexical_block ]
!403 = metadata !{i32 56, i32 38, metadata !402, null}
!404 = metadata !{i32 786689, metadata !265, metadata !"value", metadata !268, i32 16777270, metadata !405, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!405 = metadata !{i32 786468, null, metadata !"int8", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!406 = metadata !{i32 54, i32 49, metadata !265, null}
!407 = metadata !{i32 786688, metadata !402, metadata !"builder", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!408 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !409} ; [ DW_TAG_pointer_type ]
!409 = metadata !{i32 786434, metadata !267, metadata !"StringBuilder", metadata !410, i32 24, i64 192, i64 64, i32 0, i32 512, null, metadata !411, i32 0, null, null} ; [ DW_TAG_class_type ]
!410 = metadata !{i32 786473, metadata !"StringBuilder.t", metadata !"/home/arton/zillians/build/projects/language/bundle/system/create_bundle_temporary_dir/system/src/thor/util", null} ; [ DW_TAG_file_type ]
!411 = metadata !{metadata !412, metadata !414}
!412 = metadata !{i32 786445, metadata !267, metadata !"stream", metadata !410, i32 0, i64 64, i64 8, i64 128, i32 0, metadata !413} ; [ DW_TAG_member ]
!413 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !312} ; [ DW_TAG_pointer_type ]
!414 = metadata !{i32 786445, metadata !267, metadata !"_thor_lang_object_internal", metadata !410, i32 0, i64 64, i64 8, i64 64, i32 0, metadata !271} ; [ DW_TAG_member ]
!415 = metadata !{i32 786688, metadata !402, metadata !"new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!416 = metadata !{i32 59, i32 5, metadata !265, null}
!417 = metadata !{i32 57, i32 8, metadata !402, null}
!418 = metadata !{i32 58, i32 15, metadata !402, null}
!419 = metadata !{i32 58, i32 8, metadata !402, null}
!420 = metadata !{i32 56, i32 12, metadata !421, null}
!421 = metadata !{i32 786443, metadata !286, i32 59, i32 5, metadata !268, i32 1} ; [ DW_TAG_lexical_block ]
!422 = metadata !{i32 56, i32 38, metadata !421, null}
!423 = metadata !{i32 786689, metadata !286, metadata !"value", metadata !268, i32 16777270, metadata !424, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!424 = metadata !{i32 786468, null, metadata !"int16", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!425 = metadata !{i32 54, i32 49, metadata !286, null}
!426 = metadata !{i32 786688, metadata !421, metadata !"builder", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!427 = metadata !{i32 786688, metadata !421, metadata !"new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!428 = metadata !{i32 59, i32 5, metadata !286, null}
!429 = metadata !{i32 57, i32 8, metadata !421, null}
!430 = metadata !{i32 58, i32 15, metadata !421, null}
!431 = metadata !{i32 58, i32 8, metadata !421, null}
!432 = metadata !{i32 56, i32 12, metadata !433, null}
!433 = metadata !{i32 786443, metadata !289, i32 59, i32 5, metadata !268, i32 2} ; [ DW_TAG_lexical_block ]
!434 = metadata !{i32 56, i32 38, metadata !433, null}
!435 = metadata !{i32 786689, metadata !289, metadata !"value", metadata !268, i32 16777270, metadata !334, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!436 = metadata !{i32 54, i32 49, metadata !289, null}
!437 = metadata !{i32 786688, metadata !433, metadata !"builder", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!438 = metadata !{i32 786688, metadata !433, metadata !"new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!439 = metadata !{i32 59, i32 5, metadata !289, null}
!440 = metadata !{i32 57, i32 8, metadata !433, null}
!441 = metadata !{i32 58, i32 15, metadata !433, null}
!442 = metadata !{i32 58, i32 8, metadata !433, null}
!443 = metadata !{i32 56, i32 12, metadata !444, null}
!444 = metadata !{i32 786443, metadata !292, i32 59, i32 5, metadata !268, i32 3} ; [ DW_TAG_lexical_block ]
!445 = metadata !{i32 56, i32 38, metadata !444, null}
!446 = metadata !{i32 786689, metadata !292, metadata !"value", metadata !268, i32 16777270, metadata !398, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!447 = metadata !{i32 54, i32 49, metadata !292, null}
!448 = metadata !{i32 786688, metadata !444, metadata !"builder", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!449 = metadata !{i32 786688, metadata !444, metadata !"new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!450 = metadata !{i32 59, i32 5, metadata !292, null}
!451 = metadata !{i32 57, i32 8, metadata !444, null}
!452 = metadata !{i32 58, i32 15, metadata !444, null}
!453 = metadata !{i32 58, i32 8, metadata !444, null}
!454 = metadata !{i32 56, i32 12, metadata !455, null}
!455 = metadata !{i32 786443, metadata !295, i32 59, i32 5, metadata !268, i32 4} ; [ DW_TAG_lexical_block ]
!456 = metadata !{i32 56, i32 38, metadata !455, null}
!457 = metadata !{i32 786689, metadata !295, metadata !"value", metadata !268, i32 16777270, metadata !458, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!458 = metadata !{i32 786468, null, metadata !"float32", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!459 = metadata !{i32 54, i32 49, metadata !295, null}
!460 = metadata !{i32 786688, metadata !455, metadata !"builder", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!461 = metadata !{i32 786688, metadata !455, metadata !"new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!462 = metadata !{i32 59, i32 5, metadata !295, null}
!463 = metadata !{i32 57, i32 8, metadata !455, null}
!464 = metadata !{i32 58, i32 15, metadata !455, null}
!465 = metadata !{i32 58, i32 8, metadata !455, null}
!466 = metadata !{i32 56, i32 12, metadata !467, null}
!467 = metadata !{i32 786443, metadata !298, i32 59, i32 5, metadata !268, i32 5} ; [ DW_TAG_lexical_block ]
!468 = metadata !{i32 56, i32 38, metadata !467, null}
!469 = metadata !{i32 786689, metadata !298, metadata !"value", metadata !268, i32 16777270, metadata !470, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!470 = metadata !{i32 786468, null, metadata !"float64", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!471 = metadata !{i32 54, i32 49, metadata !298, null}
!472 = metadata !{i32 786688, metadata !467, metadata !"builder", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!473 = metadata !{i32 786688, metadata !467, metadata !"new_temp_0d9d449c_6892_4382_8274_f08b7ac8082d", metadata !268, i32 56, metadata !408, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!474 = metadata !{i32 59, i32 5, metadata !298, null}
!475 = metadata !{i32 57, i32 8, metadata !467, null}
!476 = metadata !{i32 58, i32 15, metadata !467, null}
!477 = metadata !{i32 58, i32 8, metadata !467, null}
!478 = metadata !{i32 786689, metadata !301, metadata !"this", metadata !304, i32 16777237, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!479 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !302} ; [ DW_TAG_pointer_type ]
!480 = metadata !{i32 21, i32 1, metadata !301, null}
!481 = metadata !{i32 786689, metadata !311, metadata !"this", metadata !304, i32 16777237, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!482 = metadata !{i32 21, i32 1, metadata !311, null}
!483 = metadata !{i32 786689, metadata !315, metadata !"this", metadata !304, i32 16777237, metadata !484, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!484 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !316} ; [ DW_TAG_pointer_type ]
!485 = metadata !{i32 21, i32 1, metadata !315, null}
!486 = metadata !{i32 786689, metadata !319, metadata !"this", metadata !304, i32 16777237, metadata !487, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!487 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !320} ; [ DW_TAG_pointer_type ]
!488 = metadata !{i32 21, i32 1, metadata !319, null}
!489 = metadata !{i32 786689, metadata !323, metadata !"this", metadata !304, i32 16777237, metadata !350, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!490 = metadata !{i32 21, i32 1, metadata !323, null}
!491 = metadata !{i32 8, i32 5, metadata !492, null}
!492 = metadata !{i32 786443, metadata !327, i32 9, i32 1, metadata !328, i32 11} ; [ DW_TAG_lexical_block ]
!493 = metadata !{i32 786689, metadata !327, metadata !"a_client", metadata !328, i32 16777222, metadata !394, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!494 = metadata !{i32 6, i32 30, metadata !327, null}
!495 = metadata !{i32 9, i32 1, metadata !327, null}
!496 = metadata !{i32 21, i32 1, metadata !331, null}
!497 = metadata !{i32 15, i32 5, metadata !498, null}
!498 = metadata !{i32 786443, metadata !331, i32 21, i32 1, metadata !328, i32 12} ; [ DW_TAG_lexical_block ]
!499 = metadata !{i32 19, i32 5, metadata !498, null}
!500 = metadata !{i32 20, i32 5, metadata !498, null}
!501 = metadata !{i32 27, i32 65, metadata !502, null}
!502 = metadata !{i32 786443, metadata !503, i32 27, i32 63, metadata !328, i32 17} ; [ DW_TAG_lexical_block ]
!503 = metadata !{i32 786443, metadata !337, i32 34, i32 1, metadata !328, i32 13} ; [ DW_TAG_lexical_block ]
!504 = metadata !{i32 30, i32 13, metadata !505, null}
!505 = metadata !{i32 786443, metadata !503, i32 33, i32 5, metadata !328, i32 16} ; [ DW_TAG_lexical_block ]
!506 = metadata !{i32 26, i32 5, metadata !503, null}
!507 = metadata !{i32 27, i32 15, metadata !503, null}
!508 = metadata !{i32 786688, metadata !503, metadata !"i", metadata !328, i32 27, metadata !334, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!509 = metadata !{i32 786688, metadata !505, metadata !"client", metadata !328, i32 30, metadata !394, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!510 = metadata !{i32 34, i32 1, metadata !337, null}
!511 = metadata !{i32 27, i32 5, metadata !503, null}
!512 = metadata !{i32 27, i32 30, metadata !513, null}
!513 = metadata !{i32 786443, metadata !503, i32 27, i32 30, metadata !328, i32 15} ; [ DW_TAG_lexical_block ]
!514 = metadata !{i32 27, i32 30, metadata !503, null}
!515 = metadata !{i32 27, i32 63, metadata !502, null}
!516 = metadata !{i32 27, i32 63, metadata !503, null}
!517 = metadata !{i32 33, i32 5, metadata !503, null}
!518 = metadata !{i32 29, i32 9, metadata !505, null}
!519 = metadata !{i32 30, i32 31, metadata !505, null}
!520 = metadata !{i32 32, i32 13, metadata !505, null}
!521 = metadata !{i32 43, i32 9, metadata !522, null}
!522 = metadata !{i32 786443, metadata !340, i32 45, i32 5, metadata !328, i32 18} ; [ DW_TAG_lexical_block ]
!523 = metadata !{i32 41, i32 5, metadata !522, null}
!524 = metadata !{i32 786689, metadata !340, metadata !"this", metadata !328, i32 16777257, metadata !392, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!525 = metadata !{i32 41, i32 5, metadata !340, null}
!526 = metadata !{i32 786688, metadata !522, metadata !"new_temp_9e3de7fa_f256_406b_8e13_eeb6e1e26c55", metadata !328, i32 43, metadata !344, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!527 = metadata !{i32 45, i32 5, metadata !340, null}
!528 = metadata !{i32 44, i32 9, metadata !522, null}
!529 = metadata !{i32 50, i32 11, metadata !530, null}
!530 = metadata !{i32 786443, metadata !356, i32 53, i32 5, metadata !328, i32 19} ; [ DW_TAG_lexical_block ]
!531 = metadata !{i32 50, i32 9, metadata !530, null}
!532 = metadata !{i32 51, i32 9, metadata !530, null}
!533 = metadata !{i32 786689, metadata !356, metadata !"this", metadata !328, i32 16777263, metadata !392, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!534 = metadata !{i32 47, i32 5, metadata !356, null}
!535 = metadata !{i32 786689, metadata !356, metadata !"a_client", metadata !328, i32 33554479, metadata !394, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!536 = metadata !{i32 47, i32 32, metadata !356, null}
!537 = metadata !{i32 53, i32 5, metadata !356, null}
!538 = metadata !{i32 52, i32 9, metadata !530, null}
!539 = metadata !{i32 57, i32 16, metadata !540, null}
!540 = metadata !{i32 786443, metadata !359, i32 58, i32 5, metadata !328, i32 20} ; [ DW_TAG_lexical_block ]
!541 = metadata !{i32 57, i32 9, metadata !540, null}
!542 = metadata !{i32 786689, metadata !359, metadata !"this", metadata !328, i32 16777271, metadata !392, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!543 = metadata !{i32 55, i32 5, metadata !359, null}
!544 = metadata !{i32 58, i32 5, metadata !359, null}
!545 = metadata !{i32 786689, metadata !362, metadata !"this", metadata !328, i32 16777231, metadata !546, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!546 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !363} ; [ DW_TAG_pointer_type ]
!547 = metadata !{i32 15, i32 21, metadata !362, null}
!548 = metadata !{i32 786689, metadata !367, metadata !"this", metadata !328, i32 16777231, metadata !546, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!549 = metadata !{i32 15, i32 21, metadata !367, null}
!550 = metadata !{i32 16, i32 13, metadata !551, null}
!551 = metadata !{i32 786443, metadata !370, i32 18, i32 13, metadata !328, i32 23} ; [ DW_TAG_lexical_block ]
!552 = metadata !{i32 786689, metadata !370, metadata !"this", metadata !328, i32 16777231, metadata !546, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!553 = metadata !{i32 15, i32 21, metadata !370, null}
!554 = metadata !{i32 786689, metadata !370, metadata !"target", metadata !328, i32 33554447, metadata !394, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!555 = metadata !{i32 15, i32 28, metadata !370, null}
!556 = metadata !{i32 18, i32 13, metadata !370, null}
!557 = metadata !{i32 17, i32 41, metadata !551, null}
!558 = metadata !{i32 7, i32 5, metadata !559, null}
!559 = metadata !{i32 786443, metadata !373, i32 9, i32 1, metadata !374, i32 24} ; [ DW_TAG_lexical_block ]
!560 = metadata !{i32 8, i32 5, metadata !559, null}
!561 = metadata !{i32 9, i32 1, metadata !373, null}
!562 = metadata !{i32 15, i32 5, metadata !563, null}
!563 = metadata !{i32 786443, metadata !377, i32 18, i32 1, metadata !374, i32 25} ; [ DW_TAG_lexical_block ]
!564 = metadata !{i32 14, i32 9, metadata !563, null}
!565 = metadata !{i32 16, i32 5, metadata !563, null}
!566 = metadata !{i32 17, i32 5, metadata !563, null}
!567 = metadata !{i32 786688, metadata !563, metadata !"x", metadata !374, i32 14, metadata !278, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!568 = metadata !{i32 18, i32 1, metadata !377, null}
!569 = metadata !{i32 23, i32 5, metadata !570, null}
!570 = metadata !{i32 786443, metadata !380, i32 26, i32 1, metadata !374, i32 26} ; [ DW_TAG_lexical_block ]
!571 = metadata !{i32 24, i32 5, metadata !570, null}
!572 = metadata !{i32 26, i32 1, metadata !380, null}
!573 = metadata !{i32 25, i32 12, metadata !570, null}
!574 = metadata !{i32 31, i32 5, metadata !575, null}
!575 = metadata !{i32 786443, metadata !383, i32 34, i32 1, metadata !374, i32 27} ; [ DW_TAG_lexical_block ]
!576 = metadata !{i32 34, i32 1, metadata !383, null}
!577 = metadata !{i32 33, i32 9, metadata !575, null}
!578 = metadata !{i32 39, i32 5, metadata !579, null}
!579 = metadata !{i32 786443, metadata !386, i32 40, i32 1, metadata !374, i32 28} ; [ DW_TAG_lexical_block ]
!580 = metadata !{i32 40, i32 1, metadata !386, null}
