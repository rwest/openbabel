/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.30
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


public class vectorInt {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected vectorInt(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(vectorInt obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if(swigCPtr != 0 && swigCMemOwn) {
      swigCMemOwn = false;
      openbabelJNI.delete_vectorInt(swigCPtr);
    }
    swigCPtr = 0;
  }

  public vectorInt() {
    this(openbabelJNI.new_vectorInt__SWIG_0(), true);
  }

  public vectorInt(long n) {
    this(openbabelJNI.new_vectorInt__SWIG_1(n), true);
  }

  public long size() {
    return openbabelJNI.vectorInt_size(swigCPtr, this);
  }

  public long capacity() {
    return openbabelJNI.vectorInt_capacity(swigCPtr, this);
  }

  public void reserve(long n) {
    openbabelJNI.vectorInt_reserve(swigCPtr, this, n);
  }

  public boolean isEmpty() {
    return openbabelJNI.vectorInt_isEmpty(swigCPtr, this);
  }

  public void clear() {
    openbabelJNI.vectorInt_clear(swigCPtr, this);
  }

  public void add(int x) {
    openbabelJNI.vectorInt_add(swigCPtr, this, x);
  }

  public int get(int i) {
    return openbabelJNI.vectorInt_get(swigCPtr, this, i);
  }

  public void set(int i, int x) {
    openbabelJNI.vectorInt_set(swigCPtr, this, i, x);
  }

}
