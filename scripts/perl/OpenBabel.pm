# This file was created automatically by SWIG 1.3.29.
# Don't modify this file, modify the SWIG interface instead.
package Chemistry::OpenBabel;
require Exporter;
require DynaLoader;
@ISA = qw(Exporter DynaLoader);
package Chemistry::OpenBabelc;
bootstrap Chemistry::OpenBabel;
package Chemistry::OpenBabel;
@EXPORT = qw( ); sub dl_load_flags { 0x01 }

# ---------- BASE METHODS -------------

package Chemistry::OpenBabel;

sub TIEHASH {
    my ($classname,$obj) = @_;
    return bless $obj, $classname;
}

sub CLEAR { }

sub FIRSTKEY { }

sub NEXTKEY { }

sub FETCH {
    my ($self,$field) = @_;
    my $member_func = "swig_${field}_get";
    $self->$member_func();
}

sub STORE {
    my ($self,$field,$newval) = @_;
    my $member_func = "swig_${field}_set";
    $self->$member_func($newval);
}

sub this {
    my $ptr = shift;
    return tied(%$ptr);
}


# ------- FUNCTION WRAPPERS --------

package Chemistry::OpenBabel;

*DoubleMultiply = *Chemistry::OpenBabelc::DoubleMultiply;
*DoubleAdd = *Chemistry::OpenBabelc::DoubleAdd;
*DoubleModulus = *Chemistry::OpenBabelc::DoubleModulus;
*calc_rms = *Chemistry::OpenBabelc::calc_rms;
*ToUpper = *Chemistry::OpenBabelc::ToUpper;
*ToLower = *Chemistry::OpenBabelc::ToLower;
*CleanAtomType = *Chemistry::OpenBabelc::CleanAtomType;
*OBCompareInt = *Chemistry::OpenBabelc::OBCompareInt;
*OBCompareUnsigned = *Chemistry::OpenBabelc::OBCompareUnsigned;
*IsNear = *Chemistry::OpenBabelc::IsNear;
*IsNearZero = *Chemistry::OpenBabelc::IsNearZero;
*Point2Plane = *Chemistry::OpenBabelc::Point2Plane;
*tokenize = *Chemistry::OpenBabelc::tokenize;
*ThrowError = *Chemistry::OpenBabelc::ThrowError;
*CartesianToInternal = *Chemistry::OpenBabelc::CartesianToInternal;
*InternalToCartesian = *Chemistry::OpenBabelc::InternalToCartesian;
*NewExtension = *Chemistry::OpenBabelc::NewExtension;
*get_rmat = *Chemistry::OpenBabelc::get_rmat;
*ob_make_rmat = *Chemistry::OpenBabelc::ob_make_rmat;
*qtrfit = *Chemistry::OpenBabelc::qtrfit;
*superimpose = *Chemistry::OpenBabelc::superimpose;
*CompareRingSize = *Chemistry::OpenBabelc::CompareRingSize;
*SmartsLexReplace = *Chemistry::OpenBabelc::SmartsLexReplace;

############# Class : Chemistry::OpenBabel::vectorInt ##############

