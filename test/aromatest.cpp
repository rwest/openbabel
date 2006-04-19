/**********************************************************************
aromatest.cpp - Test Open Babel aromaticity perception

Copyright (C) 2005-2006 Geoffrey R. Hutchison
 
This file is part of the Open Babel project.
For more information, see <http://openbabel.sourceforge.net/>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation version 2 of the License.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
***********************************************************************/

#include "babelconfig.h"
#include "mol.h"
#include "obconversion.h"

#if !HAVE_STRNCASECMP
extern "C" int strncasecmp(const char *s1, const char *s2, size_t n);
#endif

#include <stdio.h>
#include <iostream>
#include <fstream>

using namespace std;
using namespace OpenBabel;

int main(int argc,char *argv[])
{
  if (argc != 2)
    {
      cout << "Usage: aromatest <file>" << endl;
      cout << " Tests aromaticity perception -- all non-hydrogen atoms"
	   << "   are expected to be aromatic." << endl;
      return(-1);
    }

  cout << endl << "# Testing aromaticity perception...  " << endl;
  
  ifstream ifs(argv[1]);
  if (!ifs)
    {
      cout << "Bail out! Cannot read input file!" << endl;
      return(-1);
    }
  
  OBConversion conv(&ifs, &cout);
  OBFormat* pFormat;
  
  pFormat = conv.FormatFromExt(argv[1]);
  if ( pFormat == NULL )
    {
      cout << "Bail out! Cannot read file format!" << endl;
      return(-1);
    }
  
  // Finally, we can do some work!
  OBMol mol;
  OBAtom *atom;
  
  unsigned int testCount = 1;

  if (! conv.SetInAndOutFormats(pFormat, pFormat))
    {
      cout << "Bail out! File format isn't loaded" << endl;
      return (-1);
    }
  
  int molCount = 0;
  while(ifs.peek() != EOF && ifs.good())
    {
      mol.Clear();
      conv.Read(&mol);
      molCount++;
      
      for(unsigned int i = 1;i <= mol.NumAtoms(); i++)
	{
	  atom = mol.GetAtom(i);
	  if (atom->IsHydrogen())
	    continue;

	  if (atom->IsAromatic())
	    cout << "ok " << testCount++ << endl;
	  else
	    {
	      cout << "not ok " << testCount++ << " # atom isn't aromatic!" 
		   << endl;
	      cout << "# atom idx " << i  
		   << " in molecule " << molCount << " "
		   << mol.GetTitle() << endl;
	    }
	}
	
    } // while reading molecules
    
  // output the number of tests run
   cout << "1.." << testCount-1 << endl;

  return(0);
}