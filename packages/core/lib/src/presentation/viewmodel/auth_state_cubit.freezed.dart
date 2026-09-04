// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStateInitial value)?  initial,TResult Function( AuthStateSignedOut value)?  signedOut,TResult Function( AuthStateSigningIn value)?  signingIn,TResult Function( AuthStateSignedIn value)?  signedIn,TResult Function( AuthStateErrorOccured value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStateInitial() when initial != null:
return initial(_that);case AuthStateSignedOut() when signedOut != null:
return signedOut(_that);case AuthStateSigningIn() when signingIn != null:
return signingIn(_that);case AuthStateSignedIn() when signedIn != null:
return signedIn(_that);case AuthStateErrorOccured() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStateInitial value)  initial,required TResult Function( AuthStateSignedOut value)  signedOut,required TResult Function( AuthStateSigningIn value)  signingIn,required TResult Function( AuthStateSignedIn value)  signedIn,required TResult Function( AuthStateErrorOccured value)  error,}){
final _that = this;
switch (_that) {
case AuthStateInitial():
return initial(_that);case AuthStateSignedOut():
return signedOut(_that);case AuthStateSigningIn():
return signingIn(_that);case AuthStateSignedIn():
return signedIn(_that);case AuthStateErrorOccured():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStateInitial value)?  initial,TResult? Function( AuthStateSignedOut value)?  signedOut,TResult? Function( AuthStateSigningIn value)?  signingIn,TResult? Function( AuthStateSignedIn value)?  signedIn,TResult? Function( AuthStateErrorOccured value)?  error,}){
final _that = this;
switch (_that) {
case AuthStateInitial() when initial != null:
return initial(_that);case AuthStateSignedOut() when signedOut != null:
return signedOut(_that);case AuthStateSigningIn() when signingIn != null:
return signingIn(_that);case AuthStateSignedIn() when signedIn != null:
return signedIn(_that);case AuthStateErrorOccured() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  signedOut,TResult Function()?  signingIn,TResult Function( String userId)?  signedIn,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStateInitial() when initial != null:
return initial();case AuthStateSignedOut() when signedOut != null:
return signedOut();case AuthStateSigningIn() when signingIn != null:
return signingIn();case AuthStateSignedIn() when signedIn != null:
return signedIn(_that.userId);case AuthStateErrorOccured() when error != null:
return error();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  signedOut,required TResult Function()  signingIn,required TResult Function( String userId)  signedIn,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case AuthStateInitial():
return initial();case AuthStateSignedOut():
return signedOut();case AuthStateSigningIn():
return signingIn();case AuthStateSignedIn():
return signedIn(_that.userId);case AuthStateErrorOccured():
return error();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  signedOut,TResult? Function()?  signingIn,TResult? Function( String userId)?  signedIn,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case AuthStateInitial() when initial != null:
return initial();case AuthStateSignedOut() when signedOut != null:
return signedOut();case AuthStateSigningIn() when signingIn != null:
return signingIn();case AuthStateSignedIn() when signedIn != null:
return signedIn(_that.userId);case AuthStateErrorOccured() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class AuthStateInitial extends AuthState with DiagnosticableTreeMixin {
  const AuthStateInitial(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AuthState.initial'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AuthState.initial()';
}


}




/// @nodoc


class AuthStateSignedOut extends AuthState with DiagnosticableTreeMixin {
  const AuthStateSignedOut(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AuthState.signedOut'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateSignedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AuthState.signedOut()';
}


}




/// @nodoc


class AuthStateSigningIn extends AuthState with DiagnosticableTreeMixin {
  const AuthStateSigningIn(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AuthState.signingIn'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateSigningIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AuthState.signingIn()';
}


}




/// @nodoc


class AuthStateSignedIn extends AuthState with DiagnosticableTreeMixin {
  const AuthStateSignedIn({required this.userId}): super._();
  

 final  String userId;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateSignedInCopyWith<AuthStateSignedIn> get copyWith => _$AuthStateSignedInCopyWithImpl<AuthStateSignedIn>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AuthState.signedIn'))
    ..add(DiagnosticsProperty('userId', userId));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateSignedIn&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,userId);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AuthState.signedIn(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AuthStateSignedInCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateSignedInCopyWith(AuthStateSignedIn value, $Res Function(AuthStateSignedIn) _then) = _$AuthStateSignedInCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$AuthStateSignedInCopyWithImpl<$Res>
    implements $AuthStateSignedInCopyWith<$Res> {
  _$AuthStateSignedInCopyWithImpl(this._self, this._then);

  final AuthStateSignedIn _self;
  final $Res Function(AuthStateSignedIn) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(AuthStateSignedIn(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthStateErrorOccured extends AuthState with DiagnosticableTreeMixin {
  const AuthStateErrorOccured(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'AuthState.error'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateErrorOccured);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'AuthState.error()';
}


}




// dart format on
