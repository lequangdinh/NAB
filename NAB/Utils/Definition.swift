//
//  Definition.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//


public enum Unit: String {
    case Default = "default"
    case Metric = "metric"
    case Imperial = "imperial"
}

typealias SuccessCallback = (_ results : Dictionary<AnyHashable, Any>, _ errorCode : Int) -> ()
typealias FailureCallback = (_ results : Dictionary<AnyHashable, Any>, _ errorCode : Int) -> ()