package Chemistry::OpenBabel::vectorInt;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vectorInt(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vectorInt_size;
*empty = *Chemistry::OpenBabelc::vectorInt_empty;
*clear = *Chemistry::OpenBabelc::vectorInt_clear;
*push = *Chemistry::OpenBabelc::vectorInt_push;
*pop = *Chemistry::OpenBabelc::vectorInt_pop;
*get = *Chemistry::OpenBabelc::vectorInt_get;
*set = *Chemistry::OpenBabelc::vectorInt_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vectorInt($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vvInt ##############

package Chemistry::OpenBabel::vvInt;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vvInt(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vvInt_size;
*empty = *Chemistry::OpenBabelc::vvInt_empty;
*clear = *Chemistry::OpenBabelc::vvInt_clear;
*push = *Chemistry::OpenBabelc::vvInt_push;
*pop = *Chemistry::OpenBabelc::vvInt_pop;
*get = *Chemistry::OpenBabelc::vvInt_get;
*set = *Chemistry::OpenBabelc::vvInt_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vvInt($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vectorDouble ##############

package Chemistry::OpenBabel::vectorDouble;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vectorDouble(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vectorDouble_size;
*empty = *Chemistry::OpenBabelc::vectorDouble_empty;
*clear = *Chemistry::OpenBabelc::vectorDouble_clear;
*push = *Chemistry::OpenBabelc::vectorDouble_push;
*pop = *Chemistry::OpenBabelc::vectorDouble_pop;
*get = *Chemistry::OpenBabelc::vectorDouble_get;
*set = *Chemistry::OpenBabelc::vectorDouble_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vectorDouble($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vVector3 ##############

package Chemistry::OpenBabel::vVector3;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vVector3(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vVector3_size;
*empty = *Chemistry::OpenBabelc::vVector3_empty;
*clear = *Chemistry::OpenBabelc::vVector3_clear;
*push = *Chemistry::OpenBabelc::vVector3_push;
*pop = *Chemistry::OpenBabelc::vVector3_pop;
*get = *Chemistry::OpenBabelc::vVector3_get;
*set = *Chemistry::OpenBabelc::vVector3_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vVector3($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vectorMol ##############

package Chemistry::OpenBabel::vectorMol;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vectorMol(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vectorMol_size;
*empty = *Chemistry::OpenBabelc::vectorMol_empty;
*clear = *Chemistry::OpenBabelc::vectorMol_clear;
*push = *Chemistry::OpenBabelc::vectorMol_push;
*pop = *Chemistry::OpenBabelc::vectorMol_pop;
*get = *Chemistry::OpenBabelc::vectorMol_get;
*set = *Chemistry::OpenBabelc::vectorMol_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vectorMol($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vectorBond ##############

package Chemistry::OpenBabel::vectorBond;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vectorBond(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vectorBond_size;
*empty = *Chemistry::OpenBabelc::vectorBond_empty;
*clear = *Chemistry::OpenBabelc::vectorBond_clear;
*push = *Chemistry::OpenBabelc::vectorBond_push;
*pop = *Chemistry::OpenBabelc::vectorBond_pop;
*get = *Chemistry::OpenBabelc::vectorBond_get;
*set = *Chemistry::OpenBabelc::vectorBond_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vectorBond($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vectorResidue ##############

package Chemistry::OpenBabel::vectorResidue;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vectorResidue(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vectorResidue_size;
*empty = *Chemistry::OpenBabelc::vectorResidue_empty;
*clear = *Chemistry::OpenBabelc::vectorResidue_clear;
*push = *Chemistry::OpenBabelc::vectorResidue_push;
*pop = *Chemistry::OpenBabelc::vectorResidue_pop;
*get = *Chemistry::OpenBabelc::vectorResidue_get;
*set = *Chemistry::OpenBabelc::vectorResidue_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vectorResidue($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vectorRing ##############

package Chemistry::OpenBabel::vectorRing;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vectorRing(@_);
    bless $self, $pkg if defined($self);
}

*size = *Chemistry::OpenBabelc::vectorRing_size;
*empty = *Chemistry::OpenBabelc::vectorRing_empty;
*clear = *Chemistry::OpenBabelc::vectorRing_clear;
*push = *Chemistry::OpenBabelc::vectorRing_push;
*pop = *Chemistry::OpenBabelc::vectorRing_pop;
*get = *Chemistry::OpenBabelc::vectorRing_get;
*set = *Chemistry::OpenBabelc::vectorRing_set;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vectorRing($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBGlobalDataBase ##############

package Chemistry::OpenBabel::OBGlobalDataBase;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBGlobalDataBase(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBGlobalDataBase($self);
        delete $OWNER{$self};
    }
}

*Init = *Chemistry::OpenBabelc::OBGlobalDataBase_Init;
*GetSize = *Chemistry::OpenBabelc::OBGlobalDataBase_GetSize;
*SetReadDirectory = *Chemistry::OpenBabelc::OBGlobalDataBase_SetReadDirectory;
*SetEnvironmentVariable = *Chemistry::OpenBabelc::OBGlobalDataBase_SetEnvironmentVariable;
*ParseLine = *Chemistry::OpenBabelc::OBGlobalDataBase_ParseLine;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBElement ##############

package Chemistry::OpenBabel::OBElement;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBElement(@_);
    bless $self, $pkg if defined($self);
}

*GetAtomicNum = *Chemistry::OpenBabelc::OBElement_GetAtomicNum;
*GetSymbol = *Chemistry::OpenBabelc::OBElement_GetSymbol;
*GetCovalentRad = *Chemistry::OpenBabelc::OBElement_GetCovalentRad;
*GetVdwRad = *Chemistry::OpenBabelc::OBElement_GetVdwRad;
*GetMass = *Chemistry::OpenBabelc::OBElement_GetMass;
*GetMaxBonds = *Chemistry::OpenBabelc::OBElement_GetMaxBonds;
*GetElectroNeg = *Chemistry::OpenBabelc::OBElement_GetElectroNeg;
*GetIonization = *Chemistry::OpenBabelc::OBElement_GetIonization;
*GetElectronAffinity = *Chemistry::OpenBabelc::OBElement_GetElectronAffinity;
*GetName = *Chemistry::OpenBabelc::OBElement_GetName;
*GetRed = *Chemistry::OpenBabelc::OBElement_GetRed;
*GetGreen = *Chemistry::OpenBabelc::OBElement_GetGreen;
*GetBlue = *Chemistry::OpenBabelc::OBElement_GetBlue;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBElement($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBElementTable ##############

package Chemistry::OpenBabel::OBElementTable;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel::OBGlobalDataBase Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBElementTable(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBElementTable($self);
        delete $OWNER{$self};
    }
}

*GetNumberOfElements = *Chemistry::OpenBabelc::OBElementTable_GetNumberOfElements;
*GetAtomicNum = *Chemistry::OpenBabelc::OBElementTable_GetAtomicNum;
*GetSymbol = *Chemistry::OpenBabelc::OBElementTable_GetSymbol;
*GetVdwRad = *Chemistry::OpenBabelc::OBElementTable_GetVdwRad;
*GetCovalentRad = *Chemistry::OpenBabelc::OBElementTable_GetCovalentRad;
*GetMass = *Chemistry::OpenBabelc::OBElementTable_GetMass;
*CorrectedBondRad = *Chemistry::OpenBabelc::OBElementTable_CorrectedBondRad;
*CorrectedVdwRad = *Chemistry::OpenBabelc::OBElementTable_CorrectedVdwRad;
*GetMaxBonds = *Chemistry::OpenBabelc::OBElementTable_GetMaxBonds;
*GetElectroNeg = *Chemistry::OpenBabelc::OBElementTable_GetElectroNeg;
*GetIonization = *Chemistry::OpenBabelc::OBElementTable_GetIonization;
*GetElectronAffinity = *Chemistry::OpenBabelc::OBElementTable_GetElectronAffinity;
*GetRGB = *Chemistry::OpenBabelc::OBElementTable_GetRGB;
*GetName = *Chemistry::OpenBabelc::OBElementTable_GetName;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBIsotopeTable ##############

package Chemistry::OpenBabel::OBIsotopeTable;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel::OBGlobalDataBase Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBIsotopeTable(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBIsotopeTable($self);
        delete $OWNER{$self};
    }
}

*GetExactMass = *Chemistry::OpenBabelc::OBIsotopeTable_GetExactMass;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBTypeTable ##############

package Chemistry::OpenBabel::OBTypeTable;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel::OBGlobalDataBase Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBTypeTable(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBTypeTable($self);
        delete $OWNER{$self};
    }
}

*SetFromType = *Chemistry::OpenBabelc::OBTypeTable_SetFromType;
*SetToType = *Chemistry::OpenBabelc::OBTypeTable_SetToType;
*Translate = *Chemistry::OpenBabelc::OBTypeTable_Translate;
*GetFromType = *Chemistry::OpenBabelc::OBTypeTable_GetFromType;
*GetToType = *Chemistry::OpenBabelc::OBTypeTable_GetToType;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBResidueData ##############

package Chemistry::OpenBabel::OBResidueData;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel::OBGlobalDataBase Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBResidueData(@_);
    bless $self, $pkg if defined($self);
}

*SetResName = *Chemistry::OpenBabelc::OBResidueData_SetResName;
*LookupBO = *Chemistry::OpenBabelc::OBResidueData_LookupBO;
*LookupType = *Chemistry::OpenBabelc::OBResidueData_LookupType;
*AssignBonds = *Chemistry::OpenBabelc::OBResidueData_AssignBonds;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBResidueData($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBStopwatch ##############

package Chemistry::OpenBabel::OBStopwatch;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
*Start = *Chemistry::OpenBabelc::OBStopwatch_Start;
*Lap = *Chemistry::OpenBabelc::OBStopwatch_Lap;
*Elapsed = *Chemistry::OpenBabelc::OBStopwatch_Elapsed;
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBStopwatch(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBStopwatch($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBSqrtTbl ##############

package Chemistry::OpenBabel::OBSqrtTbl;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBSqrtTbl(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBSqrtTbl($self);
        delete $OWNER{$self};
    }
}

*Sqrt = *Chemistry::OpenBabelc::OBSqrtTbl_Sqrt;
*Init = *Chemistry::OpenBabelc::OBSqrtTbl_Init;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::DoubleType ##############

package Chemistry::OpenBabel::DoubleType;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
*swig_hi_get = *Chemistry::OpenBabelc::DoubleType_hi_get;
*swig_hi_set = *Chemistry::OpenBabelc::DoubleType_hi_set;
*swig_lo_get = *Chemistry::OpenBabelc::DoubleType_lo_get;
*swig_lo_set = *Chemistry::OpenBabelc::DoubleType_lo_set;
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_DoubleType(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_DoubleType($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBRandom ##############

package Chemistry::OpenBabel::OBRandom;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBRandom(@_);
    bless $self, $pkg if defined($self);
}

*Seed = *Chemistry::OpenBabelc::OBRandom_Seed;
*TimeSeed = *Chemistry::OpenBabelc::OBRandom_TimeSeed;
*NextInt = *Chemistry::OpenBabelc::OBRandom_NextInt;
*NextFloat = *Chemistry::OpenBabelc::OBRandom_NextFloat;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBRandom($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::vector3 ##############

package Chemistry::OpenBabel::vector3;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_vector3(@_);
    bless $self, $pkg if defined($self);
}

*Set = *Chemistry::OpenBabelc::vector3_Set;
*SetX = *Chemistry::OpenBabelc::vector3_SetX;
*SetY = *Chemistry::OpenBabelc::vector3_SetY;
*SetZ = *Chemistry::OpenBabelc::vector3_SetZ;
*Get = *Chemistry::OpenBabelc::vector3_Get;
*randomUnitVector = *Chemistry::OpenBabelc::vector3_randomUnitVector;
*normalize = *Chemistry::OpenBabelc::vector3_normalize;
*length = *Chemistry::OpenBabelc::vector3_length;
*length_2 = *Chemistry::OpenBabelc::vector3_length_2;
*x = *Chemistry::OpenBabelc::vector3_x;
*y = *Chemistry::OpenBabelc::vector3_y;
*z = *Chemistry::OpenBabelc::vector3_z;
*distSq = *Chemistry::OpenBabelc::vector3_distSq;
*createOrthoVector = *Chemistry::OpenBabelc::vector3_createOrthoVector;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_vector3($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBFormat ##############

package Chemistry::OpenBabel::OBFormat;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
*ReadMolecule = *Chemistry::OpenBabelc::OBFormat_ReadMolecule;
*ReadChemObject = *Chemistry::OpenBabelc::OBFormat_ReadChemObject;
*WriteMolecule = *Chemistry::OpenBabelc::OBFormat_WriteMolecule;
*WriteChemObject = *Chemistry::OpenBabelc::OBFormat_WriteChemObject;
*Description = *Chemistry::OpenBabelc::OBFormat_Description;
*TargetClassDescription = *Chemistry::OpenBabelc::OBFormat_TargetClassDescription;
*GetType = *Chemistry::OpenBabelc::OBFormat_GetType;
*SpecificationURL = *Chemistry::OpenBabelc::OBFormat_SpecificationURL;
*GetMIMEType = *Chemistry::OpenBabelc::OBFormat_GetMIMEType;
*Flags = *Chemistry::OpenBabelc::OBFormat_Flags;
*SkipObjects = *Chemistry::OpenBabelc::OBFormat_SkipObjects;
*MakeNewInstance = *Chemistry::OpenBabelc::OBFormat_MakeNewInstance;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBFormat($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::CharPtrLess ##############

package Chemistry::OpenBabel::CharPtrLess;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
*__call__ = *Chemistry::OpenBabelc::CharPtrLess___call__;
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_CharPtrLess(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_CharPtrLess($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBConversion ##############

package Chemistry::OpenBabel::OBConversion;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBConversion(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBConversion($self);
        delete $OWNER{$self};
    }
}

*RegisterFormat = *Chemistry::OpenBabelc::OBConversion_RegisterFormat;
*FindFormat = *Chemistry::OpenBabelc::OBConversion_FindFormat;
*FormatFromExt = *Chemistry::OpenBabelc::OBConversion_FormatFromExt;
*FormatFromMIME = *Chemistry::OpenBabelc::OBConversion_FormatFromMIME;
*GetNextFormat = *Chemistry::OpenBabelc::OBConversion_GetNextFormat;
*Description = *Chemistry::OpenBabelc::OBConversion_Description;
*GetInStream = *Chemistry::OpenBabelc::OBConversion_GetInStream;
*GetOutStream = *Chemistry::OpenBabelc::OBConversion_GetOutStream;
*SetInStream = *Chemistry::OpenBabelc::OBConversion_SetInStream;
*SetOutStream = *Chemistry::OpenBabelc::OBConversion_SetOutStream;
*SetInAndOutFormats = *Chemistry::OpenBabelc::OBConversion_SetInAndOutFormats;
*SetInFormat = *Chemistry::OpenBabelc::OBConversion_SetInFormat;
*SetOutFormat = *Chemistry::OpenBabelc::OBConversion_SetOutFormat;
*GetInFormat = *Chemistry::OpenBabelc::OBConversion_GetInFormat;
*GetOutFormat = *Chemistry::OpenBabelc::OBConversion_GetOutFormat;
*GetInFilename = *Chemistry::OpenBabelc::OBConversion_GetInFilename;
*GetInPos = *Chemistry::OpenBabelc::OBConversion_GetInPos;
*GetInLen = *Chemistry::OpenBabelc::OBConversion_GetInLen;
*GetTitle = *Chemistry::OpenBabelc::OBConversion_GetTitle;
*GetAuxConv = *Chemistry::OpenBabelc::OBConversion_GetAuxConv;
*SetAuxConv = *Chemistry::OpenBabelc::OBConversion_SetAuxConv;
*INOPTIONS = *Chemistry::OpenBabelc::OBConversion_INOPTIONS;
*OUTOPTIONS = *Chemistry::OpenBabelc::OBConversion_OUTOPTIONS;
*GENOPTIONS = *Chemistry::OpenBabelc::OBConversion_GENOPTIONS;
*IsOption = *Chemistry::OpenBabelc::OBConversion_IsOption;
*GetOptions = *Chemistry::OpenBabelc::OBConversion_GetOptions;
*AddOption = *Chemistry::OpenBabelc::OBConversion_AddOption;
*RemoveOption = *Chemistry::OpenBabelc::OBConversion_RemoveOption;
*SetOptions = *Chemistry::OpenBabelc::OBConversion_SetOptions;
*RegisterOptionParam = *Chemistry::OpenBabelc::OBConversion_RegisterOptionParam;
*GetOptionParams = *Chemistry::OpenBabelc::OBConversion_GetOptionParams;
*Convert = *Chemistry::OpenBabelc::OBConversion_Convert;
*FullConvert = *Chemistry::OpenBabelc::OBConversion_FullConvert;
*AddChemObject = *Chemistry::OpenBabelc::OBConversion_AddChemObject;
*GetChemObject = *Chemistry::OpenBabelc::OBConversion_GetChemObject;
*IsLast = *Chemistry::OpenBabelc::OBConversion_IsLast;
*IsFirstInput = *Chemistry::OpenBabelc::OBConversion_IsFirstInput;
*GetOutputIndex = *Chemistry::OpenBabelc::OBConversion_GetOutputIndex;
*SetOutputIndex = *Chemistry::OpenBabelc::OBConversion_SetOutputIndex;
*SetMoreFilesToCome = *Chemistry::OpenBabelc::OBConversion_SetMoreFilesToCome;
*SetOneObjectOnly = *Chemistry::OpenBabelc::OBConversion_SetOneObjectOnly;
*GetDefaultFormat = *Chemistry::OpenBabelc::OBConversion_GetDefaultFormat;
*Write = *Chemistry::OpenBabelc::OBConversion_Write;
*WriteString = *Chemistry::OpenBabelc::OBConversion_WriteString;
*WriteFile = *Chemistry::OpenBabelc::OBConversion_WriteFile;
*Read = *Chemistry::OpenBabelc::OBConversion_Read;
*ReadString = *Chemistry::OpenBabelc::OBConversion_ReadString;
*ReadFile = *Chemistry::OpenBabelc::OBConversion_ReadFile;
*BatchFileName = *Chemistry::OpenBabelc::OBConversion_BatchFileName;
*IncrementedFileName = *Chemistry::OpenBabelc::OBConversion_IncrementedFileName;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBResidue ##############

package Chemistry::OpenBabel::OBResidue;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBResidue(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBResidue($self);
        delete $OWNER{$self};
    }
}

*AddAtom = *Chemistry::OpenBabelc::OBResidue_AddAtom;
*InsertAtom = *Chemistry::OpenBabelc::OBResidue_InsertAtom;
*RemoveAtom = *Chemistry::OpenBabelc::OBResidue_RemoveAtom;
*Clear = *Chemistry::OpenBabelc::OBResidue_Clear;
*SetName = *Chemistry::OpenBabelc::OBResidue_SetName;
*SetNum = *Chemistry::OpenBabelc::OBResidue_SetNum;
*SetChain = *Chemistry::OpenBabelc::OBResidue_SetChain;
*SetChainNum = *Chemistry::OpenBabelc::OBResidue_SetChainNum;
*SetIdx = *Chemistry::OpenBabelc::OBResidue_SetIdx;
*SetAtomID = *Chemistry::OpenBabelc::OBResidue_SetAtomID;
*SetHetAtom = *Chemistry::OpenBabelc::OBResidue_SetHetAtom;
*SetSerialNum = *Chemistry::OpenBabelc::OBResidue_SetSerialNum;
*GetName = *Chemistry::OpenBabelc::OBResidue_GetName;
*GetNum = *Chemistry::OpenBabelc::OBResidue_GetNum;
*GetNumAtoms = *Chemistry::OpenBabelc::OBResidue_GetNumAtoms;
*GetChain = *Chemistry::OpenBabelc::OBResidue_GetChain;
*GetChainNum = *Chemistry::OpenBabelc::OBResidue_GetChainNum;
*GetIdx = *Chemistry::OpenBabelc::OBResidue_GetIdx;
*GetResKey = *Chemistry::OpenBabelc::OBResidue_GetResKey;
*GetAtoms = *Chemistry::OpenBabelc::OBResidue_GetAtoms;
*GetBonds = *Chemistry::OpenBabelc::OBResidue_GetBonds;
*GetAtomID = *Chemistry::OpenBabelc::OBResidue_GetAtomID;
*GetSerialNum = *Chemistry::OpenBabelc::OBResidue_GetSerialNum;
*GetAminoAcidProperty = *Chemistry::OpenBabelc::OBResidue_GetAminoAcidProperty;
*GetAtomProperty = *Chemistry::OpenBabelc::OBResidue_GetAtomProperty;
*GetResidueProperty = *Chemistry::OpenBabelc::OBResidue_GetResidueProperty;
*IsHetAtom = *Chemistry::OpenBabelc::OBResidue_IsHetAtom;
*IsResidueType = *Chemistry::OpenBabelc::OBResidue_IsResidueType;
*BeginAtom = *Chemistry::OpenBabelc::OBResidue_BeginAtom;
*NextAtom = *Chemistry::OpenBabelc::OBResidue_NextAtom;
*HasData = *Chemistry::OpenBabelc::OBResidue_HasData;
*DeleteData = *Chemistry::OpenBabelc::OBResidue_DeleteData;
*SetData = *Chemistry::OpenBabelc::OBResidue_SetData;
*DataSize = *Chemistry::OpenBabelc::OBResidue_DataSize;
*GetData = *Chemistry::OpenBabelc::OBResidue_GetData;
*BeginData = *Chemistry::OpenBabelc::OBResidue_BeginData;
*EndData = *Chemistry::OpenBabelc::OBResidue_EndData;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBAtom ##############

package Chemistry::OpenBabel::OBAtom;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBAtom(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBAtom($self);
        delete $OWNER{$self};
    }
}

*Clear = *Chemistry::OpenBabelc::OBAtom_Clear;
*SetIdx = *Chemistry::OpenBabelc::OBAtom_SetIdx;
*SetHyb = *Chemistry::OpenBabelc::OBAtom_SetHyb;
*SetAtomicNum = *Chemistry::OpenBabelc::OBAtom_SetAtomicNum;
*SetIsotope = *Chemistry::OpenBabelc::OBAtom_SetIsotope;
*SetImplicitValence = *Chemistry::OpenBabelc::OBAtom_SetImplicitValence;
*IncrementImplicitValence = *Chemistry::OpenBabelc::OBAtom_IncrementImplicitValence;
*DecrementImplicitValence = *Chemistry::OpenBabelc::OBAtom_DecrementImplicitValence;
*SetFormalCharge = *Chemistry::OpenBabelc::OBAtom_SetFormalCharge;
*SetSpinMultiplicity = *Chemistry::OpenBabelc::OBAtom_SetSpinMultiplicity;
*SetType = *Chemistry::OpenBabelc::OBAtom_SetType;
*SetPartialCharge = *Chemistry::OpenBabelc::OBAtom_SetPartialCharge;
*SetCoordPtr = *Chemistry::OpenBabelc::OBAtom_SetCoordPtr;
*SetVector = *Chemistry::OpenBabelc::OBAtom_SetVector;
*SetResidue = *Chemistry::OpenBabelc::OBAtom_SetResidue;
*UnsetAromatic = *Chemistry::OpenBabelc::OBAtom_UnsetAromatic;
*SetClockwiseStereo = *Chemistry::OpenBabelc::OBAtom_SetClockwiseStereo;
*SetAntiClockwiseStereo = *Chemistry::OpenBabelc::OBAtom_SetAntiClockwiseStereo;
*SetPositiveStereo = *Chemistry::OpenBabelc::OBAtom_SetPositiveStereo;
*SetNegativeStereo = *Chemistry::OpenBabelc::OBAtom_SetNegativeStereo;
*UnsetStereo = *Chemistry::OpenBabelc::OBAtom_UnsetStereo;
*SetInRing = *Chemistry::OpenBabelc::OBAtom_SetInRing;
*SetChiral = *Chemistry::OpenBabelc::OBAtom_SetChiral;
*ClearCoordPtr = *Chemistry::OpenBabelc::OBAtom_ClearCoordPtr;
*GetIsotope = *Chemistry::OpenBabelc::OBAtom_GetIsotope;
*GetSpinMultiplicity = *Chemistry::OpenBabelc::OBAtom_GetSpinMultiplicity;
*GetAtomicMass = *Chemistry::OpenBabelc::OBAtom_GetAtomicMass;
*GetExactMass = *Chemistry::OpenBabelc::OBAtom_GetExactMass;
*GetCoordinateIdx = *Chemistry::OpenBabelc::OBAtom_GetCoordinateIdx;
*GetCIdx = *Chemistry::OpenBabelc::OBAtom_GetCIdx;
*GetHeteroValence = *Chemistry::OpenBabelc::OBAtom_GetHeteroValence;
*GetType = *Chemistry::OpenBabelc::OBAtom_GetType;
*GetX = *Chemistry::OpenBabelc::OBAtom_GetX;
*GetY = *Chemistry::OpenBabelc::OBAtom_GetY;
*GetZ = *Chemistry::OpenBabelc::OBAtom_GetZ;
*x = *Chemistry::OpenBabelc::OBAtom_x;
*y = *Chemistry::OpenBabelc::OBAtom_y;
*z = *Chemistry::OpenBabelc::OBAtom_z;
*GetCoordinate = *Chemistry::OpenBabelc::OBAtom_GetCoordinate;
*GetVector = *Chemistry::OpenBabelc::OBAtom_GetVector;
*GetPartialCharge = *Chemistry::OpenBabelc::OBAtom_GetPartialCharge;
*GetResidue = *Chemistry::OpenBabelc::OBAtom_GetResidue;
*GetNewBondVector = *Chemistry::OpenBabelc::OBAtom_GetNewBondVector;
*GetBond = *Chemistry::OpenBabelc::OBAtom_GetBond;
*GetNextAtom = *Chemistry::OpenBabelc::OBAtom_GetNextAtom;
*BeginBonds = *Chemistry::OpenBabelc::OBAtom_BeginBonds;
*EndBonds = *Chemistry::OpenBabelc::OBAtom_EndBonds;
*BeginBond = *Chemistry::OpenBabelc::OBAtom_BeginBond;
*NextBond = *Chemistry::OpenBabelc::OBAtom_NextBond;
*BeginNbrAtom = *Chemistry::OpenBabelc::OBAtom_BeginNbrAtom;
*NextNbrAtom = *Chemistry::OpenBabelc::OBAtom_NextNbrAtom;
*GetDistance = *Chemistry::OpenBabelc::OBAtom_GetDistance;
*GetAngle = *Chemistry::OpenBabelc::OBAtom_GetAngle;
*NewResidue = *Chemistry::OpenBabelc::OBAtom_NewResidue;
*DeleteResidue = *Chemistry::OpenBabelc::OBAtom_DeleteResidue;
*AddBond = *Chemistry::OpenBabelc::OBAtom_AddBond;
*InsertBond = *Chemistry::OpenBabelc::OBAtom_InsertBond;
*DeleteBond = *Chemistry::OpenBabelc::OBAtom_DeleteBond;
*ClearBond = *Chemistry::OpenBabelc::OBAtom_ClearBond;
*CountFreeOxygens = *Chemistry::OpenBabelc::OBAtom_CountFreeOxygens;
*MemberOfRingSize = *Chemistry::OpenBabelc::OBAtom_MemberOfRingSize;
*SmallestBondAngle = *Chemistry::OpenBabelc::OBAtom_SmallestBondAngle;
*AverageBondAngle = *Chemistry::OpenBabelc::OBAtom_AverageBondAngle;
*BOSum = *Chemistry::OpenBabelc::OBAtom_BOSum;
*HtoMethyl = *Chemistry::OpenBabelc::OBAtom_HtoMethyl;
*SetHybAndGeom = *Chemistry::OpenBabelc::OBAtom_SetHybAndGeom;
*HasResidue = *Chemistry::OpenBabelc::OBAtom_HasResidue;
*IsHydrogen = *Chemistry::OpenBabelc::OBAtom_IsHydrogen;
*IsCarbon = *Chemistry::OpenBabelc::OBAtom_IsCarbon;
*IsNitrogen = *Chemistry::OpenBabelc::OBAtom_IsNitrogen;
*IsOxygen = *Chemistry::OpenBabelc::OBAtom_IsOxygen;
*IsSulfur = *Chemistry::OpenBabelc::OBAtom_IsSulfur;
*IsPhosphorus = *Chemistry::OpenBabelc::OBAtom_IsPhosphorus;
*IsHeteroatom = *Chemistry::OpenBabelc::OBAtom_IsHeteroatom;
*IsNotCorH = *Chemistry::OpenBabelc::OBAtom_IsNotCorH;
*IsConnected = *Chemistry::OpenBabelc::OBAtom_IsConnected;
*IsOneThree = *Chemistry::OpenBabelc::OBAtom_IsOneThree;
*IsOneFour = *Chemistry::OpenBabelc::OBAtom_IsOneFour;
*IsCarboxylOxygen = *Chemistry::OpenBabelc::OBAtom_IsCarboxylOxygen;
*IsPhosphateOxygen = *Chemistry::OpenBabelc::OBAtom_IsPhosphateOxygen;
*IsSulfateOxygen = *Chemistry::OpenBabelc::OBAtom_IsSulfateOxygen;
*IsNitroOxygen = *Chemistry::OpenBabelc::OBAtom_IsNitroOxygen;
*IsAmideNitrogen = *Chemistry::OpenBabelc::OBAtom_IsAmideNitrogen;
*IsPolarHydrogen = *Chemistry::OpenBabelc::OBAtom_IsPolarHydrogen;
*IsNonPolarHydrogen = *Chemistry::OpenBabelc::OBAtom_IsNonPolarHydrogen;
*IsAromaticNOxide = *Chemistry::OpenBabelc::OBAtom_IsAromaticNOxide;
*IsChiral = *Chemistry::OpenBabelc::OBAtom_IsChiral;
*IsAxial = *Chemistry::OpenBabelc::OBAtom_IsAxial;
*IsClockwise = *Chemistry::OpenBabelc::OBAtom_IsClockwise;
*IsAntiClockwise = *Chemistry::OpenBabelc::OBAtom_IsAntiClockwise;
*IsPositiveStereo = *Chemistry::OpenBabelc::OBAtom_IsPositiveStereo;
*IsNegativeStereo = *Chemistry::OpenBabelc::OBAtom_IsNegativeStereo;
*HasChiralitySpecified = *Chemistry::OpenBabelc::OBAtom_HasChiralitySpecified;
*HasChiralVolume = *Chemistry::OpenBabelc::OBAtom_HasChiralVolume;
*IsHbondAcceptor = *Chemistry::OpenBabelc::OBAtom_IsHbondAcceptor;
*IsHbondDonor = *Chemistry::OpenBabelc::OBAtom_IsHbondDonor;
*IsHbondDonorH = *Chemistry::OpenBabelc::OBAtom_IsHbondDonorH;
*HasAlphaBetaUnsat = *Chemistry::OpenBabelc::OBAtom_HasAlphaBetaUnsat;
*HasBondOfOrder = *Chemistry::OpenBabelc::OBAtom_HasBondOfOrder;
*CountBondsOfOrder = *Chemistry::OpenBabelc::OBAtom_CountBondsOfOrder;
*HasNonSingleBond = *Chemistry::OpenBabelc::OBAtom_HasNonSingleBond;
*HasSingleBond = *Chemistry::OpenBabelc::OBAtom_HasSingleBond;
*HasDoubleBond = *Chemistry::OpenBabelc::OBAtom_HasDoubleBond;
*HasAromaticBond = *Chemistry::OpenBabelc::OBAtom_HasAromaticBond;
*MatchesSMARTS = *Chemistry::OpenBabelc::OBAtom_MatchesSMARTS;
*HasData = *Chemistry::OpenBabelc::OBAtom_HasData;
*DeleteData = *Chemistry::OpenBabelc::OBAtom_DeleteData;
*SetData = *Chemistry::OpenBabelc::OBAtom_SetData;
*DataSize = *Chemistry::OpenBabelc::OBAtom_DataSize;
*GetData = *Chemistry::OpenBabelc::OBAtom_GetData;
*BeginData = *Chemistry::OpenBabelc::OBAtom_BeginData;
*EndData = *Chemistry::OpenBabelc::OBAtom_EndData;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBBond ##############

package Chemistry::OpenBabel::OBBond;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBBond(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBBond($self);
        delete $OWNER{$self};
    }
}

*SetIdx = *Chemistry::OpenBabelc::OBBond_SetIdx;
*SetBO = *Chemistry::OpenBabelc::OBBond_SetBO;
*SetBegin = *Chemistry::OpenBabelc::OBBond_SetBegin;
*SetEnd = *Chemistry::OpenBabelc::OBBond_SetEnd;
*SetLength = *Chemistry::OpenBabelc::OBBond_SetLength;
*Set = *Chemistry::OpenBabelc::OBBond_Set;
*SetKSingle = *Chemistry::OpenBabelc::OBBond_SetKSingle;
*SetKDouble = *Chemistry::OpenBabelc::OBBond_SetKDouble;
*SetKTriple = *Chemistry::OpenBabelc::OBBond_SetKTriple;
*SetAromatic = *Chemistry::OpenBabelc::OBBond_SetAromatic;
*SetHash = *Chemistry::OpenBabelc::OBBond_SetHash;
*SetWedge = *Chemistry::OpenBabelc::OBBond_SetWedge;
*SetUp = *Chemistry::OpenBabelc::OBBond_SetUp;
*SetDown = *Chemistry::OpenBabelc::OBBond_SetDown;
*SetInRing = *Chemistry::OpenBabelc::OBBond_SetInRing;
*UnsetAromatic = *Chemistry::OpenBabelc::OBBond_UnsetAromatic;
*UnsetKekule = *Chemistry::OpenBabelc::OBBond_UnsetKekule;
*GetBondOrder = *Chemistry::OpenBabelc::OBBond_GetBondOrder;
*GetFlags = *Chemistry::OpenBabelc::OBBond_GetFlags;
*GetBeginAtomIdx = *Chemistry::OpenBabelc::OBBond_GetBeginAtomIdx;
*GetEndAtomIdx = *Chemistry::OpenBabelc::OBBond_GetEndAtomIdx;
*GetBeginAtom = *Chemistry::OpenBabelc::OBBond_GetBeginAtom;
*GetEndAtom = *Chemistry::OpenBabelc::OBBond_GetEndAtom;
*GetNbrAtom = *Chemistry::OpenBabelc::OBBond_GetNbrAtom;
*GetEquibLength = *Chemistry::OpenBabelc::OBBond_GetEquibLength;
*GetLength = *Chemistry::OpenBabelc::OBBond_GetLength;
*GetNbrAtomIdx = *Chemistry::OpenBabelc::OBBond_GetNbrAtomIdx;
*IsRotor = *Chemistry::OpenBabelc::OBBond_IsRotor;
*IsAmide = *Chemistry::OpenBabelc::OBBond_IsAmide;
*IsPrimaryAmide = *Chemistry::OpenBabelc::OBBond_IsPrimaryAmide;
*IsSecondaryAmide = *Chemistry::OpenBabelc::OBBond_IsSecondaryAmide;
*IsEster = *Chemistry::OpenBabelc::OBBond_IsEster;
*IsCarbonyl = *Chemistry::OpenBabelc::OBBond_IsCarbonyl;
*IsSingle = *Chemistry::OpenBabelc::OBBond_IsSingle;
*IsDouble = *Chemistry::OpenBabelc::OBBond_IsDouble;
*IsTriple = *Chemistry::OpenBabelc::OBBond_IsTriple;
*IsKSingle = *Chemistry::OpenBabelc::OBBond_IsKSingle;
*IsKDouble = *Chemistry::OpenBabelc::OBBond_IsKDouble;
*IsKTriple = *Chemistry::OpenBabelc::OBBond_IsKTriple;
*IsUp = *Chemistry::OpenBabelc::OBBond_IsUp;
*IsDown = *Chemistry::OpenBabelc::OBBond_IsDown;
*IsWedge = *Chemistry::OpenBabelc::OBBond_IsWedge;
*IsHash = *Chemistry::OpenBabelc::OBBond_IsHash;
*IsDoubleBondGeometry = *Chemistry::OpenBabelc::OBBond_IsDoubleBondGeometry;
*HasData = *Chemistry::OpenBabelc::OBBond_HasData;
*DeleteData = *Chemistry::OpenBabelc::OBBond_DeleteData;
*SetData = *Chemistry::OpenBabelc::OBBond_SetData;
*DataSize = *Chemistry::OpenBabelc::OBBond_DataSize;
*GetData = *Chemistry::OpenBabelc::OBBond_GetData;
*BeginData = *Chemistry::OpenBabelc::OBBond_BeginData;
*EndData = *Chemistry::OpenBabelc::OBBond_EndData;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBMol ##############

package Chemistry::OpenBabel::OBMol;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBMol(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBMol($self);
        delete $OWNER{$self};
    }
}

*ReserveAtoms = *Chemistry::OpenBabelc::OBMol_ReserveAtoms;
*CreateAtom = *Chemistry::OpenBabelc::OBMol_CreateAtom;
*CreateBond = *Chemistry::OpenBabelc::OBMol_CreateBond;
*DestroyAtom = *Chemistry::OpenBabelc::OBMol_DestroyAtom;
*DestroyBond = *Chemistry::OpenBabelc::OBMol_DestroyBond;
*AddAtom = *Chemistry::OpenBabelc::OBMol_AddAtom;
*AddBond = *Chemistry::OpenBabelc::OBMol_AddBond;
*AddResidue = *Chemistry::OpenBabelc::OBMol_AddResidue;
*InsertAtom = *Chemistry::OpenBabelc::OBMol_InsertAtom;
*DeleteAtom = *Chemistry::OpenBabelc::OBMol_DeleteAtom;
*DeleteBond = *Chemistry::OpenBabelc::OBMol_DeleteBond;
*DeleteResidue = *Chemistry::OpenBabelc::OBMol_DeleteResidue;
*NewAtom = *Chemistry::OpenBabelc::OBMol_NewAtom;
*NewResidue = *Chemistry::OpenBabelc::OBMol_NewResidue;
*BeginModify = *Chemistry::OpenBabelc::OBMol_BeginModify;
*EndModify = *Chemistry::OpenBabelc::OBMol_EndModify;
*GetMod = *Chemistry::OpenBabelc::OBMol_GetMod;
*IncrementMod = *Chemistry::OpenBabelc::OBMol_IncrementMod;
*DecrementMod = *Chemistry::OpenBabelc::OBMol_DecrementMod;
*HasData = *Chemistry::OpenBabelc::OBMol_HasData;
*DeleteData = *Chemistry::OpenBabelc::OBMol_DeleteData;
*SetData = *Chemistry::OpenBabelc::OBMol_SetData;
*DataSize = *Chemistry::OpenBabelc::OBMol_DataSize;
*GetData = *Chemistry::OpenBabelc::OBMol_GetData;
*BeginData = *Chemistry::OpenBabelc::OBMol_BeginData;
*EndData = *Chemistry::OpenBabelc::OBMol_EndData;
*GetFlags = *Chemistry::OpenBabelc::OBMol_GetFlags;
*GetTitle = *Chemistry::OpenBabelc::OBMol_GetTitle;
*NumAtoms = *Chemistry::OpenBabelc::OBMol_NumAtoms;
*NumBonds = *Chemistry::OpenBabelc::OBMol_NumBonds;
*NumHvyAtoms = *Chemistry::OpenBabelc::OBMol_NumHvyAtoms;
*NumResidues = *Chemistry::OpenBabelc::OBMol_NumResidues;
*NumRotors = *Chemistry::OpenBabelc::OBMol_NumRotors;
*GetAtom = *Chemistry::OpenBabelc::OBMol_GetAtom;
*GetFirstAtom = *Chemistry::OpenBabelc::OBMol_GetFirstAtom;
*GetBond = *Chemistry::OpenBabelc::OBMol_GetBond;
*GetResidue = *Chemistry::OpenBabelc::OBMol_GetResidue;
*GetInternalCoord = *Chemistry::OpenBabelc::OBMol_GetInternalCoord;
*GetTorsion = *Chemistry::OpenBabelc::OBMol_GetTorsion;
*GetFormula = *Chemistry::OpenBabelc::OBMol_GetFormula;
*GetEnergy = *Chemistry::OpenBabelc::OBMol_GetEnergy;
*GetMolWt = *Chemistry::OpenBabelc::OBMol_GetMolWt;
*GetExactMass = *Chemistry::OpenBabelc::OBMol_GetExactMass;
*GetTotalCharge = *Chemistry::OpenBabelc::OBMol_GetTotalCharge;
*GetTotalSpinMultiplicity = *Chemistry::OpenBabelc::OBMol_GetTotalSpinMultiplicity;
*GetDimension = *Chemistry::OpenBabelc::OBMol_GetDimension;
*GetCoordinates = *Chemistry::OpenBabelc::OBMol_GetCoordinates;
*GetSSSR = *Chemistry::OpenBabelc::OBMol_GetSSSR;
*AutomaticFormalCharge = *Chemistry::OpenBabelc::OBMol_AutomaticFormalCharge;
*AutomaticPartialCharge = *Chemistry::OpenBabelc::OBMol_AutomaticPartialCharge;
*SetTitle = *Chemistry::OpenBabelc::OBMol_SetTitle;
*SetFormula = *Chemistry::OpenBabelc::OBMol_SetFormula;
*SetEnergy = *Chemistry::OpenBabelc::OBMol_SetEnergy;
*SetDimension = *Chemistry::OpenBabelc::OBMol_SetDimension;
*SetTotalCharge = *Chemistry::OpenBabelc::OBMol_SetTotalCharge;
*SetTotalSpinMultiplicity = *Chemistry::OpenBabelc::OBMol_SetTotalSpinMultiplicity;
*SetInternalCoord = *Chemistry::OpenBabelc::OBMol_SetInternalCoord;
*SetAutomaticFormalCharge = *Chemistry::OpenBabelc::OBMol_SetAutomaticFormalCharge;
*SetAutomaticPartialCharge = *Chemistry::OpenBabelc::OBMol_SetAutomaticPartialCharge;
*SetAromaticPerceived = *Chemistry::OpenBabelc::OBMol_SetAromaticPerceived;
*SetSSSRPerceived = *Chemistry::OpenBabelc::OBMol_SetSSSRPerceived;
*SetRingAtomsAndBondsPerceived = *Chemistry::OpenBabelc::OBMol_SetRingAtomsAndBondsPerceived;
*SetAtomTypesPerceived = *Chemistry::OpenBabelc::OBMol_SetAtomTypesPerceived;
*SetChainsPerceived = *Chemistry::OpenBabelc::OBMol_SetChainsPerceived;
*SetChiralityPerceived = *Chemistry::OpenBabelc::OBMol_SetChiralityPerceived;
*SetPartialChargesPerceived = *Chemistry::OpenBabelc::OBMol_SetPartialChargesPerceived;
*SetHybridizationPerceived = *Chemistry::OpenBabelc::OBMol_SetHybridizationPerceived;
*SetImplicitValencePerceived = *Chemistry::OpenBabelc::OBMol_SetImplicitValencePerceived;
*SetKekulePerceived = *Chemistry::OpenBabelc::OBMol_SetKekulePerceived;
*SetClosureBondsPerceived = *Chemistry::OpenBabelc::OBMol_SetClosureBondsPerceived;
*SetHydrogensAdded = *Chemistry::OpenBabelc::OBMol_SetHydrogensAdded;
*SetCorrectedForPH = *Chemistry::OpenBabelc::OBMol_SetCorrectedForPH;
*SetAromaticCorrected = *Chemistry::OpenBabelc::OBMol_SetAromaticCorrected;
*SetSpinMultiplicityAssigned = *Chemistry::OpenBabelc::OBMol_SetSpinMultiplicityAssigned;
*SetFlags = *Chemistry::OpenBabelc::OBMol_SetFlags;
*UnsetAromaticPerceived = *Chemistry::OpenBabelc::OBMol_UnsetAromaticPerceived;
*UnsetPartialChargesPerceived = *Chemistry::OpenBabelc::OBMol_UnsetPartialChargesPerceived;
*UnsetImplicitValencePerceived = *Chemistry::OpenBabelc::OBMol_UnsetImplicitValencePerceived;
*UnsetFlag = *Chemistry::OpenBabelc::OBMol_UnsetFlag;
*ClassDescription = *Chemistry::OpenBabelc::OBMol_ClassDescription;
*Clear = *Chemistry::OpenBabelc::OBMol_Clear;
*RenumberAtoms = *Chemistry::OpenBabelc::OBMol_RenumberAtoms;
*ToInertialFrame = *Chemistry::OpenBabelc::OBMol_ToInertialFrame;
*Translate = *Chemistry::OpenBabelc::OBMol_Translate;
*Rotate = *Chemistry::OpenBabelc::OBMol_Rotate;
*Kekulize = *Chemistry::OpenBabelc::OBMol_Kekulize;
*PerceiveKekuleBonds = *Chemistry::OpenBabelc::OBMol_PerceiveKekuleBonds;
*NewPerceiveKekuleBonds = *Chemistry::OpenBabelc::OBMol_NewPerceiveKekuleBonds;
*DeleteHydrogen = *Chemistry::OpenBabelc::OBMol_DeleteHydrogen;
*DeleteHydrogens = *Chemistry::OpenBabelc::OBMol_DeleteHydrogens;
*DeleteNonPolarHydrogens = *Chemistry::OpenBabelc::OBMol_DeleteNonPolarHydrogens;
*AddHydrogens = *Chemistry::OpenBabelc::OBMol_AddHydrogens;
*AddPolarHydrogens = *Chemistry::OpenBabelc::OBMol_AddPolarHydrogens;
*StripSalts = *Chemistry::OpenBabelc::OBMol_StripSalts;
*ConvertDativeBonds = *Chemistry::OpenBabelc::OBMol_ConvertDativeBonds;
*CorrectForPH = *Chemistry::OpenBabelc::OBMol_CorrectForPH;
*AssignSpinMultiplicity = *Chemistry::OpenBabelc::OBMol_AssignSpinMultiplicity;
*Center = *Chemistry::OpenBabelc::OBMol_Center;
*SetTorsion = *Chemistry::OpenBabelc::OBMol_SetTorsion;
*FindSSSR = *Chemistry::OpenBabelc::OBMol_FindSSSR;
*FindRingAtomsAndBonds = *Chemistry::OpenBabelc::OBMol_FindRingAtomsAndBonds;
*FindChiralCenters = *Chemistry::OpenBabelc::OBMol_FindChiralCenters;
*FindChildren = *Chemistry::OpenBabelc::OBMol_FindChildren;
*FindLargestFragment = *Chemistry::OpenBabelc::OBMol_FindLargestFragment;
*ContigFragList = *Chemistry::OpenBabelc::OBMol_ContigFragList;
*Align = *Chemistry::OpenBabelc::OBMol_Align;
*ConnectTheDots = *Chemistry::OpenBabelc::OBMol_ConnectTheDots;
*PerceiveBondOrders = *Chemistry::OpenBabelc::OBMol_PerceiveBondOrders;
*FindTorsions = *Chemistry::OpenBabelc::OBMol_FindTorsions;
*GetGTDVector = *Chemistry::OpenBabelc::OBMol_GetGTDVector;
*GetGIVector = *Chemistry::OpenBabelc::OBMol_GetGIVector;
*GetGIDVector = *Chemistry::OpenBabelc::OBMol_GetGIDVector;
*Has2D = *Chemistry::OpenBabelc::OBMol_Has2D;
*Has3D = *Chemistry::OpenBabelc::OBMol_Has3D;
*HasNonZeroCoords = *Chemistry::OpenBabelc::OBMol_HasNonZeroCoords;
*HasAromaticPerceived = *Chemistry::OpenBabelc::OBMol_HasAromaticPerceived;
*HasSSSRPerceived = *Chemistry::OpenBabelc::OBMol_HasSSSRPerceived;
*HasRingAtomsAndBondsPerceived = *Chemistry::OpenBabelc::OBMol_HasRingAtomsAndBondsPerceived;
*HasAtomTypesPerceived = *Chemistry::OpenBabelc::OBMol_HasAtomTypesPerceived;
*HasChiralityPerceived = *Chemistry::OpenBabelc::OBMol_HasChiralityPerceived;
*HasPartialChargesPerceived = *Chemistry::OpenBabelc::OBMol_HasPartialChargesPerceived;
*HasHybridizationPerceived = *Chemistry::OpenBabelc::OBMol_HasHybridizationPerceived;
*HasImplicitValencePerceived = *Chemistry::OpenBabelc::OBMol_HasImplicitValencePerceived;
*HasKekulePerceived = *Chemistry::OpenBabelc::OBMol_HasKekulePerceived;
*HasClosureBondsPerceived = *Chemistry::OpenBabelc::OBMol_HasClosureBondsPerceived;
*HasChainsPerceived = *Chemistry::OpenBabelc::OBMol_HasChainsPerceived;
*HasHydrogensAdded = *Chemistry::OpenBabelc::OBMol_HasHydrogensAdded;
*HasAromaticCorrected = *Chemistry::OpenBabelc::OBMol_HasAromaticCorrected;
*IsCorrectedForPH = *Chemistry::OpenBabelc::OBMol_IsCorrectedForPH;
*HasSpinMultiplicityAssigned = *Chemistry::OpenBabelc::OBMol_HasSpinMultiplicityAssigned;
*IsChiral = *Chemistry::OpenBabelc::OBMol_IsChiral;
*Empty = *Chemistry::OpenBabelc::OBMol_Empty;
*NumConformers = *Chemistry::OpenBabelc::OBMol_NumConformers;
*SetConformers = *Chemistry::OpenBabelc::OBMol_SetConformers;
*AddConformer = *Chemistry::OpenBabelc::OBMol_AddConformer;
*SetConformer = *Chemistry::OpenBabelc::OBMol_SetConformer;
*CopyConformer = *Chemistry::OpenBabelc::OBMol_CopyConformer;
*DeleteConformer = *Chemistry::OpenBabelc::OBMol_DeleteConformer;
*GetConformer = *Chemistry::OpenBabelc::OBMol_GetConformer;
*BeginConformer = *Chemistry::OpenBabelc::OBMol_BeginConformer;
*NextConformer = *Chemistry::OpenBabelc::OBMol_NextConformer;
*GetConformers = *Chemistry::OpenBabelc::OBMol_GetConformers;
*BeginAtom = *Chemistry::OpenBabelc::OBMol_BeginAtom;
*NextAtom = *Chemistry::OpenBabelc::OBMol_NextAtom;
*BeginBond = *Chemistry::OpenBabelc::OBMol_BeginBond;
*NextBond = *Chemistry::OpenBabelc::OBMol_NextBond;
*BeginResidue = *Chemistry::OpenBabelc::OBMol_BeginResidue;
*NextResidue = *Chemistry::OpenBabelc::OBMol_NextResidue;
*BeginInternalCoord = *Chemistry::OpenBabelc::OBMol_BeginInternalCoord;
*NextInternalCoord = *Chemistry::OpenBabelc::OBMol_NextInternalCoord;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBInternalCoord ##############

package Chemistry::OpenBabel::OBInternalCoord;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
*swig__a_get = *Chemistry::OpenBabelc::OBInternalCoord__a_get;
*swig__a_set = *Chemistry::OpenBabelc::OBInternalCoord__a_set;
*swig__b_get = *Chemistry::OpenBabelc::OBInternalCoord__b_get;
*swig__b_set = *Chemistry::OpenBabelc::OBInternalCoord__b_set;
*swig__c_get = *Chemistry::OpenBabelc::OBInternalCoord__c_get;
*swig__c_set = *Chemistry::OpenBabelc::OBInternalCoord__c_set;
*swig__dst_get = *Chemistry::OpenBabelc::OBInternalCoord__dst_get;
*swig__dst_set = *Chemistry::OpenBabelc::OBInternalCoord__dst_set;
*swig__ang_get = *Chemistry::OpenBabelc::OBInternalCoord__ang_get;
*swig__ang_set = *Chemistry::OpenBabelc::OBInternalCoord__ang_set;
*swig__tor_get = *Chemistry::OpenBabelc::OBInternalCoord__tor_get;
*swig__tor_set = *Chemistry::OpenBabelc::OBInternalCoord__tor_set;
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBInternalCoord(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBInternalCoord($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBRTree ##############

package Chemistry::OpenBabel::OBRTree;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBRTree(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBRTree($self);
        delete $OWNER{$self};
    }
}

*GetAtomIdx = *Chemistry::OpenBabelc::OBRTree_GetAtomIdx;
*PathToRoot = *Chemistry::OpenBabelc::OBRTree_PathToRoot;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBRing ##############

package Chemistry::OpenBabel::OBRing;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
*swig__path_get = *Chemistry::OpenBabelc::OBRing__path_get;
*swig__path_set = *Chemistry::OpenBabelc::OBRing__path_set;
*swig__pathset_get = *Chemistry::OpenBabelc::OBRing__pathset_get;
*swig__pathset_set = *Chemistry::OpenBabelc::OBRing__pathset_set;
*findCenterAndNormal = *Chemistry::OpenBabelc::OBRing_findCenterAndNormal;
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBRing(@_);
    bless $self, $pkg if defined($self);
}

*Size = *Chemistry::OpenBabelc::OBRing_Size;
*PathSize = *Chemistry::OpenBabelc::OBRing_PathSize;
*IsMember = *Chemistry::OpenBabelc::OBRing_IsMember;
*IsAromatic = *Chemistry::OpenBabelc::OBRing_IsAromatic;
*IsInRing = *Chemistry::OpenBabelc::OBRing_IsInRing;
*SetParent = *Chemistry::OpenBabelc::OBRing_SetParent;
*GetParent = *Chemistry::OpenBabelc::OBRing_GetParent;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBRing($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBRingSearch ##############

package Chemistry::OpenBabel::OBRingSearch;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBRingSearch(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBRingSearch($self);
        delete $OWNER{$self};
    }
}

*SortRings = *Chemistry::OpenBabelc::OBRingSearch_SortRings;
*RemoveRedundant = *Chemistry::OpenBabelc::OBRingSearch_RemoveRedundant;
*AddRingFromClosure = *Chemistry::OpenBabelc::OBRingSearch_AddRingFromClosure;
*WriteRings = *Chemistry::OpenBabelc::OBRingSearch_WriteRings;
*SaveUniqueRing = *Chemistry::OpenBabelc::OBRingSearch_SaveUniqueRing;
*BeginRings = *Chemistry::OpenBabelc::OBRingSearch_BeginRings;
*EndRings = *Chemistry::OpenBabelc::OBRingSearch_EndRings;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBSmartsPattern ##############

package Chemistry::OpenBabel::OBSmartsPattern;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBSmartsPattern($self);
        delete $OWNER{$self};
    }
}

sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBSmartsPattern(@_);
    bless $self, $pkg if defined($self);
}

*NumMatches = *Chemistry::OpenBabelc::OBSmartsPattern_NumMatches;
*NumAtoms = *Chemistry::OpenBabelc::OBSmartsPattern_NumAtoms;
*NumBonds = *Chemistry::OpenBabelc::OBSmartsPattern_NumBonds;
*GetAtomicNum = *Chemistry::OpenBabelc::OBSmartsPattern_GetAtomicNum;
*GetBond = *Chemistry::OpenBabelc::OBSmartsPattern_GetBond;
*GetCharge = *Chemistry::OpenBabelc::OBSmartsPattern_GetCharge;
*GetSMARTS = *Chemistry::OpenBabelc::OBSmartsPattern_GetSMARTS;
*GetVectorBinding = *Chemistry::OpenBabelc::OBSmartsPattern_GetVectorBinding;
*Empty = *Chemistry::OpenBabelc::OBSmartsPattern_Empty;
*IsValid = *Chemistry::OpenBabelc::OBSmartsPattern_IsValid;
*Init = *Chemistry::OpenBabelc::OBSmartsPattern_Init;
*WriteMapList = *Chemistry::OpenBabelc::OBSmartsPattern_WriteMapList;
*Match = *Chemistry::OpenBabelc::OBSmartsPattern_Match;
*RestrictedMatch = *Chemistry::OpenBabelc::OBSmartsPattern_RestrictedMatch;
*GetMapList = *Chemistry::OpenBabelc::OBSmartsPattern_GetMapList;
*GetUMapList = *Chemistry::OpenBabelc::OBSmartsPattern_GetUMapList;
*BeginMList = *Chemistry::OpenBabelc::OBSmartsPattern_BeginMList;
*EndMList = *Chemistry::OpenBabelc::OBSmartsPattern_EndMList;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


############# Class : Chemistry::OpenBabel::OBSSMatch ##############

package Chemistry::OpenBabel::OBSSMatch;
use vars qw(@ISA %OWNER %ITERATORS %BLESSEDMEMBERS);
@ISA = qw( Chemistry::OpenBabel );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my $self = Chemistry::OpenBabelc::new_OBSSMatch(@_);
    bless $self, $pkg if defined($self);
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Chemistry::OpenBabelc::delete_OBSSMatch($self);
        delete $OWNER{$self};
    }
}

*Match = *Chemistry::OpenBabelc::OBSSMatch_Match;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
}

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
}


# ------- VARIABLE STUBS --------

package Chemistry::OpenBabel;

*FILE_SEP_CHAR = *Chemistry::OpenBabelc::FILE_SEP_CHAR;
*PI = *Chemistry::OpenBabelc::PI;
*RAD_TO_DEG = *Chemistry::OpenBabelc::RAD_TO_DEG;
*DEG_TO_RAD = *Chemistry::OpenBabelc::DEG_TO_RAD;

my %__VZero_hash;
tie %__VZero_hash,"Chemistry::OpenBabel::vector3", $Chemistry::OpenBabelc::VZero;
$VZero= \%__VZero_hash;
bless $VZero, Chemistry::OpenBabel::vector3;

my %__VX_hash;
tie %__VX_hash,"Chemistry::OpenBabel::vector3", $Chemistry::OpenBabelc::VX;
$VX= \%__VX_hash;
bless $VX, Chemistry::OpenBabel::vector3;

my %__VY_hash;
tie %__VY_hash,"Chemistry::OpenBabel::vector3", $Chemistry::OpenBabelc::VY;
$VY= \%__VY_hash;
bless $VY, Chemistry::OpenBabel::vector3;

my %__VZ_hash;
tie %__VZ_hash,"Chemistry::OpenBabel::vector3", $Chemistry::OpenBabelc::VZ;
$VZ= \%__VZ_hash;
bless $VZ, Chemistry::OpenBabel::vector3;
*NOTREADABLE = *Chemistry::OpenBabelc::NOTREADABLE;
*READONEONLY = *Chemistry::OpenBabelc::READONEONLY;
*READBINARY = *Chemistry::OpenBabelc::READBINARY;
*NOTWRITABLE = *Chemistry::OpenBabelc::NOTWRITABLE;
*WRITEONEONLY = *Chemistry::OpenBabelc::WRITEONEONLY;
*WRITEBINARY = *Chemistry::OpenBabelc::WRITEBINARY;
*DEFAULTFORMAT = *Chemistry::OpenBabelc::DEFAULTFORMAT;
*OB_4RING_ATOM = *Chemistry::OpenBabelc::OB_4RING_ATOM;
*OB_3RING_ATOM = *Chemistry::OpenBabelc::OB_3RING_ATOM;
*OB_AROMATIC_ATOM = *Chemistry::OpenBabelc::OB_AROMATIC_ATOM;
*OB_RING_ATOM = *Chemistry::OpenBabelc::OB_RING_ATOM;
*OB_CSTEREO_ATOM = *Chemistry::OpenBabelc::OB_CSTEREO_ATOM;
*OB_ACSTEREO_ATOM = *Chemistry::OpenBabelc::OB_ACSTEREO_ATOM;
*OB_DONOR_ATOM = *Chemistry::OpenBabelc::OB_DONOR_ATOM;
*OB_ACCEPTOR_ATOM = *Chemistry::OpenBabelc::OB_ACCEPTOR_ATOM;
*OB_CHIRAL_ATOM = *Chemistry::OpenBabelc::OB_CHIRAL_ATOM;
*OB_POS_CHIRAL_ATOM = *Chemistry::OpenBabelc::OB_POS_CHIRAL_ATOM;
*OB_NEG_CHIRAL_ATOM = *Chemistry::OpenBabelc::OB_NEG_CHIRAL_ATOM;
*OB_AROMATIC_BOND = *Chemistry::OpenBabelc::OB_AROMATIC_BOND;
*OB_WEDGE_BOND = *Chemistry::OpenBabelc::OB_WEDGE_BOND;
*OB_HASH_BOND = *Chemistry::OpenBabelc::OB_HASH_BOND;
*OB_RING_BOND = *Chemistry::OpenBabelc::OB_RING_BOND;
*OB_TORUP_BOND = *Chemistry::OpenBabelc::OB_TORUP_BOND;
*OB_TORDOWN_BOND = *Chemistry::OpenBabelc::OB_TORDOWN_BOND;
*OB_KSINGLE_BOND = *Chemistry::OpenBabelc::OB_KSINGLE_BOND;
*OB_KDOUBLE_BOND = *Chemistry::OpenBabelc::OB_KDOUBLE_BOND;
*OB_KTRIPLE_BOND = *Chemistry::OpenBabelc::OB_KTRIPLE_BOND;
*OB_CLOSURE_BOND = *Chemistry::OpenBabelc::OB_CLOSURE_BOND;
*OB_SSSR_MOL = *Chemistry::OpenBabelc::OB_SSSR_MOL;
*OB_RINGFLAGS_MOL = *Chemistry::OpenBabelc::OB_RINGFLAGS_MOL;
*OB_AROMATIC_MOL = *Chemistry::OpenBabelc::OB_AROMATIC_MOL;
*OB_ATOMTYPES_MOL = *Chemistry::OpenBabelc::OB_ATOMTYPES_MOL;
*OB_CHIRALITY_MOL = *Chemistry::OpenBabelc::OB_CHIRALITY_MOL;
*OB_PCHARGE_MOL = *Chemistry::OpenBabelc::OB_PCHARGE_MOL;
*OB_HYBRID_MOL = *Chemistry::OpenBabelc::OB_HYBRID_MOL;
*OB_IMPVAL_MOL = *Chemistry::OpenBabelc::OB_IMPVAL_MOL;
*OB_KEKULE_MOL = *Chemistry::OpenBabelc::OB_KEKULE_MOL;
*OB_CLOSURE_MOL = *Chemistry::OpenBabelc::OB_CLOSURE_MOL;
*OB_H_ADDED_MOL = *Chemistry::OpenBabelc::OB_H_ADDED_MOL;
*OB_PH_CORRECTED_MOL = *Chemistry::OpenBabelc::OB_PH_CORRECTED_MOL;
*OB_AROM_CORRECTED_MOL = *Chemistry::OpenBabelc::OB_AROM_CORRECTED_MOL;
*OB_CHAINS_MOL = *Chemistry::OpenBabelc::OB_CHAINS_MOL;
*OB_TCHARGE_MOL = *Chemistry::OpenBabelc::OB_TCHARGE_MOL;
*OB_TSPIN_MOL = *Chemistry::OpenBabelc::OB_TSPIN_MOL;
*OB_CURRENT_CONFORMER = *Chemistry::OpenBabelc::OB_CURRENT_CONFORMER;

my %__etab_hash;
tie %__etab_hash,"Chemistry::OpenBabel::OBElementTable", $Chemistry::OpenBabelc::etab;
$etab= \%__etab_hash;
bless $etab, Chemistry::OpenBabel::OBElementTable;

my %__ttab_hash;
tie %__ttab_hash,"Chemistry::OpenBabel::OBTypeTable", $Chemistry::OpenBabelc::ttab;
$ttab= \%__ttab_hash;
bless $ttab, Chemistry::OpenBabel::OBTypeTable;

my %__isotab_hash;
tie %__isotab_hash,"Chemistry::OpenBabel::OBIsotopeTable", $Chemistry::OpenBabelc::isotab;
$isotab= \%__isotab_hash;
bless $isotab, Chemistry::OpenBabel::OBIsotopeTable;
*aromtyper = *Chemistry::OpenBabelc::aromtyper;
*atomtyper = *Chemistry::OpenBabelc::atomtyper;
*chainsparser = *Chemistry::OpenBabelc::chainsparser;

my %__resdat_hash;
tie %__resdat_hash,"Chemistry::OpenBabel::OBResidueData", $Chemistry::OpenBabelc::resdat;
$resdat= \%__resdat_hash;
bless $resdat, Chemistry::OpenBabel::OBResidueData;
*BUFF_SIZE = *Chemistry::OpenBabelc::BUFF_SIZE;
*AE_LEAF = *Chemistry::OpenBabelc::AE_LEAF;
*AE_RECUR = *Chemistry::OpenBabelc::AE_RECUR;
*AE_NOT = *Chemistry::OpenBabelc::AE_NOT;
*AE_ANDHI = *Chemistry::OpenBabelc::AE_ANDHI;
*AE_OR = *Chemistry::OpenBabelc::AE_OR;
*AE_ANDLO = *Chemistry::OpenBabelc::AE_ANDLO;
*AL_CONST = *Chemistry::OpenBabelc::AL_CONST;
*AL_MASS = *Chemistry::OpenBabelc::AL_MASS;
*AL_AROM = *Chemistry::OpenBabelc::AL_AROM;
*AL_ELEM = *Chemistry::OpenBabelc::AL_ELEM;
*AL_HCOUNT = *Chemistry::OpenBabelc::AL_HCOUNT;
*AL_NEGATIVE = *Chemistry::OpenBabelc::AL_NEGATIVE;
*AL_POSITIVE = *Chemistry::OpenBabelc::AL_POSITIVE;
*AL_CONNECT = *Chemistry::OpenBabelc::AL_CONNECT;
*AL_DEGREE = *Chemistry::OpenBabelc::AL_DEGREE;
*AL_IMPLICIT = *Chemistry::OpenBabelc::AL_IMPLICIT;
*AL_RINGS = *Chemistry::OpenBabelc::AL_RINGS;
*AL_SIZE = *Chemistry::OpenBabelc::AL_SIZE;
*AL_VALENCE = *Chemistry::OpenBabelc::AL_VALENCE;
*AL_CHIRAL = *Chemistry::OpenBabelc::AL_CHIRAL;
*AL_HYB = *Chemistry::OpenBabelc::AL_HYB;
*AL_CLOCKWISE = *Chemistry::OpenBabelc::AL_CLOCKWISE;
*AL_ANTICLOCKWISE = *Chemistry::OpenBabelc::AL_ANTICLOCKWISE;
1;
