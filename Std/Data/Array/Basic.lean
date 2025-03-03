/-
Copyright (c) 2021 Floris van Doorn. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Arthur Paulino, Floris van Doorn
-/
import Std.Data.Array.Init.Basic

/-!
## Definitions on Arrays

This file contains various definitions on `Array`. It does not contain
proofs about these definitions, those are contained in other files in `Std.Data.Array`.
-/

namespace Array

/-- The array `#[0, 1, ..., n - 1]`. -/
def range (n : Nat) : Array Nat :=
  n.fold (flip Array.push) #[]

/-- Drop `none`s from a Array, and replace each remaining `some a` with `a`. -/
def reduceOption (l : Array (Option α)) : Array α :=
  l.filterMap id

/-- Turns `#[#[a₁, a₂, ⋯], #[b₁, b₂, ⋯], ⋯]` into `#[a₁, a₂, ⋯, b₁, b₂, ⋯]` -/
def flatten (arr : Array (Array α)) : Array α :=
  arr.foldl (init := #[]) fun acc a => acc.append a

/-- Turns `#[a, b]` into `#[(a, 0), (b, 1)]`. -/
def zipWithIndex (arr : Array α) : Array (α × Nat) :=
  arr.mapIdx fun i a => (a, i)
