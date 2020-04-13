# -*- encoding: utf-8 -*-
'''
@File    :   decorator.py
@Time    :   2020/03/21 08:32:20
@Author  :   Abelit
@Version :   1.0
@Contact :   ychenid@live.com
@Copyright :   (C)Copyright 2020, dataforum.org
Licence :   BSD-3-Clause
@Desc    :   None
'''


import functools
from flask import request


def role_required(roles=[], failed_callback=None):
    """
    Roles control decorator.
    Allow the access for current resource when at lease 1 role included
    args:
        roles - list, Allow access roles
        failed_callback - func, handler when access failed
    """

    def _role_required(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            if roles:
                return func(*args, **kwargs)
            if failed_callback:
                return failed_callback()
        return wrapper
    return _role_required


def permission_required(permissions=[], failed_callback=None):
    """
    Permissions control decorator.
    Allow the access for current resource when at lease 1 permission included
    args:
        permissions - list, Allow access roles
        failed_callback - func, handler when access failed
    """
    def _permission_required(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            print('%s %s():' % (permissions, func.__name__))
            if permissions:
                return func(*args, **kwargs)

            if failed_callback:
                return failed_callback()
        return wrapper
    return _permission_required
